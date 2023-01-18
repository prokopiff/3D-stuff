$fa = 1;
$fs = 0.15;

clip_w = 80;
clip_d = 6;
clip_hook = 2;
clip_h = 25;

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
  
  translate([magic+(clip_d+thickness)/2, -(clip_w/2+thickness/2-clip_hook/2), clip_h/2-thickness/4])
    cube([clip_d+thickness, thickness+clip_hook, thickness/2], center = true);
  translate([magic+(clip_d+thickness)/2, (clip_w/2+thickness/2-clip_hook/2), clip_h/2-thickness/4])
    cube([clip_d+thickness, thickness+clip_hook, thickness/2], center = true);
}

t=4;
adj=0.1;
module slot() {
  slot_w = 12-adj;
  slot_h = 3-adj;
  cube([t, slot_w-t, clip_h], center = true);
  
  translate([-(t/2+slot_h/2), 0, 0])
    cube([slot_h, slot_w, clip_h], center = true);
  
  translate([-adj, 0, -(clip_h/2-t/4)])
    cube([slot_h + t/4 + 1, slot_w, t/2], center=true);
}

slot();
bracket();
