$fa = 1;
$fs = 0.15;

md = 5.3;
mh = 1.8;

h = mh * 3;

gap = 0.3;
tw = 1;

difference() {
  rotate_extrude(angle = 360) {
    polygon([
      [0, 0],
      [md * 2, 0],
      [md * 2 + mh, mh],
      [md * 2 + mh, mh * 2],
      [md * 2, mh * 3],
      [0, mh * 3],
    ]);
  };

  d = 0.2;
  translate([md *2-tw, 0, mh*1.5])
  cube([md + gap, md + d, mh + d], center = true);
};

difference() {
  rotate_extrude(angle = 360) {
    translate([gap, 0, 0])
    polygon([
      [md * 2, 0],
      [md * 2 + md + tw, 0],
      [md * 2 + md + tw + mh, mh],
      [md * 2 + md + tw + mh, mh * 2],
      [md * 2 + md + tw, mh * 3],
      [md * 2, mh * 3],
      [md * 2 + mh, mh * 2],
      [md * 2 + mh, mh],
    ], convexity = 5);
  };

  magnets = 10;
  for (i = [0 : magnets]) {
    rotate([0, 0, i * 360 / magnets])
    translate([md * 3-tw/2, 0, mh])
    cylinder(h = mh, d = md);
  }
  
  notches = 72;
  for (i = [0 : notches]) {
    rotate([0, 0, i * 360 / notches])
    translate([md * 3.5 + tw/2, 0, mh])
    cylinder(h = 50, d = 1, center = true);    
  }
};
