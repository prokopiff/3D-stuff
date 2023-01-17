use <../mcad/2Dshapes.scad>;
use <../mcad/boxes.scad>;


$fa = 1;
$fs = 0.15;

thickness = 4.6;
gap = 1;
bottom_gap = 3.5;
radius = 1.6;
back = 10;
front = 12;

//top bend
rotate_extrude(angle = 180)
translate([thickness/2+gap/2, 0, 0])
  roundedSquare([thickness, thickness], radius);

//back
translate([-(thickness/2+gap/2), -back/2+radius, 0])
roundedCube([thickness, back+radius, thickness], radius, false, true);

//front
translate([thickness/2+gap/2, -(front/2-radius), 0])
roundedCube([thickness, front+radius, thickness], radius, false, true);

//bottom bend
translate([thickness+bottom_gap/2+gap/2, -(front-radius*2), 0])
rotate_extrude(angle = -180)
translate([thickness/2+bottom_gap/2, 0, 0])
  roundedSquare([thickness, thickness], radius);

//bottom tip
translate([thickness*1.5+bottom_gap+gap/2, -(front-radius-thickness/2), 0])
roundedCube([thickness, thickness, thickness], radius, false, true);
