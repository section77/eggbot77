#include <driver/ledc.h>

#define STEPPER_EN 1
#define DIR1 2
#define STEP1 3
#define DIR2 4
#define STEP2 5
#define SERVO_PWM 6
#define LED_BUILTIN 15  // die blaue onboard LED

void setup() {
  Serial.begin(115200);

  pinMode(STEPPER_EN, OUTPUT);
  pinMode(DIR1, OUTPUT);
  pinMode(STEP1, OUTPUT);
  pinMode(DIR2, OUTPUT);
  pinMode(STEP2, OUTPUT);
  pinMode(SERVO_PWM, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  // enable dauerhaft setzen (active low)
  digitalWrite(STEPPER_EN, LOW);

  digitalWrite(DIR1, LOW);
  digitalWrite(DIR2, LOW);

  Serial.println("Starting");
  Serial.setDebugOutput(true);

  ledcAttachPin(LED_BUILTIN, 1);
  ledcSetup(1, 50, 10);
}

#define toggle(pin) digitalWrite(pin, !digitalRead(pin))

void loop() {
  toggle(STEP1);
  toggle(STEP2);
  delay (1);

  // servo
  static int8_t d = 1;
  static int16_t val = 0;
  if (val == 1023)
  {
    d = -1;
    digitalWrite(DIR1, LOW);
    digitalWrite(DIR2, LOW);
  }
  else if (val == 0)
  {
    d = 1;
    digitalWrite(DIR1, HIGH);
    digitalWrite(DIR2, HIGH);
  }
  val += d;
  ledcWrite(1, val);

  //Serial.write("hello world\n");
}
