// Eggbot77 - eh21 2024 edition
// License: by Justin Otherguy is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn=100;

lagerseite=false;         // true: inkl. Aussparung für Lager; false: Motorseite
aufnahme_5mm=false;       // true: 5mm rund; false: 3x3mm quadratisch

difference() {                                  // Eierhalter mit Lager
  union() { // aussen
    translate([0,0,26]) sphere(d=24);           // Kontakt zum Ei
    cylinder(d=20, h=20);                       // Halter für das Lager
  }
  if (lagerseite) {
    translate([0,0,-.1]) cylinder(d=16, h=7);     // für Lager
    translate([0,0,5]) cylinder(d=13, h=6);       // für Mutter
  } else {
    if (aufnahme_5mm) {
      translate([0,0,-.1]) cylinder(d=5, h=8);      // für Motorwelle
    } else {
      translate([-1.5,-1.5,-.1]) cube([3,3,8]);      // für Motorwelle
    }
  }
  if (lagerseite) {
    translate([0,0,26]) union() {
      sphere(d=22);                               // Platz für das Ei
      translate([0,0,-6.7]) cylinder(d=30, h=30); // Kugel schneiden
    }
  } else {
    translate([0,0,21]) union() {
      sphere(d=22);                               // Platz für das Ei
      translate([0,0,-6.7]) cylinder(d=30, h=30); // Kugel schneiden
    }
  }
}
