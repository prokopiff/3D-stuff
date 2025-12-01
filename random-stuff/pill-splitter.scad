$fa = 1;
$fs = 0.15;

w = 40;
d = 40;
h = 10;

wall_d = 5;
wall_h = 15;

module splitter(blade_w) {
  difference() {
    union() {
      cube([w, d, h], center = true);
      
      color("red")
      translate([0, -(d - wall_d)/2, (wall_h+h) / 2])
      cube([w, wall_d, wall_h], center = true);

      color("green")
      translate([0, (d - wall_d)/2, (wall_h+h) / 2])
      cube([w, wall_d, wall_h], center = true);
    };
    
    translate([0, 0, (wall_h+h/2)/2])
    cube([blade_w, d, wall_h+h/2], center = true);
    
    translate([0, 0, h/4])
    linear_extrude(h/2, center = true) {
      polygon([
        [0, d/2 - wall_d],
        [-w/3, -(d/2 - wall_d)],
        [w/3, -(d/2 - wall_d)]
      ]);
    };
  };
};

splitter(3);
