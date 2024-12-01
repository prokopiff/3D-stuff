use <../mcad/screw.scad>

$fa = 1;
$fs = 0.15;

hub_d = 13;
hub_h = 5.6;
w = 3.5;
base_d = 40;
base_h = 3;
count = 16;

module a() {
  h = count * hub_h;
  difference() {
    union() {
      // base
      cylinder(h = base_h, d = base_d, center = true);

      auger(60, h, hub_d-5, hub_d-10, taper_ratio = 0.5);
    }
    cylinder(h=500, d = hub_d, center=true);
  }
}

a();

rotate([0, 0, 120])
a();

rotate([0, 0, 240])
a();
