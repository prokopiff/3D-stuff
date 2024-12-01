$fa = 1;
$fs = 0.15;

h = 26;
w = 66;
d = 31;

bd = 17;

module micro() {
  color("red")
  rotate([90, 0, 0])
  hull() {
    translate([9-2.5, 3/2, 0])
    cylinder(d = 3, h = 5);
    translate([3/2, 3/2, 0])
    cylinder(d = 3, h = 5);
  }
}

module shape() {
  hull() {
    cube([w, d, h]);
    
    translate([0, d/2, h+11])
    rotate([0, 90, 0])
    cylinder(h = w, d = bd);
  }
}

module pwn() {
  shape();
  
  translate([0, 0, 1]) {
    // connector
    translate([-1.5/2, d/2, 24.5-1.5/2])
    cube([1.5, 18, 1.5], center = true);
    
    // sd
    translate([w+2.5, d/2+2, 22.5-1.5/2])
    cube([5, 12, 2], center = true);

    // onoff
    translate([w+2.5, d/2, 14-1.5/2])
    cube([5, 8, 3], center = true);
    
    // screen connector
    translate([w+2.5/2, d/2, 2])
    cube([2.5, 16, 5], center = true);
    
    // screen
    translate([5, 2, -5])
    cube([w-15, d-4, 5]);
    
    translate([8, 0, 20])
    micro();
    translate([20, 0, 20])
    micro();
    translate([11.3, 0, 11.7])
    scale([1.2, 1, 1.1])
    micro();
    translate([48, 0, 12])
    micro();
  }
}

cut = 1;
s = 1.07;
difference() {
  translate([-(s-1)*w/2, -(s-1)*d/2, -(s-1)*(bd+11)/2])
  scale([s, s, s])
  shape();
  pwn();
  if (cut == 1) {
    translate([w-0., -5, -5])
    cube([100, 100, 100]);
    translate([w-2.5, 40, h/4])
    rotate([90, 0, 0])
    cylinder(d = 2, h = 50);
    translate([w-2.5, 40, h/3*2.4])
    rotate([90, 0, 0])
    cylinder(d = 2, h = 50);
    translate([w-2.5, 40, h*1.4])
    rotate([90, 0, 0])
    cylinder(d = 2, h = 50);

  }  
}
