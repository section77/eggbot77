# Inkscape 1.x Extension for EggBot77

## Installation on Linux and OSX
You have to put the content of the directories `extensions` and
`templates` inside the respective folders inside your user extensions folder
(the ones listed at `Edit` > `Preferences` under `System: User extensions`
and `System: User templates`, by default
`~/.config/inkscape/extensions` and `~/.config/inkscape/templates`).

```bash
mkdir -p ~/.config/inkscape/extensions/
mkdir -p ~/.config/inkscape/templates/
cp -r extensions/* ~/.config/inkscape/extensions/
cp -r templates/* ~/.config/inkscape/templates/
```

### Dependencies

- Inkscape >= 1.0 (obviously). We have successfully tested with Inkscape 1.1.2, 1.3.2 and 1.2.2
- python3
- python3-serial

Note: in case you want to install a newer version of Inkscape, make sure you use the PPA option.

On Debian or Debian-based distributions (Ubuntu, Mint) use apt-get/aptitude/apt, for example
```bash
sudo apt-get install inkscape python3 python3-serial
```
### Permissions

On most GNU/Linux distributions you have to be member of a certain group to use serial ports.

On Debian/Ubuntu/Mint this is the `dialout` group to which you can add yourself with
```
sudo addgroup $USER dialout
```

On Archlinux it is the `uucp` group to which you can add yourself with
```
sudo usermod -aG uucp $USER
```

Note: You need to logout/logon or reboot to activate the change.

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

## Inkscape AppImage

The original Inkscape AppImages are missing the python-serial module and thus won't work out of the box.

You'll find an AppImage where we added the modules and extensions here: https://josoansi.de/files/Inkscape-091e20e-EggBot77-x86_64.AppImage
FIXME: Recreate and upload to section77.de

The above linked image was created on Debian GNU/Linux 12 (bookworm) with

```bash
# get Inkscape AppImage
wget -nc https://inkscape.org/de/gallery/item/44616/Inkscape-091e20e-x86_64.AppImage
chmod +x Inkscape-091e20e-x86_64.AppImage

# extract it
./Inkscape-091e20e-x86_64.AppImage --appimage-extract

# add pyserial
wget -nc https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz
tar xzf pyserial-3.5.tar.gz
cp -r pyserial-3.5/serial squashfs-root/usr/lib/python3/dist-packages/

# add EggBot77 extensions and template
cp ./extensions/* squashfs-root/usr/share/inkscape/extensions
cp ./templates/* squashfs-root/usr/share/inkscape/templates/

# repack the AppImage
wget -nc https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage
./appimagetool-x86_64.AppImage squashfs-root/

# rename it
mv Inkscape-x86_64.AppImage Inkscape-091e20e-EggBot77-x86_64.AppImage

# upload to section77.de
scp Inkscape-091e20e-EggBot77-x86_64.AppImage section77.de:/var/www/html/files/
```

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


Fehler:
- serial... -> python3-serial fehlt oder appimage