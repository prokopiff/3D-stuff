use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

width = 122;
length = 89;
height = 32;
radius = 6;
leg_to_side = 5;
leg_to_front = 6;
leg_to_back = 5;
leg_d = 9.5;
leg_h = 3;

module leg(pos = [0, 0, 0]) {
  color("black")
  translate([pos[0], pos[1], pos[2]])
  cylinder(h = leg_h, d = leg_d);
}

module shell() {
  color("grey", 1.0)
  rotate([90, 0, 0])
  linear_extrude(width)
  hull() {
    polygon([
      [0, 0],
      [length, 0],
      [0, height]
    ]);
    translate([length-radius, height-radius, 0])
      circle(radius);
  }
}

module body() {
  logo_width = 25;
  logo_to_left = 10;
  logo_height = 6;
  logo_to_bottom = 12.5;
  fake_thickness = 2;
  led_d = 2.5;
  led_to_bottom = 14;
  led_to_right = 40.5;
  switch_w = 5;
  switch_h = 11;
  switch_to_right = 13;
  switch_to_bottom = 10;
  
  shell();
  leg([leg_to_back+leg_d/2, -(leg_to_side+leg_d/2), -leg_h]);
  leg([leg_to_back+leg_d/2, -(width-leg_to_side-leg_d/2), -leg_h]);
  leg([length-leg_to_front-leg_d/2, -(leg_to_side+leg_d/2), -leg_h]);
  leg([length-leg_to_front-leg_d/2, -(width-leg_to_side-leg_d/2), -leg_h]);
    
  //logo
  color("lightgrey", 1.0)
  translate([length, -(width-logo_to_left), logo_to_bottom])
    cube([fake_thickness, logo_width, logo_height]);
    
  //led
  color("white", 1.0)
  translate([length+fake_thickness/2, -(led_to_right+led_d/2), led_to_bottom+led_d/2])
  rotate([0, 90, 0])
    cylinder(h = fake_thickness, d = led_d, center = true);
  
  //switch
  color("silver", 1.0)
  translate([length+fake_thickness/2, -(switch_w/2+switch_to_right), switch_h/2+switch_to_bottom])
  rotate([0, 90, 0])
    roundedCube([switch_h, switch_w, fake_thickness], switch_w/2, true, true);
  
}

body();
