$fa = 1;
$fs = 0.05;

ANGLE = 40;

rotate([180, -ANGLE, 180])
translate([-9.1, -10.15, -1.7])
import("CO3.stl"); // https://makerworld.com/en/models/938312

inner_w = 22;
post_w = 1.7;
gap = 1.4;

base_front = 2.3;
base_back = 1.5;

h = 3;

base_box_w = 4.5;
base_box_h = 1.5;

module left() {
  module holder() {
    rotate([90, 0, 0])

    linear_extrude(2) {
      //front
      translate([-(post_w + gap) / 2, 0, 0])
      hull() {
        translate([0, -(h - gap)/2, 0])
        circle(d = gap);

        translate([0, (h - gap)/2, 0])
        circle(d = gap);
      }
      //back
      translate([(post_w + gap) / 2, -(base_front - base_back), 0])
      hull() {
        translate([0, -(h - gap)/2, 0])
        circle(d = gap);

        translate([0, (h - gap)/2, 0])
        circle(d = gap);
      }

      translate([gap/2+0.3+1, -(base_front - base_back + h + 0.3), 0])
      square([base_box_w, base_box_h], center = true);
    }
  }

  translate([0, -inner_w / 2, 0])
  holder();

  translate([0, -inner_w / 2 + 4 / 2, 0])
  hull() {
    holder();
  }
}

left();

mirror([0, 1, 0])
left();























