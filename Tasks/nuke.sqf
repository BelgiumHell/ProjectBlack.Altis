/////////////////////////
//Script made by Jochem//
/////////////////////////
//var
disabled = 0;
launched = 0;
destroyed = 0;
_name = [5] call Zen_StringGenerateRandom;


//location
_location = [0,0,townMarkers,1,0,0,[1,0,10],0,0,[1,5,5],[1,[10,-1,-1],120]] call Zen_FindGroundPosition;

//Town location
towns = nearestLocations [getPosATL player, ["NameCity","NameCityCapital","NameVillage"], 25000];
closeTowns = nearestLocations [_location, ["NameCity","NameCityCapital","NameVillage"], 5000];



while{_ok == 0}do{
	targetTown = towns select (floor (random (count towns)));
	townName = text targetTown;
	if (!(townName in occupiedTowns) and !(townName in closeTowns))then{_ok = 1;};
	Sleep 1;
};

_locationTown = position (targetTown); 


//Create task
_text = format["Russian forces are preparing a nuclear attack on %1. ROE on the vehicle is hold fire, since it is likely the nuke will go off if it gets blown up",townName];
_task = [west,_text,"Prevent launch",_location,true,"",_name] call Zen_InvokeTask;

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "hd_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn icbm
icbm = [_location, "rhs_9k79_B"] call Zen_SpawnVehicle;
[icbm,east] call Zen_SpawnVehicleCrew;
[icbm,1] spawn rhs_fnc_ss21_AI_prepare;
(group icbm) setVariable ["zbe_cacheDisabled",true];



//Spawn enemy's
_groupCount = 7;
_garrisonCount = 10;
_carCount = 5;
_lightCount = 2;
_tankCount = 3;
_helicopterCount = 3;

_x = 0;

//infantry
while{_x < _groupCount} do{
	_locationS = [_location, random 200, random 200] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_group = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantry;
	[_group,_location,[0,300],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
	_x = _x + 1;
};

_x = 0;
_locationS = _location;

//garrisoned infantry
while{_x < _garrisonCount} do{
	_group = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantryGarrison;
	_locationS = [_location, random 100, random 100] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_x = _x + 1;
};

_x = 0;

//IFV
while{_x < _lightCount} do{
	_locationS = [_location, random 300, random 300] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,700]] call Zen_FindGroundPosition;
	_veh = [_locationS,(enemyPoolIfv call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew; 
	_x = _x + 1;
};

_x = 0;

//tanks
while{_x < _tankCount} do{
	_locationS = [_location, random 300, random 300] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_locationS = [_locationS,0,0,1,[1,700]] call Zen_FindGroundPosition;
	_veh = [_locationS,(enemyPoolTank call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew; 
	_x = _x + 1;
};

_x = 0;

//Helicopters
while{_x < _helicopterCount} do{
	_locationS = [_location, random 500, random 500] call BIS_fnc_relPos;
	_heliA = [_locationS,enemyPoolAttackheli,50] call Zen_SpawnHelicopter;
	_x = _x + 1;
	
};



//Spawn fail trigger
_trg = createTrigger ["EmptyDetector",_location];
_trg setTriggerStatements ["!alive icbm","destroyed = 1",""];


//Spawn complete trigger
_trg = createTrigger ["EmptyDetector",_location];
_trg setTriggerStatements ["!alive (crew icbm select 0) && !alive (crew icbm select 1)","disabled = 1",""];


[600]execVM "Tasks\functions\countdown.sqf";

//Wait until complete
waitUntil{disabled == 1 or launched == 1 or destroyed == 1};

if (disabled == 1) then{
	[_name, "succeeded"] call Zen_UpdateTask;
};

if (launched == 1) then{
	[_name, "failed"] call Zen_UpdateTask;
	[_locationTown,10000,1000] call rhs_fnc_ss21_nuke
};

if (destroyed == 1) then{
	[_name, "failed"] call Zen_UpdateTask;
	[_location,10000,1000] call rhs_fnc_ss21_nuke
};

sleep 15;

deleteMarker _marker;
taskActive = 0;
