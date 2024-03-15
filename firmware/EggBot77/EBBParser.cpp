#include "EBBParser.h"

EBBParser::EBBParser(Stream& stream)
    : mStream(stream)
    , mNodeCount(0)
    , mLayer(0)
{
    mReadBuffer.reserve(64);
}

void EBBParser::sendAck()
{
    mStream.print("OK\r\n");
}

void EBBParser::sendError()
{
    mStream.print("!8 Err: Unknown command\r\n");
}

void EBBParser::parseStream()
{
    if (!mStream.available())
        return;

    const char inChar = mStream.read();
    if (inChar != '\r') {
        if (mReadBuffer.length() < 64 && isprint(inChar))
            mReadBuffer += inChar;
        return;
    }

    char* str = mReadBuffer.begin();

//mStream.println(str);

    char* cmd = strsep(&str, ",");
    strupr (cmd);
    const char* arg1 = strsep(&str, ",");
    const char* arg2 = strsep(&str, ",");
    const char* arg3 = strsep(&str, ",");

    if (strcmp(cmd, "EM") == 0) {
        parseEM(arg1, arg2);
    } else if (strcmp(cmd, "ND") == 0) {
        parseND();
    } else if (strcmp(cmd, "NI") == 0) {
        parseNI();
    } else if (strcmp(cmd, "PD") == 0) {
        sendAck();
    } else if (strcmp(cmd, "PO") == 0) {
        parsePO(arg1, arg2, arg3);
    } else if (strcmp(cmd, "QB") == 0) {
        parseQB();
    } else if (strcmp(cmd, "QL") == 0) {
        parseQL();
    } else if (strcmp(cmd, "QN") == 0) {
        parseQN();
    } else if (strcmp(cmd, "QP") == 0) {
        parseQP();
    } else if (strcmp(cmd, "SC") == 0) {
        parseSC(arg1, arg2);
    } else if (strcmp(cmd, "SE") == 0) {
        parseSE(arg1, arg2, arg3);
    } else if (strcmp(cmd, "SL") == 0) {
        parseSL(arg1);
    } else if (strcmp(cmd, "SM") == 0) {
        parseSM(arg1, arg2, arg3);
    } else if (strcmp(cmd, "SN") == 0) {
        parseSN(arg1);
    } else if (strcmp(cmd, "SP") == 0) {
        parseSP(arg1, arg2, arg3);
    } else if (strcmp(cmd, "TP") == 0) {
        parseTP(arg1);
    } else if (strcmp(cmd, "V") == 0) {
        parseV();
    } else {
       mStream.print("!8 Err: Unknown command '");
       mStream.print(cmd);
       mStream.print("'\r\n");
    }

    mReadBuffer = "";
}

/**
"EM" — Enable Motors (for EBB hardware v1.1)

Command: EM,EnableAxis1[,EnableAxis2]<CR>
Response: OK<NL><CR>
Firmware versions: All
Execution: Immediate
Arguments: For each stepper motor (EnableAxis1 or EnableAxis2), an integer in
the range of 0 through 4, inclusive. The allowed values and their effects are as
follows:
0: Disable that axis
1: Enable in 1/8 step mode (default)
2: Enable in 1/4 step mode
3: Enable in 1/2 step mode
4: Enable in full step mode
Description:
Enable or disable stepper motors and set step size.

Each stepper motor axis may be enabled (energized) or disabled. When disabled,
the driver will stop sending current to the motor, so the motor will "freewheel"
— it will not be actively driven, but instead will present little resistance to
being turned by external torques.

When enabled, the stepper motor axes may be configured to be in whole, half,
quarter, or eighth step sizes. In a motor with a native resolution of 200 steps
per revolution, these settings would produce effective stepping resolutions of
200, 400, 800, and 1600 steps per revolution, respectively. Using fine sub-steps
("microstepping") gives higher resolution at the cost of decreasing step size
reproducibility.

Note that this version of the command is only for EBB hardware v1.1.
*/
void EBBParser::parseEM(const char* arg1, const char* arg2)
{
    if (arg1 == NULL) {
        sendError();
        return;
    }
    sendAck();

    const char* args[2] = { arg1, arg2 };
    for (int axis = 0; axis < 2; ++axis) {
        if (args[axis] != NULL) {
            // ignore microstepping parameter since the inskape plugin assume 16 by default.
            const bool state = atoi(args[axis]) != 0;
            enableMotor(axis, state);
        }
    }
}

