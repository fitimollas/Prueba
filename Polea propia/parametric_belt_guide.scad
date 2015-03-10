// variables ( mm )
	hole_diameter_shaft = 6.1; //antes 5
	pulley_diameter = 16; 
	bearing_diameter = 10 ; 
	bearing_thickness= 4; 
	beltwidth = 6.75; // pulley width
	$fn = 90; // faceting
	bearing_clearance = bearing_diameter * 0.06; // 5% clearance
	cap_clearance = bearing_diameter*0.02; // 5% clearance

// these are the lips that hold the belt on
	cap_diameter = 22; //diameter lip
	lipthickness = 1 ; // thickness lip

// construction
	difference ( ) {
	union () {
		cylinder(r=cap_diameter/2, h=lipthickness); // bottom cover
		cylinder(r=pulley_diameter/2, h=beltwidth+lipthickness); // body pulley
		}
	cylinder(r=hole_diameter_shaft/2, h=2+beltwidth+lipthickness); // remove small hole
	translate([0,0,lipthickness+(beltwidth-bearing_thickness)/2])cylinder(r=(bearing_diameter+bearing_clearance)/2, h=lipthickness+beltwidth); // BEARING HOUSING
}
	difference(){
	union(){
		translate([0,2*pulley_diameter,0])cylinder(r=cap_diameter/2, h=lipthickness); // top cap
		translate([0,2*pulley_diameter,0])cylinder(r=(bearing_diameter-bearing_clearance)/2, h=lipthickness+(beltwidth-bearing_thickness)/2); // lug
}
	translate([0,2*pulley_diameter,0])cylinder(r=hole_diameter_shaft/2, h=beltwidth+2*lipthickness);
}

