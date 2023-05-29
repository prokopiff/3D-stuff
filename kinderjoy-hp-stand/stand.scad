h1 = 6;
h2 = 12;
t = 2;

w1 = 5;
w2 = 3;
d = 2.5;

dd = 19;
ww = 23;

to_front = 6.5;

translate([0, 0, -t/ 2])
difference() {
  cube([ww, dd, t], center = true);

  //taper
  translate([0, -dd/2, sqrt(2*2.5*2.5)-t/2])
  rotate([45, 0, 0])
  cube([ww, 5, 5], center = true);
}

translate([0, -(dd/2-d/2-to_front), 0]) {
  color("blue")
  translate([0, 0, h1/2])
  cube([w1, d, h1], center = true);

  color("orange")
  translate([-w1/2+w2/2, 0, h2/2])
  cube([w2, d, h2], center = true);
}