/**
"ND" — Node Count Decrement

Command: ND<CR>
Response: OK<NL><CR>
Firmware versions: v1.9.5 and newer
Execution: Immediate
Description:
This command decrements the 32 bit Node Counter by 1.

See the "QN" command for a description of the node counter and its operations.

Version History: Added in v1.9.5
*/
void EBBParser::parseND()
{
    sendAck();
    mNodeCount--;
}

/**
"NI" — Node Count Increment

Command: NI<CR>
Response: OK<NL><CR>
Firmware versions: v1.9.5 and newer
Execution: Immediate
Description:
This command increments the 32 bit Node Counter by 1.

See the "QN" command for a description of the node counter and its operations.

Version History: Added in v1.9.5
*/
void EBBParser::parseNI()
{
    sendAck();
    mNodeCount++;
}

/**
"PO" — Pin Output

Command: PO,Port,Pin,Value<CR>
Response: OK<NL><CR>
Firmware versions: All
Execution: Immediate
Arguments:
Port: is one of the following letters: A,B,C,D,E. It specifies which port on the
processor is to be used for the output.
Pin: is an integer in the range from 0 through 7. It specifies the pin to be
used for the output.
Value: is either 0 or 1. It specifies the logical value to be output on the pin.
Description:
This command outputs a digital value of a 0 (0V) or 1 (3.3V) on one of the pins
on the processor, as specified by Port and Pin.

This command will not change a pin's direction to output first, so you must set
the pin's direction to be an output using the PD command first if you want
anything to come out of the pin.

This command is a very low-level I/O command. Many other higher level commands
(like SM, S2, etc.) will over-write the output state of pins that they need.
This commands allows you low-level access to every pin on the processor.

Example: PO,C,7,1\r This command would set the pin RC7 (or Port C, pin 7) to a
high value.
*/
void EBBParser::parsePO(const char* arg1, const char* arg2, const char* arg3)
{
    if (arg1 == NULL || arg2 == NULL || arg3 == NULL) {
        sendError();
        return;
    }
    sendAck();

    setPinOutput(arg1[0], atoi(arg2), atoi(arg3));
}

/**
"QB" — Query Button

Command: QB<CR>
Response: state<NL><CR>OK<NL><CR>
Firmware versions: v1.9.2 and newer
Execution: Immediate
Description:
This command asks the EBB if the PRG button has been pressed since the last QB
query or not.

The returned value state is 1 if the PRG button has been pressed since the last
QB query, and 0 otherwise.

Version History: Added in v1.9.2
*/
void EBBParser::parseQB()
{
    mStream.print(String(getPrgButtonState() ? '1' : '0') + "\r\n");
    sendAck();
}

/**
"QL" — Query Layer

Command: QL<CR>
Response: CurrentLayerValue<NL><CR>OK<NL><CR>
Firmware versions: v1.9.2 and newer
Execution: Immediate
Description:
This command asks the EBB to report back the current value of the Layer
variable. This variable is set with the SL command, as a single unsigned byte.

Example: QL\r
Example Return Packet: 4<NL><CR>OK<NL><CR>
Version History: Added in v1.9.2
*/
void EBBParser::parseQL()
{
    mStream.print(String(mLayer) + "\r\n");
    sendAck();
}

