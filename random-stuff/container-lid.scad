$fa = 2;
$fs = 0.25;

w = 76;
fw = 70;
l = 83;
r = 18;
h = 2;

module base() {
  linear_extrude(2)
  hull() {
    polygon([
      [0, w/2],
      [0, -w/2],
      [l, 0]
    ]);
    translate([l-r, fw/2-r, 0])
      circle(r);
    translate([l-r, -(fw/2-r), 0])
      circle(r);
  }
}

ow1 = 59;
ow2 = 64;
ol = 67;
r1 = 18;
r2 = 18;
module opening_shape() {
  hull() {
    translate([-(ol/2-r1), ow1/2-r1, 0])
      circle(r1);
    translate([-(ol/2-r1), -(ow1/2-r1), 0])
      circle(r1);
    
    translate([ol/2-r2, ow2/2-r2, 0])
      circle(r2);
    translate([ol/2-r2, -(ow2/2-r2), 0])
      circle(r2);
  }
}

module lid1() {
  oh = 4;
  module opening() {
    lip = 1.02;
    hole = 0.96;
    color("red")
    difference() {
      union() {
        linear_extrude(oh)
          opening_shape();
        linear_extrude(2)
        scale([lip, lip, lip])
          opening_shape();
      }
      linear_extrude(oh)
      scale([hole, hole, hole])
        opening_shape();
    }
  }
  
  base();
  translate([l-ol/2-ol*0.02, 0, -oh])
  rotate([0, 0, 180])
    opening();
}

module lid2() {
  d1 = 9;
  d2 = 10;
  d3 = 7.5;
  h = 4;
  module pin() {
    color("red")
    translate([0, 0, -h/2])
    difference() {
      union() {
        cylinder(h = h, d = d1, center = true);
        translate([0, 0, -h/4])
        cylinder(h = h/2, d = d2, center = true);
      }
      cylinder(h = h, d = d3, center = true);
    }
  }
  
  base();
  translate([5+d1/2, 22+d1/2, 0])
    pin();
  translate([5+d1/2, -(22+d1/2), 0])
    pin();
  translate([5+d2+49, 17.5+d2/2, 0])
    pin();
  translate([5+d2+49, -(17.5+d2/2), 0])
    pin();
}

module pivot() {
  translate([0, 0, 2.3]) // remove this
  difference() {
    union() {
      translate([0, 0, 2])
      rotate([90, 0, 0])
        cylinder(d = 4, h = 8, center = true);
      translate([1.1, 0, 0])
        cube([1.75, 8, 4], center = true);
    }
    translate([0, 0, 2])
    rotate([90, 0, 0])
      cylinder(d = 1.8, h = 8, center = true);
  }
}


module handle() {
  translate([0, 0, -8.2])
  intersection() {
    difference() {
      sphere(20);
      sphere(18);
    }
    translate([-10, 0, 18])
      cube([16, 50, 16], center = true);
  }
}

module all() {
  translate([0.2, 0, 0])
    lid1();

  rotate([0, 0, 180])
    lid2();

  pivot();
  translate([0, 8.2, 0])
  rotate([0, 0, 180])
    pivot();
  translate([0, -8.2, 0])
  rotate([0, 0, 180])
    pivot();
  
  translate([65, 0, 0])
    handle();
}


all();

















