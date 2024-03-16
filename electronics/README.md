Section77 Variante des EggBots mit S2 mini ESP32

Gedanken/Designentscheidungen

## LM2596 Board 1,29€/Stk

für Eingangsspannung -> 5V

Gibt es in zig Varianten, ich habe 20x https://www.amazon.de/Stromversorgung-Spannungsregler-Abwärtswandler-Hocheffizienter-Einstellbares/dp/B07F38DJLS bestellt
Beim Artikel steht Innovateking-EU, ‎Zhovee ‎KKK20 aber keine Aufschrift auf dem Board.

Achtung: Ausgangsspannung am Trimmer einstellen, bevor die anderen Module wie ESP, Schrittmotortreiber, Servo usw. gesteckt werden.
Laut einigen Berichten, muss man mindestens 5 Umdrehungen machen, bevor sich die Ausgangsspannung ändert.

## A4988 carrier board

Ich weiß nicht, was das "original" ist, vermutlich https://www.pololu.com/product/1182
aber es gibt da mittlerweile dutzend Nachbauen, von denen vermutlich viele pinkompatibel sind.
Wir bestellen vermutlich bei https://www.roboter-bausatz.de/p/a4988-schrittmotorentreiber

Microstepping über Lötbrücken einstellbar.

## Netzteile

* https://www.pollin.de/p/polsat-gp1220-a-schaltnetzteil-12-v-2-a-gebraucht-352884 (12V, 2A, Hohlstecker 5,5/2,3 mm, Pluspol innen) - 1,99
* https://www.pollin.de/p/schaltnetzteil-telekom-da-24r12-aaaa-12v-2a-schwarz-352354 (12V, 2A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,50
* https://www.pollin.de/p/stecker-schaltnetzteil-hw-120250eaw-12-v-2-5-a-353145 (12V, 2,5A, Hohlstecker 5,5/2,3 mm, Pluspol innen) - 2,50
* https://www.pollin.de/p/stecker-schaltnetzteil-umec-up0301b-12pe-12v-2-5a-352707 (12V, 2,5A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,95
* https://www.pollin.de/p/stecker-schaltnetzteil-umec-uh0301p-12pe-12v-2-5a-352708 (12V, 2,5A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,95

Hohlbuchsen: Pollin 94-451810 und 94-452316

## S2 mini von Wemos

https://www.wemos.cc/en/latest/s2/s2_mini.html

Für das Board gibt es wohl keine Zeichnung mit Dimensions, siehe auch hier,
wo einer viele Messungen gemacht hat und auch ein Kikad Symbol angefangen hat:
https://gitlab.com/kicad/libraries/kicad-footprints/-/merge_requests/2904

S3 mini hat angeblich gleiches Layout (aber anderes pinning): https://www.wemos.cc/en/latest/_static/files/dim_s3_mini_v1.0.0.pdf

## Stift Servo

um den Stift anzuheben bzw. abzusenken.
Vermutlich https://www.roboter-bausatz.de/p/sg90-9g-micro-servomotor

## Schrittmotoren

Pollin Stepper 94-310690

## Levelshifter

* https://learn.sparkfun.com/tutorials/bi-directional-logic-level-converter-hookup-guide/all
* https://www.digikey.de/de/blog/logic-level-shifting-basics

## Ähnliches Projekt

https://content.instructables.com/FQ1/O4B9/KTWY3YCQ/FQ1O4B9KTWY3YCQ.jpg

Folgende Änderungen:
* SD-Reader entfällt
* Dev-Board durch S2 mini ersetzen
* den 7805 durch step-down ersetzen
* alles sollte THT sein, damit's einfacher zu löten ist

