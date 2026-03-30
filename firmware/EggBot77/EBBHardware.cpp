#include "EBBHardware.h"
#include "config.h"

#include <EEPROM.h>

#define EEPROM_PEN_UP_POS 0
#define EEPROM_PEN_DOWN_POS 2

// https://rn-wissen.de/wiki/index.php/Servos
// width in µs
#define SERVO_MIN_PULSE_WIDTH 950
#define SERVO_MAX_PULSE_WIDTH 2050
#define SERVO_DEFAULT_PULSE_WIDTH 1500

EBBHardware::EBBHardware(Stream& stream)
    : EBBParser(stream)
    , mRotMotor(X_STEP_PIN, X_DIR_PIN)
    , mPenMotor(Y_STEP_PIN, Y_DIR_PIN)
    , mPenState(false)
    , mPenUpPos(SERVO_DEFAULT_PULSE_WIDTH - 200) // can be overwritten from EBB-Command SC
    , mPenDownPos(SERVO_DEFAULT_PULSE_WIDTH) // can be overwritten from EBB-Command SC
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

    pinMode(X_ENABLE_PIN, OUTPUT);
    pinMode(Y_ENABLE_PIN, OUTPUT);
#ifdef ENGRAVER_PIN
    pinMode(ENGRAVER_PIN, OUTPUT);
#endif
    //mPenServo.attach(SERVO_PIN);

    enableMotor(0, false);
    enableMotor(1, false);
    setPenState(mPenState, 0);

    // attach onboard LED to channel 1
    // arduino-esp32 version 2.x
    //ledcAttachPin(LED_BUILTIN, LED_BUILTIN_LEDC_CH);
    //ledcSetup(LED_BUILTIN_LEDC_CH, 1200, 10);

    // arduino-esp32 version 3.x
    ledcAttach(LED_BUILTIN, 1200, 10);


    // attach Servo PWM pin to channel 2
    // arduino-esp32 version 2.x
    //ledcAttachPin(SERVO_PIN, SERVO_PIN_LEDC_CH);
    //ledcSetup(SERVO_PIN_LEDC_CH, 50, 10);

    // arduino-esp32 version 3.x
    ledcAttach(SERVO_PIN, 50, 10);
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
#ifdef ENGRAVER_PIN
    if (port == 'B' && pin == 3) {
        digitalWrite(ENGRAVER_PIN, value);
    }
#endif
}

void EBBHardware::setEngraverState(bool state, int power)
{
#ifdef ENGRAVER_PIN
    digitalWrite(ENGRAVER_PIN, state);
#endif
}

void EBBHardware::setPenState(bool up, short delayMs)
{
    moveToDestination();
    uint16_t pwm_val = ((up)? mPenUpPos:mPenDownPos) / 20000.0f * 1024;
    ledcWrite(SERVO_PIN_LEDC_CH, pwm_val);
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
    mPenUpPos = SERVO_MIN_PULSE_WIDTH + (SERVO_MAX_PULSE_WIDTH - SERVO_MIN_PULSE_WIDTH) * percent / 100.f;
    EEPROM.put(EEPROM_PEN_UP_POS, mPenUpPos);
}

void EBBHardware::setPenDownPos(int percent)
{
    // transformation from percent to PWM-Servo
    mPenDownPos = SERVO_MIN_PULSE_WIDTH + (SERVO_MAX_PULSE_WIDTH - SERVO_MIN_PULSE_WIDTH) * percent / 100.f;
    EEPROM.put(EEPROM_PEN_DOWN_POS, mPenDownPos);
}

bool EBBHardware::getPrgButtonState()
{
    bool state = mPrgButtonState;
    mPrgButtonState = false;
    return state;
}
