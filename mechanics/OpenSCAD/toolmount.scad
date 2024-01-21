$fn=50;
laenge=70;

difference(){
  union(){
    translate([-9,0,5]){
      rotate([0,90,0]){
        cylinder(r=5,h=18);
      }
    }
    difference(){
      translate([-9,0,0]){
        cube([18,laenge,10]);
      }
      translate([-4,2,-1]){
        cube([5,18,12]);
      }
    }
  
  
  
  }
// end of union  
// beginn difference
  
  translate([-10,0,5]){
    rotate([0,90,0]){
      cylinder(r=1.9,h=20);
    }
  }
  translate([-10,12,5]){
    rotate([0,90,0]){
      cylinder(r=1.4,h=20);
    }
  }
translate([0,laenge-28,-1]){
    rotate([0,0,0]) {
	    linear_extrude(height=13)
	    polygon(points = [[0, 0],[-6,6],[6, 6]]);
    }
}
translate([-6,laenge-22.01,-1]){
  cube([12,10,13]);
}
translate([-3.5,laenge-8,-1]){
  cube([7,3.5,12]);
}
  translate([0,laenge+0.01,5]){
    rotate([90,0,0]){
      cylinder(r=2.1,h=20);
    }
  }
 // translate([-10,laenge-35,5]){
 //   rotate([0,90,0]){
 //     cylinder(r=3,h=20);
 //   }
 // }
//translate([-11,25,1]){
// cube([22,5,12]);
//}

}

// end difference

 