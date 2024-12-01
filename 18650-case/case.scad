use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

x = 60.2;
y = 78.2+5.5;
z = 26;

w = 2.5;
r = 2.5;

mag_d = 3.3;
mag_h = 2;

module case() {
  difference() {
    roundedCube([x+w+r, y+w+r, z+w+r], r = r);
    translate([w, w, w])
    cube([x, y+10, z]);
    
    translate([(mag_d+x+w+r)/3, -mag_d/2+y+w+r-1.5, w-mag_h])
    cylinder(h = mag_h, d = mag_d);
    
    translate([(mag_d+x+w+r)/3*2, -mag_d/2+y+w+r-1.5, w-mag_h])
    cylinder(h = mag_h, d = mag_d);

    translate([(mag_d+x+w+r)/3, -mag_d/2+y+w+r-1.5, w-mag_h+z+mag_h])
    cylinder(h = mag_h, d = mag_d);
    
    translate([(mag_d+x+w+r)/3*2, -mag_d/2+y+w+r-1.5, w-mag_h+z+mag_h])
    cylinder(h = mag_h, d = mag_d);

    translate([w-mag_h, -mag_d/2+y+w+r-1.5, z/2+w])
    rotate([0, 90, 0])
    cylinder(h = mag_h, d = mag_d);
    
    translate([x+w, -mag_d/2+y+w+r-1.5, z/2+w])
    rotate([0, 90, 0])
    cylinder(h = mag_h, d = mag_d);
  }
}

module lid() {
  difference() {
    translate([w+0.15, y-0.15, w+0.15])
    #cube([x-0.3, 4, z-0.3]);

    translate([(mag_d+x+w+r)/3, -mag_d/2+y+w+r-1.5, w])
    cylinder(h = mag_h, d = mag_d);

    translate([(mag_d+x+w+r)/3*2, -mag_d/2+y+w+r-1.5, w])
    cylinder(h = mag_h, d = mag_d);

    translate([(mag_d+x+w+r)/3, -mag_d/2+y+w+r-1.5, w-mag_h+z])
    cylinder(h = mag_h, d = mag_d);

    translate([(mag_d+x+w+r)/3*2, -mag_d/2+y+w+r-1.5, w-mag_h+z])
    cylinder(h = mag_h, d = mag_d);

    translate([w, -mag_d/2+y+w+r-1.5, z/2+w])
    rotate([0, 90, 0])
    cylinder(h = mag_h, d = mag_d);

    translate([x+w-mag_h, -mag_d/2+y+w+r-1.5, z/2+w])
    rotate([0, 90, 0])
    cylinder(h = mag_h, d = mag_d);
  }
}

lid();