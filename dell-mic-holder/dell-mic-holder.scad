$fa = 1;
$fs = 0.15;

clip_w = 80;
clip_d = 6;
clip_hook = 2;
clip_h = 40;

thickness = 2.4;
r = 150;
magic = 5.44;

module bracket() {
  intersection() {
    translate([r, 0, 0])
    difference() {
      cylinder(r = r, h = clip_h, center = true);
      cylinder(r = r-thickness, h = clip_h, center = true);
    }
    cube([20, clip_w, clip_h], center = true);
  }
  translate([magic+(clip_d+thickness)/2, -(clip_w/2+thickness/2), 0])
    cube([clip_d+thickness, thickness, clip_h], center = true);


  translate([magic+(clip_d+thickness)/2, (clip_w/2+thickness/2), 0])
    cube([clip_d+thickness, thickness, clip_h], center = true);

  translate([magic+clip_d+thickness*1.5, (clip_w/2+thickness/2-clip_hook/2), 0])
    cube([thickness, thickness+clip_hook, clip_h], center = true);

  translate([magic+clip_d+thickness*1.5, -(clip_w/2+thickness/2-clip_hook/2), 0])
    cube([thickness, thickness+clip_hook, clip_h], center = true);
}

module catch() {
    d = 40;
    
    translate([-(d/2-4), 0, 0])
    intersection() {
        cylinder(h = 4, d = d, center = true);
        translate([d/2-2, 0, 0])
          cube([4, d, 4], center = true);
    }
}

h = 25;
d1 = 5.2;
side_wall = 3;
d2 = d1 + 2 * side_wall;
c = 4;
module hole() {
  h = 25;
  d1 = 5.2;
  side_wall = 3;
  d2 = d1 + 2 * side_wall;
  c = 4;
  
  linear_extrude(h, center = true)
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


module model() {
  bracket();

  color("red")
  translate([thickness*1.8, 0, clip_h/2])
  rotate([0, 90, 0])
    catch();
  
  translate([-1, 0, (clip_h - h)/2])
  rotate([0, 0, 180])
    hole();  
}

translate([0, 0, clip_h/2])
rotate([0, 180, 0])
  model();