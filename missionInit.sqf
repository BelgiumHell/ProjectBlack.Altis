/////////////////////////
//Script made by Jochem//
/////////////////////////

//Parameters *FREE TO EDIT*
townCount = 14;		//Number of towns to occupy 
baseCount = 10;		//Number of military structures to occupy
aaCount = 8;		//Number of AA Emplacements (Radar AND AA-tank)
depotCount = 5;		//Number of depots
mineCount = 3;		//Number of minefields

infantryPool = ["hs_msv_emr_aa","rhs_msv_emr_grenadier","rhs_msv_emr_at","rhs_msv_emr_junior_sergeant","rhs_msv_emr_machinegunner","rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_medic","rhs_msv_emr_officer_armored","rhs_msv_emr_rifleman","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_sergeant"];	//infantry classnames
sfPool = [];
carPool = ["RHS_UAZ_MSV_01","rhs_tigr_ffv_3camo_msv","rhs_tigr_3camo_msv"];		//car classnames
truckPool = ["rhs_gaz66_msv","RHS_Ural_MSV_01"];		//truck classnames
apcPool = ["rhs_btr80_msv","rhs_btr80a_msv"];		//apc classnames
ifvPool = ["rhs_brm1k_tv","rhs_bmp2k_tv","rhs_bmp2_tv","rhs_bmp1k_tv","rhs_prp3_tv"];		//ifv classnames
tankPool = ["rhs_t80um"];		//tank classnames
supportPool = [];	//support classnames
airPool = [];		//transport helicopter classnames
casPool = [];		//cas helicopters classnames
jetPool = [];		//jet classnames

//Init variables *DONT CHANGE*
occupiedTowns = [];
activeTasks = [];
airfieldOccup = false;
capitalOccup = false;

_x = 0;
//Occupy towns
while{_x < townCount}do{
	[]execVM "Functions\Core\town.sqf";
	_x = _x + 1;
	Sleep 7;
};

_x = 0;
//Occupy military bases
while{_x < baseCount}do{
	[]execVM "Functions\Core\base.sqf";
	_x = _x + 1;
};

_x = 0;
//Spawn AA-emplacements
while{_x < aaCount}do{
	[]execVM "Functions\Core\aa.sqf";
	_x = _x + 1;
};

_x = 0;
//Spawn depots
while{_x < depotCount}do{
	[]execVM "Functions\Core\depot.sqf";
	_x = _x + 1;
};

_x = 0;
//Spawn minefields
while{_x < mineCount}do{
	[]execVM "Functions\Core\mine.sqf";
	_x = _x + 1;
};

//Start taskmanager