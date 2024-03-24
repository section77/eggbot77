$fn=100;
laengeachse=67;

aufnahme_5mm=false;       // true: 5mm rund; false: 3x3mm quadratisch

difference() {
  union(){
    translate([-9,0,0])rotate([0,-90,0])lasche();
    translate([14,0,0])rotate([0,-90,0])lasche();
    translate([14,12,0])rotate([0,-90,0])servolasche_gelenk();
    translate([14,40.5,0])rotate([0,-90,0])servolasche_ende();
    hull(){
      translate([0,laengeachse,0])rotate([0,0,0])cylinder(r=9,h=5);
      translate([-11,0,0])cube([22,laengeachse-20,5]);
    }
    translate([0,laengeachse,0])rotate([0,0,0])cylinder(r=9,h=11);
  }
  translate([0,laengeachse+1,5])rotate([-90,0,0]){
    translate([0,0,-1])cylinder(r=1.7,h=20);
    translate([0,0,5.5])cylinder(r1=3.2,r2=3.2,h=1.7);
    translate([0,0,6.55])cylinder(r=3.2,h=7);
  }
  translate([-2.85,laengeachse+3,-0.01])cube([5.7,2,20]);
  bohrung();
  for(i=[13:18:laengeachse-17]){
    translate([0,i,-0.1])rotate([0,0,0])rotate([0,0,0])cylinder(r=8,h=10,$fn=6);
  }
//  translate([-50,-40,-50]) cube([100,100,100]);  // debug
}

module bohrung(){
  translate([0,laengeachse,-0.1])rotate([0,0,0]){
    if (aufnahme_5mm) {
      difference(){
        cylinder(r=2.55,h=30);
        translate([-2.5,1.6,-0.01])cube([5,2,30.1]);
      }
    } else {
      translate([-1.5,-2,-1]) cube([3.05,3.05,38]);      // für Motorwelle
    }
  }
}

module servolasche_ende(){
  difference(){
    union() {
      translate([0,0,0])cube([14.5,10,4]);
    }
    translate([11,2.5,-0.01])cylinder(r=1.1,h=5); // bohrung
  }
}

module servolasche_gelenk(){
  difference(){
    translate([0,-4.9,0])cube([14.5,9.9,4]);
    translate([11,2.5,-0.01])cylinder(r=1.1,h=5);
  }
}

module lasche(){
  difference(){
    hull(){
      translate([0,0,0])cube([5,10,5]);
      translate([10,5,0])cylinder(r=5,h=5);
    }
    translate([10,5,-0.01])cylinder(r=2.1,h=5.1);
  }
}
