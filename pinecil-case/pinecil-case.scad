module pinecil() {
  scale([1.05,1.05,1.05])
  import("Pinecil.stl");
}

module hole() {
  hull() {
    pinecil();
    translate([0, 0, 200])
    pinecil();
  }
}

module cyl() {
  include <Screw Top Cylinder.scad>;
}

module a() {
    cyl();

    color("blue")
    translate([0, 0, 2])
    cylinder(h = 158, d = 20);
}

module main() {
  difference() {
    a();
    translate([-316*1.05, -131*1.05, 2])
    hole();
  }
}

module extender() {
  difference() {
    translate([0, 0, 19])
    cyl();
    scale([1.03, 1.03, 1])
    main();
    color("blue")
    translate([0, 0, 2])
    cylinder(h = 158, d = 24);
  }
  
}

//main();

extender();