/**
"QN" — Query node count

Command: QN<CR>
Response: NodeCount<NL><CR>OK<NL><CR>
Firmware versions: v1.9.2 and newer
Execution: Immediate
Description: Query the value of the Node Counter.
This command asks the EBB what the current value of the Node Counter is. The
Node Counter is an unsigned long int (4 bytes) value that gets incremented or
decrimented with the NI and ND commands, or set to a particular value with the
SN command. The Node Counter can be used to keep track of progress during
various operations as needed.

The value of the node counter can also be manipulated with the following
commands:

SN — Set Node count
NI — Node count Increment
ND — Node count Decrement
CN — Clear node count [obsolete]
Example Return Packet: 1234567890<NL><CR> then OK<NL><CR>
Version History: Added in v1.9.2
*/
void EBBParser::parseQN()
{
    mStream.print(String(mNodeCount) + "\r\n");
    sendAck();
}

/**
"QP" — Query Pen

Command: QP<CR>
Response: PenStatus<NL><CR>OK<NL><CR>
Firmware versions: v1.9 and newer
Execution: Immediate
Description:
This command queries the EBB for the current pen state. It will return PenStatus
of 1 if the pen is up and 0 if the pen is down. If a pen up/down command is
pending in the FIFO, it will only report the new state of the pen after the pen
move has been started.

Example: QP\r
Example Return Packet: 1<NL><CR>OK<NL><CR>
Version History: Added in v1.9
*/
void EBBParser::parseQP()
{
    mStream.print(String(getPenState() ? '1' : '0') + "\r\n");
    sendAck();
}

/**
"SC" — Stepper and Servo Mode Configure

Command: SC,value1,value2<CR>
Response: OK<NL><CR>
Firmware versions: All
Execution: Immediate
Arguments:
value1 is an integer in the range from 0 to 255, which specifies the parameter
that you are adjusting.
value2 is an integer in the range from 0 to 65535. It specifies the value of the
parameter given by value1.
See the list of these parameters (value1) and allowed values (value2), below.
Description:00
This command allows you to configure the motor control modes that the EBB uses,
including parameters of the servo or solenoid motor used for raising and
lowering the pen, and how the stepper motor driver signals are directed.

The set of parameters and their allowed values is as follows:

SC,1,value2 Pen lift mechanism. value2 may be 0, 1 or 2. Early EggBot models
used a small solenoid, driven from an output signal on pin RB4.
SC,1,0 Enable only the solenoid output (RB4) for pen up/down movement.
SC,1,1 Enable only the RC servo output (RB1) for pen up/down movement.
SC,1,2 Enable both the solenoid (RB4) and RC servo (RB1) outputs for pen up/down
movement (default)
SC,2,value2 Stepper signal control. value2 may be 0, 1 or 2.
SC,2,0 Use microcontroller to control on-board stepper driver chips (default)
SC,2,1 Disconnect microcontroller from the on-board stepper motor drivers and
drive external step/direction motor drivers instead. In this mode, you can use
the microcontroller to control external step/direction drivers based on the
following pin assignments:
ENABLE1: RD1
ENABLE2: RA1
STEP1: RC6
DIR1: RC2
STEP2: RA5
DIR2: RA2
Note also that in this mode, you can externally drive the step/direction/enable
lines of the on board stepper motor drivers from the pins of J4 and J5. (Please
refer to the schematic for where these pins are broken out.)
SC,2,2 Disconnect microcontroller from both the built-in motor drivers and
external pins. All step/dir/enable pins on the PIC are set to inputs. This
allows you to control the on-board stepper motor driver chips externally with
your own step/dir/enable signals. Use the pins listed in the schematic from J5
and J4.
SC,4,servo_min Set the minimum value for the RC servo output position. servo_min
may be in the range 1 to 65535, in units of 83 ns intervals. This sets the "Pen
Up" position.
Default: 12000 (1.0 ms) on reset.
SC,5,servo_max Set the maximum value for the RC servo output position. servo_max
may be in the range 1 to 65535, in units of 83 ns intervals. This sets the "Pen
Down" position.
Default: 16000 (1.33 ms) on reset.
SC,8,maximum_S2_channels Sets the number of RC servo PWM channels, each of
S2_channel_duration_ms before cycling back to channel 1 for S2 command. Values
from 1 to 24 are valid for maximum_S2_channels.
Default: 8 on reset.
SC,9,S2_channel_duration_ms Set the number of milliseconds before firing the
next enabled channel for the S2 command. Values from 1 to 6 are valid for
S2_channel_duration_ms.
Default: 3 ms on reset.
SC,10,servo_rate Set rate of change of the servo position, for both raising and
lowering movements. Same units as rate parameter in S2 command.
SC,11,servo_rate_up Set the rate of change of the servo when going up. Same
units as rate parameter in S2 command.
SC,12,servo_rate_down Set the rate of change of the servo when going down. Same
units as rate parameter in S2 command.
SC,13,use_alt_pause - turns on (1) or off (0) alternate pause button function on
RB0. On by default. For EBB v1.1 boards, it uses RB2 instead.
Example: SC,4,8000\r Set the pen-up position to give a servo output of 8000,
about 0.66 ms.
Example: SC,1,1\r Enable only the RC servo for pen lift; disable solenoid
control output.
*/
void EBBParser::parseSC(const char* arg1, const char* arg2)
{
    if (arg1 == NULL || arg2 == NULL) {
        sendError();
        return;
    }

    int cmd = atoi(arg1);
    int value = atoi(arg2);
    switch (cmd) {
    case 4:
        // FIXME: val / 240 - 25 is the reverse from eggbot.py line 1056:1060
        // intTemp = 240 * ( self.options.penUpPosition + 25 )
        setPenUpPos(value / 240 - 25);
        setPenState (getPenState (), 0);
        break;
    case 5:
        setPenDownPos(value / 240 - 25);
        setPenState (getPenState (), 0);
        break;
    case 6: // rotMin=value;    ignored
        break;
    case 7: // rotMax=value;    ignored
        break;
    case 11:
        //setServoRateUp(value / 5); ignored
        break;
    case 12:
        //setServoRateDown(value / 5); ignored
        break;
    default:
        sendError();
        return;
    }
    sendAck();
}

