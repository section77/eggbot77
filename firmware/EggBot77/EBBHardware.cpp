#include "EBBHardware.h"
#include "config.h"

#include <EEPROM.h>

#define EEPROM_PEN_UP_POS 0
#define EEPROM_PEN_DOWN_POS 2
#define EEPROM_PEN_UP_RATE 4
#define EEPROM_PEN_DOWN_RATE 6

#define DEFAULT_PULSE_WIDTH 500
#define MAX_PULSE_WIDTH 666
#define MIN_PULSE_WIDTH 666

EBBHardware::EBBHardware(Stream& stream)
    : EBBParser(stream)
    , mRotMotor(X_STEP_PIN, X_DIR_PIN)
    , mPenMotor(Y_STEP_PIN, Y_DIR_PIN)
    , mPenState(false)
    , mPenUpPos(DEFAULT_PULSE_WIDTH - 200) // can be overwritten from EBB-Command SC
    , mPenDownPos(DEFAULT_PULSE_WIDTH) // can be overwritten from EBB-Command SC
    , mServoRateUp(0)
    , mServoRateDown(0)
    , mMotorEnabled(false)
    , mPrgButtonState(false)
#ifdef PRG_BUTTON_PIN
    , mPrgButtonToggle(PRG_BUTTON_PIN)
#endif
#ifdef PEN_TOGGLE_BUTTON_PIN
    , mPenToggle(PEN_TOGGLE_BUTTON_PIN)
#endif
#ifdef MOTORS_BUTTON_PIN
    , mMotorsToggle(MOTORS_BUTTON_PIN)
#endif
{
}

void EBBHardware::init()
{
    EEPROM.get(EEPROM_PEN_UP_POS, mPenUpPos);
    EEPROM.get(EEPROM_PEN_DOWN_POS, mPenDownPos);
    EEPROM.get(EEPROM_PEN_UP_RATE, mServoRateUp);
    EEPROM.get(EEPROM_PEN_DOWN_RATE, mServoRateDown);

    pinMode(X_ENABLE_PIN, OUTPUT);
    pinMode(Y_ENABLE_PIN, OUTPUT);
    pinMode(ENGRAVER_PIN, OUTPUT);
    //mPenServo.attach(SERVO_PIN);

    enableMotor(0, false);
    enableMotor(1, false);
    setPenState(mPenState, 0);
}

void EBBHardware::processEvents()
{
#ifdef PRG_BUTTON_PIN
    if (mPrgButtonToggle.wasPressed()) {
        mPrgButtonState = true;
    }
#endif

#ifdef PEN_TOGGLE_BUTTON_PIN
    if (mPenToggle.wasPressed()) {
        setPenState(!getPenState(), 0);
    }
#endif

#ifdef MOTORS_BUTTON_PIN
    if (mMotorsToggle.wasPressed()) {
        if (mMotorEnabled) {
            enableMotor(0, false);
            enableMotor(1, false);
        } else {
            enableMotor(0, true);
            enableMotor(1, true);
        }
    }
#endif
    parseStream();

    mPenMotor.update();
    mRotMotor.update();
}

void EBBHardware::enableMotor(int axis, bool state)
{
    const uint8_t pin = (axis == 0) ? X_ENABLE_PIN : Y_ENABLE_PIN;

    digitalWrite(pin, state ? LOW : HIGH);

    mMotorEnabled = state;
}

void EBBHardware::stepperMove(int duration, int numPenSteps, int numRotSteps)
{
    moveToDestination();

    // Genuine EggBots are almost all using 16 microstepping.
    // A standard nema 17 stepper has 200 steps.
    // With 16 microstepping 200 * 16 = 3200 steps for a full revolution.
    // If your EggDuino does not have the same number of steps,
    // you need to adjust the inkscape plugin STEP_SCALE variable inside eggbot_conf.py.

    // set Coordinates and Speed
    if (numRotSteps == 0 && numPenSteps == 0) {
        delay(duration);
    } else {
        mRotMotor.setTarget(numRotSteps, duration);
        mPenMotor.setTarget(numPenSteps, duration);
    }
}

void EBBHardware::moveToDestination()
{
    while (mPenMotor.remainingSteps() || mRotMotor.remainingSteps()) {
        mPenMotor.update(); // Moving.... moving... moving....
        mRotMotor.update();
    }
}

void EBBHardware::setPinOutput(char port, int pin, int value)
{
    // PO,B,3,0 = disable engraver
    // PO,B,3,1 = enable engraver
    if (port == 'B' && pin == 3) {
        digitalWrite(ENGRAVER_PIN, value);
    }
}

void EBBHardware::setEngraverState(bool state, int power)
{
    digitalWrite(ENGRAVER_PIN, state);
}

void EBBHardware::setPenState(bool up, short delayMs)
{
    moveToDestination();

    if (up) {
        //mPenServo.write(mPenUpPos, mServoRateUp);
    } else {
        //mPenServo.write(mPenDownPos, mServoRateDown);
    }
    mPenState = up;

    delay(delayMs);
}

bool EBBHardware::getPenState()
{
    return mPenState;
}

void EBBHardware::setPenUpPos(int percent)
{
    // transformation from percent to PWM-Servo
    mPenUpPos = MIN_PULSE_WIDTH + (MAX_PULSE_WIDTH - MIN_PULSE_WIDTH) / 100.f * percent;
    EEPROM.put(EEPROM_PEN_UP_POS, mPenUpPos);
}

void EBBHardware::setPenDownPos(int percent)
{
    // transformation from percent to PWM-Servo
    mPenDownPos = MIN_PULSE_WIDTH + (MAX_PULSE_WIDTH - MIN_PULSE_WIDTH) / 100.f * percent;
    EEPROM.put(EEPROM_PEN_DOWN_POS, mPenDownPos);
}

void EBBHardware::setServoRateUp(int percentPerSecond)
{
    mServoRateUp = percentPerSecond;
    EEPROM.put(EEPROM_PEN_UP_RATE, mServoRateUp);
}

void EBBHardware::setServoRateDown(int percentPerSecond)
{
    mServoRateDown = percentPerSecond;
    EEPROM.put(EEPROM_PEN_DOWN_RATE, mServoRateDown);
}

bool EBBHardware::getPrgButtonState()
{
    bool state = mPrgButtonState;
    mPrgButtonState = false;
    return state;
}
