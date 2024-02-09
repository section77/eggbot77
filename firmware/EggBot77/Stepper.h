#pragma once

class Stepper {
public:
    ///
    Stepper(char stepPin, char dirPin);

    /// Set the desired number of steps and overall duration in ms. The numSteps sign give the direction. 
    void setTarget(int numSteps, unsigned long duration);

    /// Call this in your mainloop: execute one step if it's the right time, otherwise do nothing.
    void update();
    
    /// Return the remaining steps.
    int remainingSteps() const { return mNumSteps; }
private:
    char mStepPin;
    char mDirPin;

    unsigned long mNumSteps;
    unsigned long mStepInterval;
    unsigned long mStartTime;
};
