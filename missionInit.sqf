/////////////////////////
//Script made by Jochem//
/////////////////////////

//Parameters *FREE TO EDIT*
townCount   = 30;    //Number of towns to occupy
baseCount   = 10;    //Number of military structures to occupy
aaCount     = 10;    //Number of AA Emplacements (AA-tank only)
roadCount   = 20;    //Number of roadblocks
patrolCount = 20;    //Number of patrolling vehicles
depotCount  = 5;     //Number of depots
mineCount   = 30;    //Number of minefields

infantryPool = ["TEC_O_Soldier_AR_F","TEC_O_Medic_F","TEC_O_Soldier_GL_F","TEC_O_Soldier_HG_F","TEC_O_Soldier_M_F","TEC_O_Soldier_AT_F","TEC_O_Soldier_F","TEC_O_Soldier_LAT_F","TEC_O_Soldier_SS_F","TEC_O_Soldier_SL_F"];    //infantry classnames
sfPool       = ["TEC_O_SOF_TL_F","TEC_O_SOF_SS_F","TEC_O_SOF_SMG_F","TEC_O_SOF_F","TEC_O_SOF_M_F","TEC_O_SOF_Medic_F"];
carPool      = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","TEC_VH_MRAP_Abda_HMG","TEC_VH_MRAP_Abda_GMG"];        //car classnames
truckPool    = ["TEC_VH_Truck_Tempest_Covered","TEC_VH_Truck_Tempest"];        //truck classnames
apcPool      = ["O_APC_Wheeled_02_rcws_F"];       //apc classnames
ifvPool      = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F"];       //ifv classnames
tankPool     = ["O_MBT_02_cannon_F"];       //tank classnames
supportPool  = [];     //support classnames
airPool      = ["TEC_VH_Helicopter_Orca_F","TEC_VH_Helicopter_Orca_Armed_F","TEC_VH_Helicopter_Taru_F"];     //transport helicopter classnames
casPool      = ["TEC_VH_Helicopter_Keftar_F","TEC_VH_Helicopter_Kajman_F"];      //cas helicopters classnames
jetPool      = ["O_Plane_CAS_02_F"];       //jet classnames

blackTowns      = ["Sagonisi","Ekali"];  //Blacklist towns
airfieldMarkers = ["mrk_airfield_0","mrk_airfield_1","mrk_airfield_2","mrk_airfield_3","mrk_airfield_4"];   //Markers for airfields

leaderArray = [cmd1,cmd2,a1,b1,c1,h1,r1,anv1,s1,v1,rip1];
towableObjects = ["JS_JC_FA18E","JS_JC_FA18F"];
jetArray = ["JS_JC_FA18E","JS_JC_FA18F"];
radarTArray = ["JS_JC_FA18E","JS_JC_FA18F","","",""];
publicVariable "towableObjects";//Needs to be public since script runs locally

//Init variables *DONT CHANGE*
opTowns = [];
opTownsN = [];
bluTowns = [];
bluTownsN = [];
indTowns = [];
indTownsN = [];
opTownMarkers = [];
activeTasks = [];
airfieldOccup = [false,false,false,false,false,false];
capitalOccup = [false,false,false];
jetActive = false;
jetTargets = [];
groups = [];

//Cleanup arrays
groundArray = [];
publicVariable "groundArray";

//Run init scripts
[] spawn JOC_initAA;
//[] spawn JOC_initAirfields;
//[] spawn JOC_initBases;
//[] spawn JOC_initMines;
[] spawn JOC_initTowns;

[] spawn JOC_cacheInit;

[] spawn JOC_fobManager;