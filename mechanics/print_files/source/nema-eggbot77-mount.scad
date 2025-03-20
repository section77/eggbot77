$fn=100;
drill=[[65,5],[65,65],[5,5],[5,65]];

difference(){
  union(){
    for (i=[0:1:3]){
      bolzen(drill[i],5,2,5);
    }
    translate([0,0,0])cube([70,70,2]);
    translate([35,32,0])mmount(15);
    translate([0,0,2]) difference() {
      union() {
        translate([0,8,0])                    cube([10,62,10]);
        translate([0,70,10]) rotate([90,90,0]) cube([10,70,10]);
        translate([60,8,10]) rotate([0,90,0]) cube([10,62,10]);
        translate([0,8,10]) rotate([90,90,0]) cube([10,70,8]);
      }
    
      translate([0, 70.01,10]) rotate([90,0,0])  cylinder(r=10, h=70.02);
      translate([0, 70.01,10]) rotate([90,0,90]) cylinder(r=10, h=70.02);
      translate([70,70.01,10]) rotate([90,0,0])  cylinder(r=10, h=70.02);
      translate([0,0.01,10]) rotate([90,0,90]) cylinder(r=10, h=70.02);
    }

  }
  for (i=[0:1:3]){
    loecher(drill[i],5,3,15);
  }
  translate([22,-6.9,2.002])cube([26,20.1,30]);
  translate([22,49,8])rotate([0,90,0])difference(){
    cylinder(r=6,h=4);
    translate([0,0,-0.01])cylinder(r=4,h=5);
  }
}

module bolzen(pos,ad,id,ho){
    translate([pos[0],pos[1],0]){
      cylinder(r=ad/2,h=ho);
    }
}

module loecher(pos,ad,id,ho){
    translate([pos[0],pos[1],0]){
      translate([0,0,-0.01])cylinder(r=id/2,h=ho+0.2);
    }
}

module mmount(hm){
  difference(){
    hull(){
			aa=23;
      rd=2;
      translate([-aa-1,-aa,0])cylinder(r=2,h=hm);
      translate([aa+1,-aa,0])cylinder(r=2,h=hm);
      translate([aa+1,aa+4,0])cylinder(r=2,h=hm);
      translate([-aa-1,aa+4,0])cylinder(r=2,h=hm);
    } 
      ai=18;		
      translate([-22,-21,-0.01])cube([44,44,hm+1]);
			translate([-ai-1,-ai,0])cylinder(r=5,h=hm+1);
      translate([ai+1,-ai,0])cylinder(r=5,h=hm+1);
      translate([ai+1,ai+4,0])cylinder(r=5,h=hm+1);
      translate([-ai-1,ai+4,0])cylinder(r=5,h=hm+1);
		}
		translate([22,-14,hm-1.25])rotate([-90,0,0])
      cylinder(r=1.256,h=32);
		translate([-22,-14,hm-1.25])rotate([-90,0,0])
      cylinder(r=1.256,h=32);    
  }
