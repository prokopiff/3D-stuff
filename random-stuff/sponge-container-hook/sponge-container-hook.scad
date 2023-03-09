$fa = 1;
$fs = 0.15;

w = 42;
d = 13;
d2 = 57;
t = 3;
hd = 11.6;

linear_extrude(hd) {
  rotate([0, 0, 3])
  translate([0, -2.6, 0]) {
      square([w + 2 * t, t]);
    square([t, d + t]);
  }
  translate([w + t, 0, 0])
    square([t, d2 + t + hd]);
}

color("blue")
translate([w + 2 * t, d2 + hd / 2 + t, hd / 2])
rotate([0, 90, 0])
  cylinder(d = hd-0.8, h = 2.2);
translate([w + 2 * t + 2.2, d2 + hd / 2 + t, hd / 2])
rotate([0, 90, 0])
color("red")
  cylinder(h = 1, d = hd);
