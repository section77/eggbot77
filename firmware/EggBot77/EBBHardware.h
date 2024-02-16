#pragma once

// no homing sequence, switch-on position of pen will be taken as reference point.
// No collision-detection!!
// Supported Servos: I do not know, I use Arduino Servo Lib with TG9e- standard servo.
// Note: Maximum-Speed in Inkscape is 1000 Steps/s. You could enter more, but then Pythonscript
// sends nonsense.
// EBB-Coordinates are coming in for 16th-Microstepmode. The number of steps per revolution
// can be adjusted in eggbot_conf.py from the inkscape plugin.

#include "config.h"
#include "EBBParser.h"
#include "Button.h"
#include "Stepper.h"

//#include <VarSpeedServo.h>

class EBBHardware : public EBBParser {
public:
    EBBHardware(Stream& stream);

    void init();

    virtual void processEvents();

protected:
    virtual void enableMotor(int axis, bool state);
    virtual void stepperMove(int duration, int numPenSteps, int numRotSteps);

    virtual void setPenState(bool up, short delayMs);
    virtual bool getPenState();
    virtual void setPenUpPos(int percent);
    virtual void setPenDownPos(int percent);

    virtual bool getPrgButtonState();

    // only works for ENGRAVER_PIN if available
    virtual void setPinOutput(char port, int pin, int value);

    virtual void setEngraverState(bool state, int power);

private:
    void moveToDestination();

    Stepper mRotMotor;
    Stepper mPenMotor;

    bool mPenState;
    short mPenUpPos; // eeprom!
    short mPenDownPos; // eeprom!

    short mServoRateUp; // eeprom
    short mServoRateDown; // eeprom

    bool mMotorEnabled;

    bool mPrgButtonState;

// create Buttons
#ifdef PRG_BUTTON_PIN
    Button mPrgButtonToggle;
#endif
#ifdef PEN_TOGGLE_BUTTON_PIN
    Button mPenToggle;
#endif
#ifdef MOTORS_BUTTON_PIN
    Button mMotorsToggle;
#endif
};
