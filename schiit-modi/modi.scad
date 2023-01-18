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
  translate([-length/2, width/2, -height/2])
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

screw_thickness = 2;
screw_d = 6;
module screw() {
  color("black")
  translate([-screw_thickness, 0, 0])
  rotate([0, 90, 0])
    cylinder(h = screw_thickness, d = screw_d);
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
  color("lightgrey")
  translate([length, -(width-logo_to_left), logo_to_bottom])
    cube([fake_thickness, logo_width, logo_height]);
    
  //led
  color("white")
  translate([length+fake_thickness/2, -(led_to_right+led_d/2), led_to_bottom+led_d/2])
  rotate([0, 90, 0])
    cylinder(h = fake_thickness, d = led_d, center = true);
  
  //switch
  color("silver")
  translate([length+fake_thickness/2, -(switch_w/2+switch_to_right), switch_h/2+switch_to_bottom])
  rotate([0, 90, 0])
    roundedCube([switch_h, switch_w, fake_thickness], switch_w/2, true, true);
  
  //screws
  translate([0, -(15.8+screw_d/2), height-4-screw_d/2])
    screw();
  translate([0, -(44+screw_d/2), height-4.8-screw_d/2])
    screw();
  translate([0, -(61.4+screw_d/2), height-5.5-screw_d/2])
    screw();
    
  toslink_h = 10;
  toslink_w = 11;
  color("black")
  translate([-fake_thickness, -(width-58+toslink_w/2), 8])
    cube([fake_thickness, toslink_w, toslink_h]);
}


t = 4;
difference() {
  intersection() {
    resize([length+t, width+t, height+t])
      shell();

    cube([20, 150, 50], center = true);
  }
  shell();
  translate([0,0,height/2])
    cube([30, width-6, 6], center = true);
}
translate([0, width/2+t/2+0.8, height/2+t/2-0.8])
  cube([20, 1.6, 1.6], center = true);
translate([0, -(width/2+t/2+0.8), height/2+t/2-0.8])
  cube([20, 1.6, 1.6], center = true);

slot_w = 12;
slot_h = 3;
difference() {
translate([0, 0, -(height/2+t/2+(slot_h+t/2)/2)])
  cube([20, slot_w+t, slot_h+t/2], center = true);

translate([0, 0, -(height/2+t/2+slot_h/2)])
  cube([20, slot_w, slot_h], center = true);
  
translate([0, 0, -(height/2+t/2+slot_h/2)])
  cube([20, slot_w-slot_h*2, slot_h+t], center = true);

}
//shell();

//use <dell_clip.scad>;
//translate([0, 0, -23])
//rotate([0, 90, 0]) {
//  slot();
//  bracket();
//}