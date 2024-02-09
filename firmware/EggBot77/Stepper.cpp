#include "Stepper.h"
#include <Arduino.h>

Stepper::Stepper(char stepPin, char dirPin)
    : mStepPin(stepPin)
    , mDirPin(dirPin)
    , mNumSteps(0)
{
    pinMode(mDirPin, OUTPUT);
    digitalWrite(mDirPin, HIGH);

    pinMode(mStepPin, OUTPUT);
    digitalWrite(mStepPin, LOW);
}

void Stepper::setTarget(int numSteps, unsigned long duration)
{
    if (numSteps == 0 || duration <= 0)
        return;

    digitalWrite(mDirPin, (numSteps < 0) ? LOW : HIGH);
    mNumSteps = abs(numSteps);
    mStepInterval = duration * 1000 / mNumSteps;
    mStartTime = micros();
}

void Stepper::update()
{
    if (mNumSteps == 0)
        return;

    const unsigned long now = micros();
    const unsigned long elapsed = now - mStartTime;
    if (elapsed < mStepInterval)
        return;

    digitalWrite(mStepPin, HIGH);
    digitalWrite(mStepPin, LOW);
    mNumSteps--;

    mStartTime = now;
}