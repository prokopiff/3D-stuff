$fa = 1;
$fs = 0.15;

use <../mcad/boxes.scad>;

module deck() {
  import("steamdeck_stl_20220202.stl");
}

x = 53;
y = 53;
z = 30.8;
module hs() {
  color("blue")
  translate([0, 0, 0.5])
    cube([x, y, 1.05], center=true);
  
  color("black")
  translate([0, 0, z/2+1])
  difference() {
    cube([x, y, z], center=true);

    translate([0, 0, 4.55])
      cube([x, 8, z], center=true);
      
    mid_pole_w = 1.2;
    mid_pole_gap = 2.7;
    mid_h = 4.75;
    
//    translate([(mid_pole_w+mid_pole_gap)/2, 0, mid_h])
//      cube([mid_pole_gap, y, z], center=true);
//    translate([-(mid_pole_w+mid_pole_gap)/2, 0, mid_h])
//      cube([mid_pole_gap, y, z], center=true);    
  }  
}

module vent_neg() {
  d = 7.8;
  w = 1.7;
  h = 25-d;
  
  color("red")
  
  for(i = [0 : 5]) {
    translate([i * (w + d), 0, 0])
    linear_extrude(15)
    hull() {
      circle(d = d);
      translate([0, h, 0])
        circle(d = d);
    }
  }
}

module all() {
  deck();

  translate([58, 20, -19])
  rotate([180, 0, 90])
  hs();
  
  translate([34.1, -33.3, -30])
  vent_neg();
  
  //usb
  color("red")
  translate([51, 60, -8.5])
  rotate([90, 0, 0])
    roundedCube([15, 8, 15], r=3, sidesonly=true, center=true);

  //led
  color("red")
  translate([64.6, 61, -8.5])
  rotate([90, 0, 0])
    cylinder(h=15, d=3.5, center=true);

  //button
  color("red")
  translate([76.8, 61, -8.5])
  rotate([90, 0, 0])
    cylinder(h=15, d=9.5, center=true);

  //screen
  translate([58, 0, 0])
    cube([60, 108, 15], center=true);

  translate([28, -51, -14.6])
    cube([6, 6, 6], center=true);
 
  translate([28, 40, -15.6])
    cube([6, 6, 6], center=true); 
}

module holder() {
  color("pink")
  translate([58, 0, -13.6])
    roundedCube([60, 128, 27], r=5, center=true);
}

difference() {
  holder();
  all();
}
