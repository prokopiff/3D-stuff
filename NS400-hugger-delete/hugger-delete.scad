$fa = 1;
$fs = 0.15;

back_r = 19.0 / 2 + 8;

w2 = 29;
w1 = 35;

module body() {
  hull() {
    //back hump
    translate([0, 19.0/2+17, 0]) {
      cylinder(h = w2, r = back_r);
    };

    //back base
    translate([22+19/2, 0, 0])
    linear_extrude(w2)
    polygon([
      [0, 0],
      [-56, 0],
      [-56, 34],
      [-1, 15]
    ]);
  };

  hull() {
    hull() {
      // front hump
      translate([-94, 19.0/2+17+2, 0])
      cylinder(h = w2, r = back_r);

      translate([-(92+19/2+9), 27, 0])
      cylinder(h = w2, r = 9);
    };

    //front base
    translate([-121, 0, 0])
    linear_extrude(w2)
    polygon([
      [0, 0],
      [0, 21],
      [97, 34],
      [97, 0]
    ]);
  };
};

difference() {
  union() {
    body();
    brace();
  }
  
  translate([0, 19.0/2+17, -50])
  cylinder(h = 100, r = 9);
  
  translate([-102, 22, -50])
  cylinder(h = 100, r = 9);
  
  hull() {
    linear_extrude(w2*2)
    polygon([
      [-20, 0],
      [-20, 10],
      [-80, 10],
      [-80, 0]
    ]);
    translate([-77, 31, 0])
    cylinder(r = 3, h = w2);
    translate([-23, 23, 0])
    cylinder(r = 3, h = w2);
  };
};

module brace() {
  difference() {
    union() {
      hull() {
        translate([220*c+2, 19.0/2+17+645*c+5, -10])
        cylinder(h = 6, d = 16);

        translate([0, 19.0/2+17, 5])
        cylinder(h = w2-5, r = 9);
      };

      hull() {
        translate([220*c+2, 19.0/2+17+645*c+5, -10])
        cylinder(h = 6, d = 16);

        translate([-102, 22, 5])
        cylinder(h = w2-5, r = 9);
      };
    };
    
    c = 106/970;
    translate([0, 0, -10]) {
      // clip_hole
      
      translate([220*c+2, 19.0/2+17+645*c+5, 0])
      cylinder(h = w2, d = 9);

      translate([220*c+2, 19.0/2+17+645*c+5, 6])
      cylinder(h = 8, d = 18);
      
      translate([-102, 22, 0])
      cylinder(h = w2, r = 9);
      
      translate([0, 19.0/2+17, 0])
      cylinder(h = w2, r = 9);
    };
  };
};






















