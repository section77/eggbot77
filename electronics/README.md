Section77 Variante des EggBots mit S2 mini ESP32

## LM2596 Board 1,29€/Stk

für Eingangsspannung -> 5V

Gibt es in zig Varianten, ich habe 20x https://www.amazon.de/Stromversorgung-Spannungsregler-Abwärtswandler-Hocheffizienter-Einstellbares/dp/B07F38DJLS bestellt
Beim Artikel steht Innovateking-EU, ‎Zhovee ‎KKK20 aber keine Aufschrift auf dem Board.

Achtung: Ausgangsspannung am Trimmer einstellen, bevor die Anderen Module wie ESP, Schrittmotortreiber, Servo usw. gesteckt wird.

## A4988 carrier board

Ich weiß nicht, was das "original" ist, vermutlich https://www.pololu.com/product/1182
aber es gibt da mittlerweile dutzend Nachbauen, von denen vermutlich viele pinkompatibel sind.
Wir bestellen vermutlich bei https://www.roboter-bausatz.de/p/a4988-schrittmotorentreiber

Offen: Welches Microstepping? Hab ein EggBot Projekt gefunden, bei dem sie 1/16 verwenden

## Netzteile

https://www.pollin.de/p/polsat-gp1220-a-schaltnetzteil-12-v-2-a-gebraucht-352884 (12V, 2A, Hohlstecker 5,5/2,3 mm, Pluspol innen) - 1,99
https://www.pollin.de/p/schaltnetzteil-telekom-da-24r12-aaaa-12v-2a-schwarz-352354 (12V, 2A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,50
https://www.pollin.de/p/stecker-schaltnetzteil-hw-120250eaw-12-v-2-5-a-353145 (12V, 2,5A, Hohlstecker 5,5/2,3 mm, Pluspol innen) - 2,50
https://www.pollin.de/p/stecker-schaltnetzteil-umec-up0301b-12pe-12v-2-5a-352707 (12V, 2,5A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,95
https://www.pollin.de/p/stecker-schaltnetzteil-umec-uh0301p-12pe-12v-2-5a-352708 (12V, 2,5A, Hohlstecker 5,5/2,5 mm, Pluspol innen) - 2,95

## S2 mini von Wemos

https://www.wemos.cc/en/latest/s2/s2_mini.html

EN Y: GPIO1-18; 21; 33-40
DIR Y: GPIO1-18; 21; 33-40
EN X: GPIO1-18; 21; 33-40
DIR X: GPIO1-18; 21; 33-40
Servo: GPIO1-18; 21; 33-40

Für das Board gibt es wohl keine Zeichnung mit Dimensions, siehe auch hier,
wo einer viele Messungen gemacht hat und auch ein Kikad Symbol angefangen hat:
https://gitlab.com/kicad/libraries/kicad-footprints/-/merge_requests/2904

S3 mini hat angeblich gleiches Layout (aber anderes pinning): https://www.wemos.cc/en/latest/_static/files/dim_s3_mini_v1.0.0.pdf

## Stift Servo

um den Stift anzuheben bzw. abzusenken

## Schrittmotoren

Welche bestellt Justin?

## Schaltung offen

* Microstepping
* Verpolschutz
  Reichelt Artikel-Nr.: 1N 5822 Schottkydiode, 40 V, 3 A, DO-201AD 0,15€
* 5V am USB-C Port, kann das entkoppelt werden, so dass der USB-C Port keine Spannung "raus" gibt?
  Für USB Host wäre es vielleicht ganz interessant...
  1N 5819
* Cs: 2x Reichelt RAD FR 100/35
  8mm Durchmesser, 3,5mm Beinabstand radial
* 2 Taster
* Schrittmotoren über Klemmen anschließen? Welche Variante kauft Justin?

## Ähnliches Projekt

https://content.instructables.com/FQ1/O4B9/KTWY3YCQ/FQ1O4B9KTWY3YCQ.jpg

Folgende Änderungen:
* SD-Reader entfällt
* Dev-Board durch S2 mini ersetzen
* den 7805 durch step-down ersetzen
* alles sollte THT sein, damit's einfacher zu löten ist

