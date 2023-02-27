use <../mcad/boxes.scad>;
use <../mcad/nuts_and_bolts.scad>;

$fa = 1;
$fs = 0.15;

h = 25;
h1 = 32;

t = h1 - h;
w = 26;
l = 200;

slot_w = 5.3;
slot_from_edge = 10;
slot_l = l - 2*slot_from_edge - 60;

module main() {
  difference() {
    roundedCube([w, l, t], 5, true, true);
    translate([0, (l-slot_l)/2-slot_from_edge, 0])
      roundedCube([slot_w, slot_l, t], slot_w/2, true, true);
  }
  translate([w/2-r_t/2-e, 0, r_w/3])
    stiffness_rib();
  translate([-(w/2-r_t/2-e), 0, r_w/3])
    stiffness_rib();
  
  translate([loop_h/2+loop_w/2, -(l/2+c/2-1), d2/2-t/2])
  rotate([90, 0, -90])
    loop();

difference() {
  translate([-(loop_h/2+loop_w/2), -(l/2+c/2-1), d2/2-t/2])
  rotate([90, 0, -90])
    loop();
  
  translate([-(loop_h/2+loop_w/2+1.5), -(l/2+c/2+8), d2/2-t/2])
  rotate([0, 270, 0])
  rotate([0, 0, 30])
  scale([1.05, 1.05, 1.05])
    nutHole(6);
}
  cx = 20;
  cy = 10;
  cz = 10;
  translate([0, -l/2+cy/2+0.5, d2/2 - cz/2 + t/2])
    cube([cx, cy, cz], true);
}

r_w = 5.2+3*2;
r_t = 3;
e = 2;
module stiffness_rib() {
  rotate([0, 90, 0])
    roundedCube([r_w, l-2*e, r_t], r_w/2, true, true);
}

loop_h = 5;
loop_w = 6;
d1 = 8;
side_wall = 3;
d2 = d1 + 2 * side_wall;
c = 4;
module loop() { 
  linear_extrude(loop_h, center = true)
  difference() {
    hull() {
      square([c, d2], center = true);
      translate([d2/2+c/2, 0, 0])
        circle(d = d2);
    }
    translate([c/2+d2/2, 0, 0])
      circle(d = d1);
  }
}

main();