/**
"SE" — Set Engraver

Command: SE,state[,power[,use_motion_queue]]<CR>
Response: OK<NL><CR>
Firmware versions: v2.1.0 and newer (with changes)
Execution: Added to FIFO motion queue
Arguments:
state may be either 0 to disable or 1 to enable the engraver output.
power is an optional argument, with allowed values of integers in the range 0 to
1023.
use_motion_queue is an optional argument, with allowed values of 0 (immediate)
or 1 (use motion queue).
Description:
This command is used to enable and disable the engraver PWM output on RB3
(called B3 on the board), and also set its output power. Use SE,0 to disable
this feature.

The power argument represents the power (duty cycle of the PWM signal), where 0
is always off and 1023 is always on. If this optional argument is not included,
then the power will be set at 512 (50%) duty cycle.

If the use_motion_queue parameter has the value of 1, then this SE command will
be added to the motion queue just like SM and SP commands, and thus will be
executed when the previous motion commands have finished. Note that if you need
to use this argument, the power argument is not optional. If use_motion_queue
has value 0 (or if it is omitted) the command is executed immediately, and is
not added to the queue.

Example: SE,1,1023\r Turns on the engraver output with maximum power
Example: SE,0\r Turns off the engraver output
Example: SE,0,0,1\r Adds a command to the motion queue, that (when executed)
turns off the engraver output.
*/
void EBBParser::parseSE(const char* arg1, const char* arg2, const char* arg3)
{
    if (arg1 == NULL) {
        sendError();
        return;
    }
    sendAck();

    const bool state = atoi(arg1);
    const int power = (arg2 != NULL) ? atoi(arg2) : 512;

    setEngraverState(state, power);
}

