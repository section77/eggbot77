#pragma once

#include <Arduino.h>

class Button {
public:
    /// Create a Button with an INPUT_PULLUP pin associated.
    Button(char pin)
        : mState(0)
        , mPin(pin)
    {
        pinMode(mPin, INPUT_PULLUP);
    }

    /// Return true if the button was pressed.
    bool wasPressed()
    {
        mState = (mState << 1) | !digitalRead(mPin) | 0xe000;
        return (mState == 0xf000);
    }

private:
    unsigned short mState;
    char mPin;
    Button(const Button& c);
    Button& operator=(const Button& c);
};
