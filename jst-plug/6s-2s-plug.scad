$fa = 1;
$fs = 0.15;

difference() {
  union() {
    //https://www.thingiverse.com/thing:1393615
    import("Connector_JST_XH_4S.stl");

    h = 7.2;
    color("blue")
    translate([0, -0.2, h/2])
    cube([13, 3, h], center=true);
  }
  //holes
  for (i = [0:1:4]) {
    color("red")
    translate([-5.01+i*2.5, 0.42, 4])
    cube([1.2, 1.2, 10], center = true);
  }
  
  h = 8;
  color("red")
  translate([-6.4, 0, h/2])
  cube([6, 6, h], center = true);

  color("blue")
  translate([-3.2, 0, 0.5])
  cube([0.5, 6, 1], center = true);
}
