use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

w = 100.4;
h = 64;
d1 = 9;
d2 = 12.4;
r = 3;
bh = 16;
bw = 70;
bw2 = 63;

xh = 18 + 10;
xw = 3.5;
xg = 5;
xd = 5;

module cassette() {
  color("red")
  translate([w/2+xd/2-4, -(h/2-xh/2+10-xg), 0])
  cube([xd, xh, xw], center = true);

  color("red")
  translate([-(w/2+xd/2-4), -(h/2-xh/2+10-xg), 0])
  cube([xd, xh, xw], center = true);

  roundedCube([w, h, d1], r, true, true);

  color("green")
  intersection() {
    translate([0, -h/2, 0])
    rotate([0, 90, 0])
    linear_extrude(bw, center = true)
    polygon([
      [-d2/2, 0],
      [d2/2, 0],
      [d2/2, bh],
      [0, bh + d2/2*3/4],
      [-d2/2, bh]
    ]);

    translate([0, -h/2, 0])
    linear_extrude(d2, center = true)
    polygon([
      [-bw/2, 0],
      [bw/2, 0],
      [bw2/2, bh],
      [bw2/2, bh+10],
      [-bw2/2, bh+10],
      [-bw2/2, bh]
    ]);
  }
}

cassette();