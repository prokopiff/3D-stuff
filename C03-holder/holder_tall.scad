$fa = 1;
$fs = 0.05;

base_w = 35;
hole_d = 0.7;
base_ring_d = 4.7;
base_thickness = 0.8;

holder_w = 13;

holes_w = 17;

cube_w = 4;
cube_h = 6;

conn_w = base_ring_d * 0.75;

module top() {
  color("red")
  difference() {
    translate([0, 0, (cube_h + base_thickness) / 2])
    cube([cube_w * 2 + holder_w, conn_w, cube_h], center = true);
    
    translate([0, base_thickness, cube_h / 2 + base_thickness / 2])
    cube([holder_w, conn_w, cube_h], center = true);
  }
};

module holes() {
  for (i = [-1 : 2 : 1]) {
    translate([i * (holes_w / 2), 0, (cube_h + base_thickness) / 2])
    cylinder(d = hole_d, h = cube_h, center = true);
  }
}

module base() {
  for (i = [-1 : 2 : 1]) {
    
    translate([i * base_w / 2, 0, 0])
    color("orange")
    difference() {
      cylinder(d = base_ring_d, h = base_thickness, center = true);
      cylinder(d = hole_d, h = base_thickness, center = true);
    }
  }
  color("orange")
  cube([base_w - hole_d, conn_w, base_thickness], center = true);
};

module support(rot) {
  difference() {
    cube([cube_h, base_thickness, cube_h], center = true);
    rotate([0, -rot * 45, 0])
    translate([rot*cube_h/2, 0, 0])
    cube([cube_h, cube_h, cube_h*2], center = true);
  }
};

base();
difference() {
  top();
  holes();
}

for (i = [-1 : 2 : 1]) {
  for (j = [-1 : 2 : 1]) {
    translate([
      i * (holder_w/2 + cube_w * 1.5), 
      j * (conn_w - base_thickness) / 2, 
      (cube_h + base_thickness) / 2
    ])
    support(i);
  }
}