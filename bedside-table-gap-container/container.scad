total_l = 450;
gap = 69;
depth = 75;
lip = 10;
t = 2.6;
charger_w = 72;
charger_h = 30;

module two_d_shape() {
  square([t, depth+t]);
  square([gap, t]);
  translate([gap-t, 0, 0])
    square([t, depth+t]);
  translate([-lip, depth, 0])
    square([lip, t]);
}

module extrusion() {
  linear_extrude(total_l)
    two_d_shape();
}

module shell() {
  extrusion();

  color("blue") {
    cube([gap, depth+t, t]);
    translate([charger_h, 0, t])
      cube([t, depth, charger_w]);
  }
}

hole_interval = 20;
hole_h = 2*t;
hole_w = t;
holes_gap = depth - hole_h*2 - 10;
  
module holes() {
  color("red")
  for (i = [0 : 1 : (total_l-charger_w-t)/hole_interval]) {
    translate([0, 5+t, t+charger_w+i*hole_interval])
      cube([t, hole_h, hole_w]);
    
    translate([gap-t, 5+t, t+charger_w+i*hole_interval])
      cube([t, hole_h, hole_w]);
    
    translate([0, 5+t+holes_gap, t+charger_w+i*hole_interval])
      cube([t, hole_h, hole_w]);
    
    translate([gap-t, 5+t+holes_gap, t+charger_w+i*hole_interval])
      cube([t, hole_h, hole_w]);
  }
}

module hole() {
  linear_extrude(5) {
    hull() {
      translate([11, 0, 0])
      circle(d = 12);
      translate([-11, 0, 0])
      circle(d = 12);
    }
  }
}

module final() {
  difference() {
    shell();
    holes();
    translate([t+charger_h/2, 3, t+charger_w/2])
    rotate([90, 90, 0])
      hole();
  }
}

module divider() {
  linear_extrude(t-0.2) {
    translate([t, t, 0])
      square([gap-2*t, depth]);
    
    translate([0, 5+t, 0])
        square([t, hole_h]);
      
      translate([gap-t, 5+t, 0])
        square([t, hole_h,]);
      
      translate([0, 5+t+holes_gap, 0])
        square([t, hole_h]);
      
      translate([gap-t, 5+t+holes_gap, 0])
        square([t, hole_h]);
  }
}

//divider();

final();
