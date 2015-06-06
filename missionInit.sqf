/////////////////////////
//Script made by Jochem//
/////////////////////////

//Parameters *FREE TO EDIT*
townCount = 30;		//Number of towns to occupy 
baseCount = 10;		//Number of military structures to occupy
aaCount = 8;		//Number of AA Emplacements (Radar AND AA-tank)
depotCount = 5;		//Number of depots
mineCount = 30;		//Number of minefields

infantryPool = ["rhs_msv_emr_grenadier","rhs_msv_emr_at","rhs_msv_emr_junior_sergeant","rhs_msv_emr_machinegunner","rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_medic","rhs_msv_emr_officer_armored","rhs_msv_emr_rifleman","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_sergeant"];	//infantry classnames
sfPool = ["O_recon_TL_F","O_recon_M_F","O_recon_medic_F","O_recon_LAT_F","O_recon_F"];
carPool = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"];		//car classnames
truckPool = ["rhs_gaz66_msv","RHS_Ural_MSV_01"];		//truck classnames
apcPool = ["rhs_btr80_msv","rhs_btr80a_msv"];		//apc classnames
ifvPool = ["rhs_brm1k_tv","rhs_bmp2k_tv","rhs_bmp2_tv","rhs_bmp1k_tv","rhs_prp3_tv"];		//ifv classnames
tankPool = ["rhs_t80um"];		//tank classnames
supportPool = [];	//support classnames
airPool = ["RHS_Mi8MTV3_vvsc"];		//transport helicopter classnames
casPool = ["RHS_Ka52_UPK23_vvsc","RHS_Mi24P_AT_vvsc"];		//cas helicopters classnames
jetPool = ["RHS_Su25SM_vvs"];		//jet classnames

//Init variables *DONT CHANGE*
occupiedTowns = [];
activeTasks = [];
townMarkers = ["mrk_safeZone","mrk_airfield"];
airfieldOccup = false;
capitalOccup = false;

"mrk_airfield" setMarkerAlpha 0;

//Start taskmanager
[]execVM "Tasks\taskManager.sqf";

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
[]execVM "Functions\Core\aa.sqf";


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