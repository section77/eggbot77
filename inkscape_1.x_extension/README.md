# Inkscape 1.x Extension for EggBot77

## Installation on Linux and OSX
You have to put the content of the directories `extensions` and
`templates` inside the respective folders inside your user extensions folder
(the ones listed at `Edit` > `Preferences` under `System: User extensions`
and `System: User templates`, by default
`~/.config/inkscape/extensions` and `~/.config/inkscape/templates`).

```bash
cp -r extensions/* ~/.config/inkscape/extensions/
cp -r templates/* ~/.config/inkscape/templates/
```

### Dependencies

- Inkscape >= 1.0 (obviously). But only tested (yet) with Inkscape 1.2
- python3
- python3-serial

On Debian or Debian-based distributions (Ubuntu, Mint) use apt-get/aptitude/apt, for example
```bash
sudo apt-get install inkscape python3 python3-serial
```
### Access Rights

On most GNU/Linux distributions you have to be member of a certain group to use serial ports.

On Debian/Ubuntu/Mint this is the `dialout` group to which you can add yourself with
```
sudo addgroup $USER dialout
```

On Archlinux it is the `uucp` group to which you can add yourself with
```
sudo usermod -aG uucp $USER
```

You need to logout/logon or reboot to activate the change.

### Troubleshooting

You aren't able to connect to your EggDuino? Try this:

Disconnect your board from your PC and execute
```
sudo dmesg -ew
```
and plugin your ESP32 Board. You should see something like
```
[  +2,039765] usb 3-1: new full-speed USB device number 4 using xhci_hcd
[  +0,183255] usb 3-1: New USB device found, idVendor=303a, idProduct=8141, bcdDevice= 1.00
[  +0,000009] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  +0,000003] usb 3-1: Product: DENEYAP MINI
[  +0,000002] usb 3-1: Manufacturer: Turkish Technnology Team Foundation (T3)
[  +0,000001] usb 3-1: SerialNumber: 80:65:99:4b:06:ea
[  +0,037042] cdc_acm 3-1:1.0: ttyACM0: USB ACM device
```

The important pieces you can extract from the above: Your device
is now available as `/dev/ttyACM0`. You can now check the rights which are needed to access this device:

```
$ ls -la /dev/ttyACM0
crw-rw---- 1 root dialout 166, 0  8. Feb 12:41 /dev/ttyACM0
```

So you need to be root or are member of the group `dialout`. Are we?
```
$ groups
dialout cdrom floppy sudo audio dip video plugdev netdev lpadmin scanner bluetooth libvirt sbuild libvirt-qemu
```

Be sure the output of `groups` includes the group `dialout` as it does above.

Then start inkscape, select Erweiterungen/Extensions - EggBot - EggBot Control. On the `Manual` tab you can check the
individual commands like pen up/down.

## Installation on Windows
You have to copy the templates and extensions folders to the inkscape/share folder which
is typically located at C:\programme\inkscape\share

## Other Projects Parts

 * [Eggduino Firmware](https://github.com/section77/EggDuino)
 * [Eggbot77 Wiki](https://wiki.section77.de/projekte/eggbot77) (in german)

## Credits

This directory started as
```bash
git clone -b inkscape1.0compat https://github.com/gesina/eggbot_extension.git
```

and went further from there. The reason for this was the wish to have one complete
repo with PCB, 3D printing parts, ESP32 firmware and inkscape plugin without
the need to fiddle around with subrepos which may break compatibility over time.
