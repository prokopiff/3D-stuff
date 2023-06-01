use <../mcad/2Dshapes.scad>;

$fa = 1;
$fs = 0.15;

linear_extrude(19)
difference() {
  rotate([0, 0, 30])
    ngon(6, 45.5/2, true);
  
  rotate([0, 0, 30])
    ngon(6, 45.5/2-2, true);
  
  translate([0, 50, 0])
    square([100, 100], true);
}

//peg
d = 9;
h = 23;

translate([0, 0, -3])
rotate([90, 0, 0])
  cylinder(h = h, d = d, center = true);

translate([0, h/2+0.5, -3])
rotate([90, 0, 0])
  cylinder(h = 1, d = d+1, center = true);

translate([0, -h/2-0.5, -3])
rotate([90, 0, 0])
  cylinder(h = 1, d = d+1, center = true);

hull() {
  translate([0, -h/2-0.5, -3])
  rotate([90, 0, 0])
    cylinder(h = 1, d = d, center = true);
  
  translate([0, -h/2-7, 4.5])
  rotate([90, 0, 0])
    cylinder(h = 1, d = d, center = true);
}