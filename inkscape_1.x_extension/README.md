# Inkscape 1.x Erweiterung für EggBot77

## Installation unter Linux und OSX
Kopiere den Inhalt der Verzeichnisse `extensions` und `templates` in die entsprechenden Ordner unterhalb des Verzeichnisses mit Deinen Erweiterungen (die unter `Bearbeiten` > `Einstellungen` unter `System: Benutzererweiterungen` und `System: Benutzervorlagen`, standardmäßig `~/.config/inkscape/extensions` und `~/.config/inkscape/templates`).

```bash
cp -r extensions/* ~/.config/inkscape/extensions/
cp -r templates/* ~/.config/inkscape/templates/
```

### Abhängigkeiten

- Inkscape >= 1.0 (offensichtlich). Wir haben auch mit neueren Version bis Inkscape 1.3 getestet
- python3
- python3-serial

Verwende auf Debian oder Debian-basierten Distributionen (Ubuntu, Mint) apt, zum Beispiel
```bash
sudo apt install inkscape python3 python3-serial
```

### Zugriffsrechte

Bei den meisten GNU/Linux-Distributionen muss man Mitglied einer bestimmten Gruppe sein, um die serielle Schnittstellen nutzen zu können.

Unter Debian ist dies die Gruppe `dialout`, zu der Du Dich hinzufügen kannst mit
```
sudo addgroup $USER dialout
```

Unter Archlinux ist es die Gruppe `uucp`, zu der Du Dich selbst hinzufügen kannst mit
```
sudo usermod -aG uucp $USER
```

Du musst Dich abmelden/anmelden oder neu starten, um die Änderung zu aktivieren.

### Fehlersuche

#### Du kannst keine Verbindung zu Ihrem EggDuino herstellen? 

Versuch' das:

Trenne Dein ESP32-Board von Deinem PC, führe aus
```
sudo dmesg -ew
```
und schließe Dein Board wieder an. Du solltest etwas sehen wie
```
[  +2,039765] usb 3-1: new full-speed USB device number 4 using xhci_hcd
[  +0,183255] usb 3-1: New USB device found, idVendor=303a, idProduct=8141, bcdDevice= 1.00
[  +0,000009] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  +0,000003] usb 3-1: Product: DENEYAP MINI
[  +0,000002] usb 3-1: Manufacturer: Turkish Technnology Team Foundation (T3)
[  +0,000001] usb 3-1: SerialNumber: 80:65:99:4b:06:ea
[  +0,037042] cdc_acm 3-1:1.0: ttyACM0: USB ACM device
```

Die wichtigsten Informationen kannst Du aus den obigen Angaben entnehmen: Dein Gerät ist jetzt als `/dev/ttyACM0` verfügbar. Du kannst nun die Rechte überprüfen, die für den Zugriff auf dieses Gerät erforderlich sind:

```
$ ls -la /dev/ttyACM0
crw-rw---- 1 root dialout 166, 0 8. Feb 12:41 /dev/ttyACM0
```

Du musst also root sein oder Mitglied der Gruppe `dialout`. Bist Du das?
```
$ groups
dialout cdrom floppy sudo audio dip video plugdev netdev lpadmin scanner bluetooth libvirt sbuild libvirt-qemu
```

Vergewissere Dich, dass die Ausgabe von `groups` die Gruppe `dialout` enthält, wie es oben der Fall ist.

Starte dann Inkscape, wähle `Erweiterungen/Extensions - EggBot - EggBot Control`. Auf der Registerkarte `Manual` kannst Du die einzelnen Befehle wie `Pen up`/`Pen down` testen.

## Installation unter Windows
Du musst die Ordner `templates` und `extensions` in den Ordner `inkscape/share` kopieren, der normalerweise unter `C:\Programme\Inkscape\share` zu finden ist

## Inkscape AppImage

Den originalen Inkscape AppImages fehlt das Modul `python-serial` und sie funktionieren daher nicht ohne weiteres.

Ein AppImage, bei dem wir die Module und Erweiterungen hinzugefügt haben, findest Du hier: https://josoansi.de/files/Inkscape-091e20e-EggBot77-x86_64.AppImage
FIXME: Neu erstellen und auf section77.de hochladen

Das oben verlinkte Image wurde auf Debian GNU/Linux 12 (bookworm) mit

```bash
# Inkscape AppImage holen
wget -nc https://inkscape.org/de/gallery/item/44616/Inkscape-091e20e-x86_64.AppImage
chmod +x Inkscape-091e20e-x86_64.AppImage

# entpacken
./Inkscape-091e20e-x86_64.AppImage --appimage-extract

# pyserial hinzufügen
wget -nc https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz
tar xzf pyserial-3.5.tar.gz
cp -r pyserial-3.5/serial squashfs-root/usr/lib/python3/dist-packages/

# EggBot77-Erweiterungen und -Vorlage hinzufügen
cp ./extensions/* squashfs-root/usr/share/inkscape/extensions/
cp ./templates/* squashfs-root/usr/share/inkscape/templates/

# AppImage neu packen
wget -nc https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage
./appimagetool-x86_64.AppImage squashfs-root/

# umbenennen
mv Inkscape-x86_64.AppImage Inkscape-091e20e-EggBot77-x86_64.AppImage
```

## Weitere Projektseiten

 * [Eggbot77 Wiki](https://wiki.section77.de/projekte/eggbot77) (in deutsch)

## Credits

Dieses Verzeichnis begann als
```bash
git clone -b inkscape1.0compat https://github.com/gesina/eggbot_extension.git
```

und wuchs von dort aus weiter. Der Grund dafür war der Wunsch, eine komplette Repo mit PCB, 3D-Druckteilen, ESP32-Firmware und Inkscape-Plugin zu haben, ohne ohne mit Unterrepos herumspielen zu müssen, die mit der Zeit die Kompatibilität beeinträchtigen könnten.
