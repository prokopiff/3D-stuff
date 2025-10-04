// https://www.thingiverse.com/thing:6015114
use <holder_tall.scad>

module fixture() {
  difference() {
    import("c03mount-40v2.stl");
    
    translate([9.3, -80, -10])
    rotate([0, 40, 0])
    cube([50, 50, 50]);

    translate([9.3, -80, 19])
    rotate([0, 130, 0])
    cube([50, 50, 50]);
    
    translate([9.3, -50.1, 0])
    cube([50, 50, 50]);

    translate([9.3, -113.43, 0])
    cube([50, 50, 50]);

  }
}

//base();
//for (i = [-1 : 2 : 1]) {
//  for (j = [-1 : 2 : 1]) {
//    translate([
//      i * 9, 
//      j * 1.3, 
//      3.4
//    ])
//    support(i);
//  }
//}
//translate([56.9, 24, -7])
//rotate([0, 0, -90])
fixture();