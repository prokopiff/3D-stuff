$fa = 1;
$fs = 0.15;

hole_centers = [
  [-14.9, 9],
  [23, 14.9],
  [-51.65, 14],
  [-94, -17],
  [-9, -52]
];

legs = [
  [-83, 40],
  [-93, 4],
  [-91, -58],
  [-20, -60],
  [10, 16],
  [23, -46],
  [-43, 25.5]
];

thickness = 2.5;

s = 0.1587;

module screw(t) {
  color("purple")
  translate(t)
  rotate([90, 0, 0]) {
    cylinder(h = 5, d = 4.5, center = true);
    translate([0, 0, 1.4])
      cylinder(h = 1.5, d1 = 4.5, d2 = 8.5, center = true);
  }
}

module leg(t) {
  color("red")
  translate(t)
  rotate([90, 0, 0])
    cylinder(h = 0.7, d = 9, center = true);
}

module bottom() {
//  color("red")
  translate([115.7, -10.1, 5.5])
  scale([s, s, s])
  rotate([90, 0, 180])
  linear_extrude(thickness / s) {
    import("test0001.svg");
  }
}

module case() {
  import("crtbk.stl");
}


//case();
difference() {
  bottom();
  for (i = [0 : 1 : 4]) {
    screw([hole_centers[i][0], -8, hole_centers[i][1]]);
  }
  for (i = [0 : 1 : len(legs)-1]) {
    leg([legs[i][0], -9.75, legs[i][1]]);
  }
}
