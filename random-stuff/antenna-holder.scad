$fa = 1;
$fs = 0.15;


l = 73;
w = 21;

linear_extrude(l) {
  translate([-0.9, -0.5, 0])
  rotate([0, 0, 30])
  square([2, 15]);
  difference() {
    hull() {
      circle(d = 2);
      translate([w, 0, 0])
        circle(d = 2);
    }
    translate([w/2, 0, 0])
      square([w, 0.6], center = true);
  }
}