#include "config.h"
#include "EBBHardware.h"

EBBHardware ebb(Serial);

void setup()
{
    Serial.begin(9600);
    ebb.init();
}

void loop()
{
    ebb.processEvents();
}
