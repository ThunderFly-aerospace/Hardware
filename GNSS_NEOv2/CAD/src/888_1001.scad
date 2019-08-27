$fn = 150;
global_clearance = 0.2;
M2_5_screw_diameter = 2.5+0.3;
M2_5_nut_diameter = 3.7;

gps_pcb_diameter = 52.97+0.5;
gps_pcb_thickness = 1.2;

gps_case_outer_diameter = 60;
gps_case_wall = 3;

led_layer_thickness = 3;
gps_led_diameter = 45.5 + 2;

screw_a_x = 41.3;
screw_a_y = 9.35;
screw_b_x = 16.96;
screw_b_y = 20.24;

space_below = 6;
space_above = 6;
wall = 1.5;

module 888_2001a(){
    difference(){
        union(){
            translate([0, 0, 2]) cylinder(d = gps_pcb_diameter+5, h = space_below + wall + gps_pcb_thickness - 2);
            cylinder(d2 = gps_pcb_diameter+5, d1 = gps_pcb_diameter+2, h = 2);
        }

        translate([0, 0, wall])
            cylinder(d = gps_pcb_diameter - 5 , h = 20);
        translate([0, 0, wall + space_below])
            cylinder(d = gps_pcb_diameter, h = 20);

        for (i=[[screw_a_x/2, screw_a_y, 0], [-screw_a_x/2, screw_a_y, 0], [screw_b_x/2, -screw_b_y, 0], [-screw_b_x/2, -screw_b_y, 0]]) {
            translate(i)
                translate([0, 0, -1])
                    cylinder(d = M2_5_nut_diameter, h = wall + space_below - 3 + 1, $fn = 6);
        }

        translate([-15/2, 20, wall*0.7])
            cube([15, 20, 6]);

    }

    for (i=[[screw_a_x/2, screw_a_y, 0], [-screw_a_x/2, screw_a_y, 0], [screw_b_x/2, -screw_b_y, 0], [-screw_b_x/2, -screw_b_y, 0]]) {
        translate(i)
            difference(){
                cylinder(d1 = 10, d2 = 5, h = wall + space_below);
                translate([0, 0, wall + space_below - 5])
                    cylinder(d = M2_5_screw_diameter, h = 100);
                translate([0, 0, -1])
                    cylinder(d = M2_5_nut_diameter, h =  wall + space_below - 3 +1, $fn = 6);
            }

    }

}


module 888_2001b(){
    difference(){
        cylinder(d = gps_pcb_diameter + 5, h = led_layer_thickness);


        difference(){
            translate([0, 0, -0.1])
                cylinder(d = gps_led_diameter, h = led_layer_thickness + 0.2);

            translate([screw_a_x/2-4, screw_a_y-4, 0]) {
                cube([10, 8, 3]);
            }
            translate([-screw_a_x/2-6, screw_a_y-4, 0]) {
                cube([10, 8, 3]);
            }

            translate([screw_b_x/2-4, -screw_b_y-8, 0]) {
                cube([8, 12, 3]);
            }
            translate([-screw_b_x/2-4, -screw_b_y-8, 0]) {
                cube([8, 12, 3]);
            }

        }

        for (i=[[screw_a_x/2, screw_a_y, 0], [-screw_a_x/2, screw_a_y, 0], [screw_b_x/2, -screw_b_y, 0], [-screw_b_x/2, -screw_b_y, 0]]) {
            translate(i)
                translate([0, 0, 0])
                    cylinder(d = M2_5_screw_diameter, h = 100);
        }
    }
}

module 888_2001c(){


    for (i=[[screw_a_x/2, screw_a_y, 0], [-screw_a_x/2, screw_a_y, 0], [screw_b_x/2, -screw_b_y, 0], [-screw_b_x/2, -screw_b_y, 0]]) {
        translate(i)
            translate([0, 0, -global_clearance/2])
                cylinder(d1 = M2_5_nut_diameter+3, d2 = M2_5_nut_diameter+5, h = wall + space_above, $fn = 60);
    }

    difference(){
        union(){
            cylinder(d = gps_pcb_diameter + 5, h = wall + space_above -2);
            translate([0, 0, wall+space_above-2])
                cylinder(d2 = gps_pcb_diameter + 2, d1 = gps_pcb_diameter + 5, h = 2);

        }
        translate([0, 0, -global_clearance/2]) cylinder(d = gps_pcb_diameter, h = space_above + global_clearance);
    }

}


translate([0, 0, -wall - space_below - gps_pcb_thickness]) 888_2001a();
//color("yellow") 888_2001b();
//translate([0, 0, led_layer_thickness]) 888_2001c();
