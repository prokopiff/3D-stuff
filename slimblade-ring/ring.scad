$fa = 1;
$fs = 0.15;

thread_hole_d = 1.4;
pole_d = 3.8;
pole_h = 5.1;
inside_d = 55.8;
outside_d = 73.3;
outside_thickness = 3.2;
//outside_thickness = 6;
inside_thickness = 2.7;

inner_edge_to_pole = 2.35;

cut = 3.5 - inside_thickness;
width = (outside_d - inside_d) / 2;
echo("Width:", width);

module ring() {
  points = [
    [0, 0],
    [width, 0],
    [width, outside_thickness],
    [0, inside_thickness]
  ];

  rotate_extrude()
  translate([inside_d/2, 0, 0])
    polygon(points);
}


module pole(coords = [0, 0, 0]) {
  translate([coords[0], coords[1], coords[2]-pole_h/2])
  difference() {
    cylinder(h = pole_h, d = pole_d, center = true);
    cylinder(h = pole_h, d = thread_hole_d, center = true);
  }
}

ring();

pole_dist = inside_d / 2 + inner_edge_to_pole + pole_d / 2;

pole([0, pole_dist, 0]);
pole([pole_dist, 0, 0]);
pole([-pole_dist, 0, 0]);
pole([0, -pole_dist, 0]);