/**
"SL" — Set Layer

Command: SL,NewLayerValue<CR>
Response: OK<NL><CR>
Firmware versions: v1.9.2 and newer
Execution: Immediate
Arguments:
NewLayerValue is an integer between 0 and 127.
Description:
This command sets the value of the Layer variable, which can be read by the QL
query. This variable is a single unsigned byte, and is available for the user to
store a single variable as needed.

Example: SL,4\r Set the Layer variable to 4.
Example: SL,125\r Set the Layer variable to 125.
Version History: Added in v1.9.2
*/
void EBBParser::parseSL(const char* arg)
{
    if (arg == NULL) {
        sendError();
        return;
    }
    sendAck();

    mLayer = atoi(arg);
}

/**
"SM" — Stepper Move

Command: SM,duration,axis1[,axis2]<CR>
Response: OK<NL><CR>
Firmware versions: all (with changes)
Execution: Added to FIFO motion queue
Arguments:
duration is an integer in the range from 1 to 16777215, giving time in
milliseconds.
axis1 and axis2 are integers, each in the range from -16777215 to 16777215,
giving movement distance in steps.
Description:
Use this command to make the motors draw a straight line at constant velocity,
or to add a delay to the motion queue.

If both axis1 and axis2 are zero, then a delay of duration ms is executed. axis2
is an optional value, and if it is not included in the command, zero steps are
assumed for axis 2.

The sign of axis1 and axis2 represent the direction each motor should turn.

The minimum speed at which the EBB can generate steps for each motor is 1.31
steps/second. The maximum speed is 25,000 steps/second. If the SM command finds
that this speed range will be violated on either axis, it will output an error
message declaring such and it will not complete the move.

Note that internally the EBB generates an Interrupt Service Routine (ISR) at the
25 kHz rate. Each time the ISR fires, the EBB determines if a step needs to be
taken for a given axis or not. The practical result of this is that all steps
will be 'quantized' to the 25 kHz (40 μs) time intervals, and thus as the step
rate gets close to 25 kHz the 'correct' time between steps will not be
generated, but instead each step will land on a 40 μs tick in time. In almost
all cases normally used by the EBB, this doesn't make any difference because the
overall proper length for the entire move will be correct.

A value of 0 for duration is invalid and will be rejected.

The EBB firmware can sustain moves of 3ms of more continuously without any
inter-move gaps in time.

Example: SM,1000,250,-766\r Move axis1 by 250 steps and axis2 by -766 steps, in
1000 ms of duration.
*/
void EBBParser::parseSM(const char* arg1, const char* arg2, const char* arg3)
{
    if (arg1 == NULL || arg2 == NULL) {
        sendError();
        return;
    }
    sendAck();

    const int duration = atoi(arg1);
    const int axis1 = atoi(arg2);
    const int axis2 = (arg3 != NULL) ? atoi(arg3) : 0;

    stepperMove(duration, axis1, axis2);
}

/**
"SN" — Set node count

Command: SN,value<CR>
Response: OK<NL><CR>
Firmware versions: v1.9.5 and newer
Execution: Immediate
Arguments:
value is an unsigned long (four byte) integer.
Description:
This command sets the Node Counter to value.

See the "QN" command for a description of the node counter and its operations.

Example: SN,123456789\r Set node counter to 123456789.
Version History: Added in v1.9.5
*/
void EBBParser::parseSN(const char* arg)
{
    if (arg == NULL) {
        sendError();
        return;
    }
    sendAck();

    mNodeCount = atoi(arg);
}

