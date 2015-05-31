/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_name = [5] call Zen_StringGenerateRandom;
artyDestroyed = 0;
_ok = 0;


//Get position
while{_ok == 0}do{
	_location = [0,0,townMarkers,1,0,0,[1,0,10],0,0,[1,5,5],[1,[10,-1,-1],120]] call Zen_FindGroundPosition;
	_nearestPlayers = [];
	{
		if (isPlayer _x && _x distance _location < 1000) then {
			_nearestPlayers pushBack _x
		};
	} forEach (playableUnits + switchableUnits);
	if(count _nearestPlayers == 0)then{_ok = 1;locationT = _location;};
};
_location = locationT;

//Create task
_task = [west,"Russian forces have set up an artillery emplacement.","Destroy artillery battery",_location,false,"",_name] call Zen_InvokeTask;

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "hd_objective";
_name setMarkerColor "ColorOPFOR";
 
//Spawn arty
_dir = round random 360;
_locationS = [_location, random 120, random 120] call BIS_fnc_relPos;
arty1 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
[arty1,east] call Zen_SpawnVehicleCrew;
 
_dir = round random 360;
_locationS = [_location, random 120, random 120] call BIS_fnc_relPos;
arty2 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
[arty2,east] call Zen_SpawnVehicleCrew;

_dir = round random 360;
_locationS = [_location, random 120, random 120] call BIS_fnc_relPos;
arty3 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
[arty3,east] call Zen_SpawnVehicleCrew;

_dir = round random 360;
_locationS = [_location, random 120, random 120] call BIS_fnc_relPos;
arty4 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
[arty4,east] call Zen_SpawnVehicleCrew;


[arty2,arty3,arty4] join (group arty1);


//Spawn enemy's
_groupCount = 7;
_carCount = 2;
_lightCount = 4;

_x = 0;

//infantry
while{_x < _groupCount} do{
	_locationS = [_location, random 300, random 300] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_group = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantry;
	[_group,_location,[0,300],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
	_x = _x + 1;
};

_x = 0;

//cars
while{_x < _carCount} do{
	_locationS = [_location, random 300, random 300] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,700]] call Zen_FindGroundPosition;
	_veh = [_locationS,(carPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew; 
	_x = _x + 1;
};

//Spawn complete trigger
_trgdead = createTrigger ["EmptyDetector",_location];
_trgdead setTriggerStatements ["!alive arty1 && !alive arty2 && !alive arty3 && !alive arty4","artyDestroyed = 1",""];

waitUntil { artyDestroyed == 1};


//Complete task
[_name, "succeeded"] call Zen_UpdateTask;


//Cleanup
Sleep 5;

taskActive = 1;

deleteMarker _marker;