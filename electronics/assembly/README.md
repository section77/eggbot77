## eggbot77 Aufbauanleitung
[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/section77/eggbot77/blob/main/electronics/assembly/README.en.md)
[![de](https://img.shields.io/badge/lang-de-blue.svg)](https://github.com/section77/eggbot77/blob/main/electronics/assembly/README.md)

Hinweis: Die Stiftleisten JP1 und JP4 werden für den Easterhegg-Workshop nicht verwendet und sind dafür gedacht, falls jemand Erweiterungen anbringen möchte oder die Platine außerhalb der Osterzeit für andere Projekte verwenden will.

Wir haben versucht den Aufbau der Platine so detailiert wie nötig mit vielen Bildern zu beschreiben, so dass auch am Lötkolben wenig erfahrene Bastler zurecht kommen. Eine Einführung ins grundsätzliche Löten von Elektronikbauteilen enthält diese Anleitung nicht. Wenn es anfängt nach gebratenem Hühnchen zu riechen, hälst du den Lötkolben verkehrt herum ;-)

### Lötbrücke SJ7 schließen

Dadurch wird das 3,3V PWM Signal des ESP32s direkt an der Servo duchgegeben. Der SG90 "Micro Servo 9g" kommt normalerweise mit dem 3,3V Pegeln zurecht. Solltest du einen anderen Servo mit 5V PWM verwenden wollen, kannst du diesen Schritt überspringen und stattdessen Q1 und R1 einlöten.

Für den Easterhegg-Workshop empfehlen wir SJ7 zu schließen.

![solder jumper SJ7 closed to enable 3.3V PWM signals to servo](01_close_SJ7.jpg)

### Lötbrücken für microstepping schließen

Die Eggbot77 firmware geht davon aus, dass am A4988 Treiber 1/16 Microstepping aktiv ist (alle drei Lötbrücken MS1-MS3 an beiden Treibern geschlossen). Wenn Du einen anderen Schrittmtor, als den beigelegten Minebea 17PM-K374BN01CN verwenden willst oder den Schrittmotorstrom messen und einstellen willst, solltest du die Lötbrücken zunächst offen lassen und erst ganz am Ende schließen.

Für den Easterhegg-Workshop empfehlen wir alle 6 Lötbrücken zu schließen.

![](02_close_MS1_MS2_MS3.jpg)

### Buchsenleisten vorbereiten

Wir müssen uns kürzere Buchsenleisten aus den großen 1x20 Buchsenleisten zuschneiden. Beim Abknipsen wird unweigerlich ein Pin zerstört, daher empfiehlt es sich genau mittig auf dem Pin zu schneiden und die entstehende Kante noch einmal nachzubearbeiten.

Es werden vorerst vier Stück 1x8 Buchsenleiste gebraucht (siehe übernächstes Bild)

![](03_prepare_socket_strips.jpg)

### Vorbereitete Komponenten

![](04_prepared_components.jpg)

### Buchsenleiste für U2

Die zwei 2x8 Buchsenleisten (fertig konfektioniert) einsetzen und umgedreht auf eine ebene Fläche legen.
![](05_U2_place_two_column_socket_strips.jpg)

Dann zuerst jeweils 1 Pin anlöten, nochmals den korrekten Sitz prüfen und dann alle Pins durchlöten.
![](06_U2_solder_two_column_socket_strips.jpg)

### Buchsenleiten für U3 und U4

Es empfiehlt sich als Hilfsmittel einen A4988 Treiber einzustecken um die Buchsenleisten in Position zu halten. Die JST Stecker X2 und X3 klemmen in den Löchern und können parallel eingesetzt werden.
![](07_U3_solder_socket_strips.jpg)

Auf dem Bild sieht man die durchgelöteten Buchsenleisten für U2, U3, U4, X2 und X3
![](08_soldered_socket_rows.jpg)

### Schottky Diode D1 einlöten

Beinchen mit einer Spitzzange passend abwinkeln
![](09_D1_bend_legs_schottky_diode.jpg)

Nach dem Platzieren auf die passende Länge abschneiden. Die Beinchen vor dem Löten abzuschneiden ist ein wichtiger Schritt weil ansonsten zu viel Wärme abfließt, die dann an der Lötstelle fehlt. Für diesen und den nächsten Schritt (X1 einlöten) kann es notwendig sein den Lötkolben, bei Verwendung mit bleifreiem Lot, kurzzeitig auf 400°C zu stellen.

![](10_D1_place_schottky_diode.jpg)
![](11_D1_solder_schottky_diode.jpg)

### Hohlbuchse X1 einlöten
![](12_X1_place_and_solder.jpg)

### Kondensatoren vorbereiten

Wichtig: Auf korrekte Ausrichtung achten. Das lange Beinchen am Kondensator muss zum + Symbol auf der Platine, der weiße Strich mit "-" am Kondensator zeigt zum Rand.

![](13_C1_C2_prepare_capacitors.jpg)
![](14_C1_C2_solder_capacitors.jpg)

### Sifte und Buchsen für U1 vorbereiten

Wie vorher gezeigt mit dem Seitenschneider 4 Stifte und 4 Buchsen von den großen Leisten abschneiden.

![](15_U1_prepared_sockets.jpg)

### Stifte an U1 anlöten

Es empfiehlt sich drei Stifte ausgerichtet in die bestehenden Buchsenleisten einzustecken und auf der LM2596 Platine anzulöten. Dies hilft bei der senkrechten Ausrichtung der Pins. Anschließend um 180° drehen und verbleibenden Pin anlöten.

![](16_U1_solder_pins.jpg)

### Buchsen an U1 anlöten

Auch hier ist es empfehlenswert die 4 vorher zugeschnittenen Buchsen ausgerichtet auf die Stifte aufzusetzen, dann die Platine zu wenden und dann die 4 Buchsen anzulöten.

![](17_U1_place_sockets.jpg)

### Ausgangsspannung an U1 einstellen

Auf korrekte Ausrichtung des Moduls achten: Der blaue Trimmer muss zum Rand der Platine zeigen. Die Ausrichtung der Aufschrift "IN+, OUT+" usw. muss zur Ausrichtung der unteren Platine "JP1" passen. Siehe auch nächstes Bild.

**Achtung:** Die A4988 Treiber(U3 und U4) sowie der ESP32(U1) wird zerstört, wenn sie eingebaut sind und die Platine mit 12V betrieben wird, bevor die Ausgangsspannung am Spannungsregler U1 eingestellt wurde.

Daher vor dem Einstecken des Netzteils und dem ersten Einschalten nochmal darauf achten, dass U2, U3 und U4 nicht aufgesteckt sind. Siehe auch das nachfolgende Bild:

![](18_U1_adjust_output_volatge_A.jpg)

Der Trimmer (roter Pfeil) muss ca. 12.5 mal gegen den Uhrzeigersinn gedreht werden, um die 5V am Ausgang einzustellen. Die Ausgangsspannung fängt erst nach ca. 7 Linksdrehungen an, sich zu ändern, also bitte nicht vorzeitig aufgeben...

![](18_U1_adjust_output_volatge_B.jpg)

### Module aufstecken

Nun Netzteil ausstecken und die Module U2, U3 und U4 aufstecken.

An U2 (dem ESP32) muss die USB-C Buchse "nach links" zum Rand zeigen.

An den A4988 Modulen muss Enable/En zur Beschriftung auf der Platine passen. Der Trimmer (mit dem Kreuzschlitz) zeigt dann in Richtung der Servo Pfostenleiste (auch auf dem übernächsten Bild zu sehen).

Die Beschriftung auf der Rückseite der A4988 Platine steht dann auf dem Kopf, davon darf man sich nicht abschrecken lassen.

Wichtig ist, dass der rot umkreiste "Enable" Pin zum "En" auf der Platine passt.

![](19_A4988_carrier_variants.jpg)

### Servo und Schrittmotoren anstecken

Die orange Leitung am SG90 muss zum Pin "PWM" ausgerichtet sein. Andere Servos können andere Farbkodierungen haben.

Die Schrittmotoren mit den Leitungen verbinden, die Ferrite (die schwarzen Röhrchen) zu der Platine hin.

![](20_hardware_test.jpg)

### Hardware mit Testprogramm prüfen

Wenn man den ESP32 das erste Mal mit der arduino IDE programmieren möchte, muss man ihn in den DFU Modus (Device Firmware Upgrade Mode) bringen:
* Taster 0 am ESP32 drücken und festhalten (untere linke Ecke, mit "0" beschriftet)
* Taster Reset (linke obere Ecke, mit "RST" beschriftet) drücken
* Taster 0 noch kurz halten und dann loslassen

Quelle: https://www.wemos.cc/en/latest/tutorials/s2/get_started_with_arduino_s2.html

Es empfiehlt sich zuerst das [hardware_test Arduino Projekt](../../firmware/hardware_test/hardware_test.ino)
zu programmieren, um die korrekte Funktion der Komponenten vorab zu testen.

Der Servo läuft dabei langsam von der Minimumposition zur Maximumposition, beide Schrittmotoren drehen mit unterschiedlichen Geschwindigkeiten abwechselnd in beide Richtungen und die blaue onboard LED blinkt mit 1Hz.

Wenn das funktioniert, steht dem Programmieren der richtigen [EggBot77 firmware](../../firmware/EggBot77/EggBot77.ino) zur Kommunikation mit dem Inkscape plugin nichts mehr im Wege.

Weiter mit der [Installation des Inkscape Plugins](../../inkscape_1.x_extension/README.md)
