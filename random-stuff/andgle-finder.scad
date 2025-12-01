$fa = 1;
$fs = 0.15;

// base
s = 50;
ss = 0.4;
wall = 2;
slits = 28;
difference() {
  cube([s, s/3, s]);
  for(i = [0 : 1 : slits]) {
    translate([0, wall, wall + (s-2*wall)/slits*(i)])
    cube([s, s/3-2*wall, ss]);
  }
};
