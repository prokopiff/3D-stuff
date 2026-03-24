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

difference() {
  translate([0, 0, -3])
  // https://www.printables.com/model/1317678-fidget-slider-with-magnets/files#preview.file.4BBUm
  import("inlay-2mm-magnets.stl");
  negative();
}
