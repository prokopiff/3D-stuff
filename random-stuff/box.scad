use <casette.scad>;
use <../mcad/boxes.scad>;


$fa = 1;
$fs = 0.15;

us = 1.01;
w = 100;
cw = (100.4 + 2) * us + 5;
g = 3;
ch = 64 - g + 3;
bottom = 2.5;
d2 = 12.4 * us;
difference() {
  roundedCube([cw, w, ch], 3, true, true);

  for (i = [0 : 1 : 3]) {
    a = i % 2 == 0 ? 1 : -1;
    
    c = 0.3*i;
    color(c = [c, c, c])
    translate([0, -i*d2, g/2+bottom])
    rotate([-90, 3*a, 0])
    scale([us, us, us])
    cassette(); 

    color([c, c, c])
    translate([0, i*d2, g/2+bottom])
    rotate([-90, 3*a, 0])
    scale([us, us, us])
    cassette(); 
  }
}