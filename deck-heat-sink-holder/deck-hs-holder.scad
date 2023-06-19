$fa = 1;
$fs = 0.15;

use <../mcad/boxes.scad>;

module deck() {
  s = 1.005;
  scale([s, s, s])
  import("steamdeck_stl_20220202.stl");
  translate([74.3, -57, -9.3])
  rotate([0, 90, 0])
    cylinder(d=4, h=14, center=true);

      
  translate([60, -57.4, -4.3])
  rotate([0, 90, 0])
    cylinder(d=3, h=65, center=true);
  translate([60, 57.2, -14])
  rotate([0, 90, 0])
    cylinder(d=3, h=65, center=true);
}

x = 53.6;
y = 53.6;
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
      cube([x, 7.5, z], center=true);
      
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
  w = 1.8;
  h = 25-d;
  
  color("red")
  
  hull()
  for(i = [0 : 2]) {
    translate([i * (w + d), 0, 0])
    linear_extrude(15)
    hull() {
      circle(d = d);
      translate([0, h, 0])
        circle(d = d);
    }
  }
  
  hull()
  for(i = [3 : 5]) {
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

  translate([58, 22, -19])
  rotate([180, 0, 90])
  hs();
  
  translate([34.1, -33.3, -30])
  vent_neg();
  
  //usb
  translate([51, 60, -8.5])
  rotate([90, 0, 0])
    roundedCube([15, 8, 15], r=3, sidesonly=true, center=true);

  //led
  translate([64.6, 61, -8.5])
  rotate([90, 0, 0])
    cylinder(h=15, d=3.5, center=true);

  //button
  translate([76.8, 61, -8.5])
  rotate([90, 0, 0])
    cylinder(h=15, d=9.5, center=true);

  //screen
  translate([58, 0, 0])
    cube([65, 115, 15], center=true);

  translate([28, -51, -14.6])
    cube([6, 6, 6], center=true);
 
  translate([28, 40, -15.6])
    cube([6, 6, 6], center=true); 
}

module holder() {
  color("pink")
  translate([58, 0, -12.3])
  rotate([0, 90, 0])
    roundedCube([27, 125, 60], r=10, sidesonly=true, center=true);
    
  #translate([58, -60, -2])
  cube([30, 1, 5], center=true);
}

module main() {
  difference() {
    holder();
    all();
  }
}

main();

//deck();
