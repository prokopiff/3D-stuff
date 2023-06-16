$fa = 1;
$fs = 0.15;

total_d = 72.9 * 2 + 54.1;

ball_d = 46;
total_h = 57;

overlap = 6;

outer_wall = 3;
lip = 15;
lip_h = 3;

sh_to_edge = 7;
h2_to_edge = 4;
h2_dist = 15;
hole_d = 4.2;

difference() {
  cylinder(d=total_d, h=total_h-ball_d+overlap, center=true);
  cylinder(d=total_d-lip*2, h=total_h-ball_d+overlap, center=true);
  translate([0, 0, lip_h])
    cylinder(d=total_d-outer_wall*2, h=total_h-ball_d+overlap-lip_h, center=true);
  
  translate([0, -500, 0])
  cube([1000, 1000, 1000], center=true);

  translate([0, total_d/2-sh_to_edge-hole_d/2, 0])
    cylinder(d = hole_d, h = 100, center = true);  

  translate([total_d/2-h2_to_edge-hole_d/2, h2_dist/2, 0])
    cylinder(d = hole_d, h = 100, center = true);  

  translate([-(total_d/2-h2_to_edge-hole_d/2), h2_dist/2, 0])
    cylinder(d = hole_d, h = 100, center = true);  
}