/**
"SP" — Set Pen State

Command: SP,value[,duration[,portBpin]]<CR>
Response: OK<NL><CR>
Firmware versions: all (with changes)
Execution: Added to FIFO motion queue
Arguments:
value is either 0 or 1, indicating to raise or lower the pen.
duration (optional) is an integer from 1 to 65535, which gives a delay in
milliseconds.
portBpin (optional) is an integer from 0 through 7.
Description:
This command instructs the pen to go up or down.

When a value of 1 is used, the servo will be moved to the servo_min value (as
set by the "SC,4" command).
When a value of 0 is used, the servo will be moved to the servo_max value (as
set by the "SC,5" command below).
Note that conventionally, we have used the servo_min ("SC,4") value as the 'Pen
up position', and the servo_max ("SC,5") value as the 'Pen down position'.

The duration argument is in milliseconds. It represents the total length of time
between when the pen move is started, and when the next command will be
executed. Note that this is not related to how fast the pen moves, which is set
with the SC command. Rather, it is an intentional delay of a given duration, to
force the EBB not to execute the next command (often an SM) for some length of
time, which allows the pen move to complete and possibly some extra settling
time before moving the other motors.

If no duration argument is specified, a value of 0 milliseconds is used
internally.

The optional portBpin argument allows one to specify which portB pin of the MCU
the output will use. If none is specified, pin 1 (the default) will be used.

Default positions:The default position for the RC servo output (RB1) on reset is
the 'Pen up position' (servo_min), and at boot servo_min is set to 12000 which
results in a pulse width of 1.0 ms on boot. servo_max is set to 16000 on boot,
so the down position will be 1.33 ms unless changed with the "SC,5" Command.

Digital outputs: On older EBB hardware versions 1.1, 1.2 and 1.3, this command
will make the solenoid output turn on and off. On all EBB versions it will make
the RC servo output on RB1 move to the up or down position. Also, by default, it
will turn on RB4 or turn off RB4 as a simple digital output, so that you could
use this to trigger a laser for example.

Example: SP,1<CR> Move pen-lift servo motor to servo_min position.
*/
void EBBParser::parseSP(const char* arg1, const char* arg2, const char* arg3)
{
    if (arg1 == NULL) {
        sendError();
        return;
    }

    int cmd = atoi(arg1);
    if (cmd != 0 && cmd != 1) {
        sendError();
        return;
    }
    sendAck();

    const short delayMs = (arg2 != NULL) ? atoi(arg2) : 0;

    setPenState(cmd == 0 ? false : true, delayMs);
}

/**
"TP" — Toggle Pen

Command: TP[,duration]<CR>
Response: OK<NL><CR>
Firmware versions: v1.9 and newer
Execution: Immediate
Arguments:
duration: (Optional) an integer in the range of 1 to 65535, giving an delay in
milliseconds.
Description:
This command toggles the state of the pen (up->down and down->up). EBB firmware
resets with pen in 'up' (servo_min) state.

Note that conventionally, we have used the servo_min ("SC,4") value as the 'Pen
up position', and the servo_max ("SC,5") value as the 'Pen down position'.

The optional duration argument is in milliseconds. It represents the total
length of time between when the pen move is started, and when the next command
will be executed. Note that this is not related to how fast the pen moves, which
is set with the SC command. Rather, it is an intentional delay of a given
duration, to force the EBB not to execute the next command (often an SM) for
some length of time, which allows the pen move to complete and possibly some
extra settling time before moving the other motors.

If no duration argument is specified, a value of 0 milliseconds is used
internally.
*/
void EBBParser::parseTP(const char* arg)
{
    sendAck();

    const short delayMs = (arg != NULL) ? atoi(arg) : 0;

    setPenState(!getPenState(), delayMs);
}

/**
"V" — Version query

Command: V<CR>
Response: EBBv13_and_above EB Firmware Version 2.4.2<NL><CR>
Firmware versions: all
Execution: Immediate
Description:
This command prints out the version string of the firmware currently running on
the EBB. The actual version string returned may be different from the example
above.
*/
void EBBParser::parseV()
{
    mStream.print("EBBv13_and_above Protocol emulated by EggBot77-Firmware\r\n");
}
