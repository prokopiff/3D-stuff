t = 5.5;
w = 40;
di = 23;
dd = 26;

linear_extrude(w) {
  square([di, t]);

  translate([-1.5, 0, 0])
  square([1.5, t+3]);

  color("red")
  translate([di, 0, 0])
  square([1.5, t]);

  color("blue")
  translate([di, t, 0])
  rotate([0, 0, -10])
  square([1.5, t-1]);
}