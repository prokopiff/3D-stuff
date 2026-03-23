$fa = 1;
$fs = 0.05;

tag_d = 26.5;
tag_h = 3;
wall = 1;

module tag() {
  cylinder(d = tag_d, h = tag_h, center = true);
};

difference() {
  hull() {
    rotate_extrude() {
      translate([tag_d / 2, 0, 0])
      circle(d = tag_h + 2 * wall);
    };
  };

  hull() {
    tag();

    scale([0.9, 0.9, 0.1])
    translate([tag_d, 0, 0])
    tag();
  };
};

translate([(tag_d + 5) / 2 +1, 0, 0])
difference() {
  cylinder(d = 5, h = tag_h, center = true);
  cylinder(d = 3, h = tag_h, center = true);
};