use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

module original() {
  import("fan-guide-front.stl");
}

module holes() {
  d = 105;
  fan_d = 114;
  bolt_d = 5;
  
  for (i = [-1:2:1]) {
    for (j = [-1:2:1]) {
      translate([d/2 * i, d/2 * j, 0])
      cylinder(d = bolt_d, h = 100);
    }
  }
  
  translate([0, 0, 50])
  roundedCube([fan_d, fan_d, 100], 45, true, true);
}

module guide() {
  rotate_extrude(angle = 90) {
    translate([60, 0, 0])
    square([2, 33.5]);
  }
}

difference() {
  original();

  translate([73, 100, 123])
  rotate([-90, 0, 0])
  holes();
  
  //cable cutout
  color("red")
  translate([72, 166, 179.7])
  cube([6, 3, 4]);
}

color("blue")
translate([76.3, 165, 124.2])
rotate([90, 0, 0])
guide();

color("purple")
translate([76.3, 165, 122])
rotate([90, 90, 0])
guide();

color("green")
translate([70.2, 165, 122])
rotate([90, 180, 0])
guide();
