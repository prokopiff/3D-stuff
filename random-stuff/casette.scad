use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

w = 100.4;
h = 63.3;
d1 = 8.6;
d2 = 12;
r = 3;
bh = 15;
bw = 70;
bw2 = 61;

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
