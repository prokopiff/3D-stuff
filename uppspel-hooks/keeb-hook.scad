use <../mcad/2Dshapes.scad>;
use <../mcad/boxes.scad>;

$fa = 1;
$fs = 0.15;

//update this for keyboards
keeb_width = 110;

catch_len = 8;

thickness = 4.6;
gap = 1;
radius = 1.6;
back = 8.5;

front = sqrt(keeb_width*keeb_width/2);
bottom = front;
between_holes = 25;
hole_height = 15;

//top bend
rotate_extrude(angle = 180)
translate([thickness/2+gap/2, 0, 0])
  roundedSquare([thickness, thickness], radius);

//back
translate([-(thickness/2+gap/2), -back/2+radius, 0])
roundedCube([thickness, back+radius, thickness], radius, false, true);

translate([0, -(between_holes + hole_height), 0]) {
  //mid bend
  rotate_extrude(angle = 180)
  translate([thickness/2+gap/2, 0, 0])
    roundedSquare([thickness, thickness], radius);

  //mid back
  translate([-(thickness/2+gap/2), -back/2+radius, 0])
  roundedCube([thickness, back+radius, thickness], radius, false, true);
}

//front
translate([thickness/2+gap/2, -(front/2-radius), 0])
roundedCube([thickness, front+radius, thickness], radius, false, true);

//bottom
translate([bottom/2+radius, -(front-thickness+radius), 0])
roundedCube([bottom, thickness, thickness], radius, false, true);

//base
translate([bottom/2+radius, -front/2, 0])
rotate([0, 0, -45])
  roundedCube([keeb_width-thickness, thickness, thickness], radius, false, true);

//catch
translate([bottom+radius, -(front-thickness), 0])
rotate([0, 0, 45])
  roundedCube([catch_len, thickness, thickness], radius, false, true);
