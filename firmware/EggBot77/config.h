#pragma once

// Rotational Stepper: ("X")
#define X_STEP_PIN 3
#define X_DIR_PIN 2
#define X_ENABLE_PIN 1

// Pen Stepper:        ("Y")
#define Y_STEP_PIN 5
#define Y_DIR_PIN 4
#define Y_ENABLE_PIN 1

// Servo
#define SERVO_PIN 6

// EggBot77 doesn't have an engraver or buttons
#define ENGRAVER_PIN 7 // "SpnDir"
#define PRG_BUTTON_PIN 9 // PRG button ("Abort")
#define PEN_TOGGLE_BUTTON_PIN 11 // pen up/down button ("Hold")
#define MOTORS_BUTTON_PIN 17 // motors enable button ("Resume")

// ESP32 LED controller channels
#define LED_BUILTIN_LEDC_CH 1
#define SERVO_PIN_LEDC_CH 2
