This directory contains the files for 3d printing in stl format.

Most of the files have been gathered from the interwebz:

[Vladislav Trigubovich](https://www.thingiverse.com/trigubovich/) has created the [base design](https://www.thingiverse.com/thing:2422393/). The following files have been copied from that (licensed under CC BY-4.0):
- Box_Intersecting_Rods.stl
- Pen_Stepper_Holder_Foot.stl
- Pen_Stepper_Holder-V2.stl
- Tailstock_Holder.stl
- Rotational_Stepper_Holder_Foot.stl
- Rotational_Stepper_Holder.stl
- Faucet.stl

[schuetzi99](https://www.thingiverse.com/schuetzi99) has provided a remix which replaces the bought metal spring with a printed one and fitting toolmount and penarm (licensed under CC BY-NC-SA-4.0):
- toolmount.stl ([OpenSCAD](OpenSCAD/toolmount.scad))
- spring-3mm.stl (modified by me to allow for a 3mm bolt, [OpenSCAD](OpenSCAD/spring-3mm.scad))
- penarm-stronger.stl (modified by me to strengthen the arms holding the servo, [OpenSCAD](OpenSCAD/penarm-stronger.scad))
- nema-eggbot77-mount.stl ([OpenSCAD](OpenSCAD/nema-eggbot77-mount.scad)) (schuetzi99's version was for Arduino Uno; I have modified this to fit our own ESP32-based PCB; bruder-jo made the fit more universal to allow for different variants of nema17 steppers and also allows for more tolerance of different printers).
schuetzie99 also provided his files in OpenSCAD format which made modifications dead simple :)

[Smuk3D](https://www.thingiverse.com/smuk3d) has designed a knob for the M4 bolt that fixes the pen:
- nut_knob_v1_5_1_M4.stl ([OpenSCAD](OpenSCAD/nut_knob_v1_5_1_M4.scad))

I have designed two new files for holding the egg (print in TPU) replacing the original PLA ones using suction cups:
- tpu-eierhalter-lagerseite.stl ([OpenSCAD](OpenSCAD/tpu-eierhalter.scad); set "lagerseite=true") (thx to bruder-jo for improving printability!)
- tpu-eierhalter-stiftseite.stl ([OpenSCAD](OpenSCAD/tpu-eierhalter.scad); set "lagerseite=false")

Optionally you can also print the pads for the feet (print in TPU):
- tpu-pad-16x15.stl (print 8)
- tpu-pad-19x15.stl (print 2)