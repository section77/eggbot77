/*
 * Simple hardware test for the EggBot77 version 25.01.2024
 * Servo sweeps between 850µs and 2150 and both steppers
 * run in velocity mode with step frequency between 440Hz and 7040 Hz.
 *
 * Attention: The stepper motors make several fast revolutions.
 * The program should therefore only be executed as long as the servo
 * and stepper motors have not yet been installed.
 */

#include <driver/ledc.h>

#define STEPPER_EN 1  // for both steppers
#define DIR1 2
#define STEP1 3
#define DIR2 4
#define STEP2 5
#define LED_BUILTIN 15  // the blue onboard LED

#define SERVO_PWM 6

// ESP32 LED Controller (we use them here for generating servo PWM and stepper frequencies)
#define SERVO_LEDC_CH 1
#define STEP1_LEDC_CH 2
#define STEP2_LEDC_CH 3

#define FREQ_HIGH 7040
#define FREQ_LOW 220

hw_timer_t *Timer0_Cfg = NULL;

void set_freq(uint8_t ch, int16_t freq) {
  ledcSetup(ch, freq, 10);  // 14bit
  ledcWrite(ch, (1 << 9));  // 50% duty cycle
}

// 200Hz/5ms task
void IRAM_ATTR Timer0_ISR() {
  static uint16_t cnt = 0;

  // toggle blue onboard LED every 500ms
  if (cnt % 100 == 0)
    digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));

  // sweep servo
  {
    const int16_t min_width = 850;   // [µs]
    const int16_t max_width = 2150;  // [µs]
    static int8_t pwm_inc = 1;       // ramp slope, µs width per 10ms

    static int16_t pwm_width = min_width;
    pwm_width += pwm_inc;
    if (pwm_width > max_width) {
      pwm_width = max_width;
      pwm_inc *= -1;
    } else if (pwm_width < min_width) {
      pwm_width = min_width;
      pwm_inc *= -1;
    }
    int16_t pwm_val = pwm_width * 4096 / 20000;
    ledcWrite(SERVO_LEDC_CH, pwm_val);
  }

  // both servos in velocity mode
  // change frequency every second
  if (cnt % 200 == 0) {
    static int16_t freq = FREQ_LOW;
    static int8_t freq_dir = 1;  // 0 = down, 1 = up

    if (freq_dir == 1) {
      freq = freq * 2;
      if (freq >= FREQ_HIGH) {
        freq_dir = 0;
      }
    } else if (freq_dir == 0) {
      freq = freq / 2;
      if (freq <= FREQ_LOW) {
        freq = FREQ_LOW;
        freq_dir = 1;
        digitalWrite(DIR1, !digitalRead(DIR1));
        digitalWrite(DIR2, !digitalRead(DIR2));
      }
    }
    Serial.printf("Setting stepper frequency to %i Hz...\n", freq);
    set_freq(STEP1_LEDC_CH, freq);
    set_freq(STEP2_LEDC_CH, freq);
  }
  cnt++;
}

void setup() {
  Serial.begin(9600);
  Serial.setDebugOutput(true);

  // delay 2000ms so the Serial Monitor can reconnect to USB CDC after flashing
  delay(2000);
  Serial.println("This is " __FILE__ ", compiled at " __DATE__ ", " __TIME__);

  // enable both steppers permanently (active low)
  pinMode(STEPPER_EN, OUTPUT);
  digitalWrite(STEPPER_EN, LOW);

  pinMode(DIR1, OUTPUT);
  digitalWrite(DIR1, LOW);
  pinMode(DIR2, OUTPUT);
  digitalWrite(DIR2, LOW);

  pinMode(LED_BUILTIN, OUTPUT);

  // attach Servo PWM pin to channel 2
  ledcAttachPin(SERVO_PWM, SERVO_LEDC_CH);
  ledcSetup(SERVO_LEDC_CH, 50, 12);

  // attach both STEP pins for the steppers
  ledcAttachPin(STEP1, STEP1_LEDC_CH);
  ledcAttachPin(STEP2, STEP2_LEDC_CH);
  set_freq(STEP1_LEDC_CH, FREQ_LOW);
  set_freq(STEP2_LEDC_CH, FREQ_LOW);

  // configure 5ms timer
  Timer0_Cfg = timerBegin(0, 80, true);
  timerAttachInterrupt(Timer0_Cfg, &Timer0_ISR, true);
  timerAlarmWrite(Timer0_Cfg, 5000, true);  // 80MHz/80/5000 -> 5ms task

  // enable it
  timerAlarmEnable(Timer0_Cfg);
  Serial.println("leaving setup()...");
}

void loop() {
  // nothing here, all work is done in timer interrupt
}
