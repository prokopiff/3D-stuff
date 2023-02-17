use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

width = 127;
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

t = 4;
w = 12;
difference() {
  intersection() {
    resize([length+t, width+t, height+t])
      shell();

    cube([w, 150, 50], center = true);
  }
  shell();
  translate([0,0,height/2])
    cube([30, width-6, 6], center = true);
}
translate([0, width/2+t/2+0.8, height/2+t/2-0.8])
  cube([w, 1.6, 1.6], center = true);
translate([0, -(width/2+t/2+0.8), height/2+t/2-0.8])
  cube([w, 1.6, 1.6], center = true);

adj = 0.3;
slot_w = 12 + adj;
slot_h = 3.1;
difference() {
translate([0, 0, -(height/2+t/2+(slot_h+t/2)/2)])
  cube([w, slot_w+t, slot_h+t/2], center = true);

translate([0, 0, -(height/2+t/2+slot_h/2)])
  cube([w, slot_w, slot_h], center = true);
  
color("red")
translate([0, 0, -(height/2+t/2+slot_h/2)])
  cube([w, slot_w-slot_h*2, slot_h+t], center = true);

}
//shell();
