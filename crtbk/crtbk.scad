$fa = 1;
$fs = 0.15;

thumb_translate = [20, 0, 0];

 module c() {
  import("case_v2_v88.stl");
}

module thumb() {
  difference() {
    intersection() {
      c();
      translate([-88.5, 0, 30])
      rotate([0, 26, 0])
        cube([70, 60, 50], center = true);
    }
    translate([-80, 20, -14])
      rotate([-25, 10, 0])
      cube([40, 40, 40], center = true);
  }
}

module point1() {
  intersection() {
    case();
    color("red")
    translate([-100, -2, 5])
      cube([10, 15, 10], center=true);
  }
}

module point2() {
  translate(thumb_translate)
  intersection() {
    thumb();
    color("red")
    translate([-108, 2, 17])
    rotate([0, 0, -15])
      cube([15, 21, 3], center = true);
  }
}

module point3() {
  translate(thumb_translate)
  intersection() {
    thumb();
    color("red")
    translate([-50, -5, 25])
      cube([10, 10, 10], center=true);
  }
}

module point4() {
  intersection() {
    case();
    color("red")
    translate([-50, -5, 25])
      cube([10, 10, 10], center=true);
  }
}
  
module case() {
  difference() {
    c();
      thumb();
  }
}

module thumb_cut() {
  difference() {
    thumb();
    translate([-100, 0, 10])
      cube([15, 20, 16], center = true);
  }
}

module final() {
  case();
  translate(thumb_translate)
    thumb_cut();
  hull() {
    point1();
    point2();
  }
  hull() {
    point3();
    point4();
  }
}

final();
//
//translate([-88, 0, 30])
//      rotate([0, 26, 0])
//        cube([70, 60, 50], center = true);
