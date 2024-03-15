#include "config.h"
#include "EBBHardware.h"

EBBHardware ebb(Serial);

void setup()
{
  Serial.begin(9600);
  Serial.setDebugOutput(true);
  ebb.init();
}

void loop()
{
  ebb.processEvents();

  // 10bit LED fan in-out effect
  {
    unsigned long led_pwm_val = millis() & 0x3FF;
    if (led_pwm_val > 0x200)
      led_pwm_val = 0x3FF - led_pwm_val;
    ledcWrite(LED_BUILTIN_LEDC_CH, led_pwm_val);
  }
}
