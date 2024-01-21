// Original: https://www.thingiverse.com/thing:3432954
// Eggbot remix/ extension
// License: by schuetzi99 is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
// 
// 2023 - justin@justinotherguy.org: enlarged drill hole to accomodate for bigger screws

$fn=50;

lochabstand=22;
dicke=2;
breite=4;

translate([0,0,-breite/2])auge(7,2);
translate([0,lochabstand,-breite/2])auge(8,3.5); // original: 2.4
hull(){
  translate([-3,lochabstand-1.5,-breite/2])cube([6,0.1,breite]);
  translate([0,lochabstand-8,-breite/2])cylinder(r=1,h=breite);
}

translate([0,-3.5,0])rotate([0,0,90])
   rotate_extrude(angle=90, convexity=10)
       translate([6, 0]) square([dicke,breite],center=true);
translate([1,-3,0])rotate([0,0,180])
   rotate_extrude(angle=90, convexity=10)
       translate([7, 0]) square([dicke,breite],center=true);
translate([1,-2,0])rotate([0,0,270])
   rotate_extrude(angle=90, convexity=10)
       translate([8, 0]) square([dicke,breite],center=true);
translate([-1,-2,0])rotate([0,0,0])
   rotate_extrude(angle=120, convexity=10)
       translate([10, 0]) square([dicke,breite],center=true);
translate([-10.9,7.3,0])rotate([0,0,110])
   rotate_extrude(angle=190, convexity=10)
       translate([3, 0]) square([dicke,breite],center=true);
translate([-8.9,3.8,-breite/2])rotate([0,0,30])cube([4,dicke,breite]);
translate([-11.6,9.2,-breite/2])rotate([0,0,20])cube([12,dicke,breite]);
     
module auge(od,id){
  difference(){
    translate([0,0,0])cylinder(r=od/2,h=breite);
    translate([0,0,-0.01])cylinder(r=id/2,h=breite+0.2);
  }
}