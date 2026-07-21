include <../BOSL2/std.scad>

module fidget() {
  // https://www.printables.com/model/1317678-fidget-slider-with-magnets/files#preview.file.Xooca
  import("fidget-5x2.stl");
}

module negative() {
  difference() {
    hull() {
      fidget();
    }
    fidget();
  }
}

module cover() {
  difference() {
    translate([0, 0, -3])
    // https://www.printables.com/model/1317678-fidget-slider-with-magnets/files#preview.file.4BBUm
    import("inlay-2mm-magnets.stl");
    negative();
  }
}

union() {
  cover();
  // Diamonds texture added to the bottom surface
  translate([0, 0, -1.5])
  #intersection() {
    // Limit texture to the cover's XY footprint
    translate([0, 0, -50])
      linear_extrude(100)
        projection() cover();
    mirror([0, 0, 1])
      textured_tile("diamonds", [100, 100],
        tex_size=[5, 5], tex_depth=1,
        style="concave",
        anchor=TOP);
  }
}
