// arduino spacer

//2mm hoch 3,5 innen

$fn=100;

difference() {
  cylinder(d=7, 2);
  translate([0,0,-.1]) cylinder(d=3.5, 3);
}