$fa = 1;
$fs = 0.15;

s = 0.1587;
module bottom() {
  translate([115.7, -10.1, 5.5])
  scale([s, s, s])
  rotate([90, 0, 180])
  linear_extrude(2 / s) {
    import("test0001.svg");
  }
}

module case() {
  import("crtbk.stl");
}

//color("red")
//bottom();
case();