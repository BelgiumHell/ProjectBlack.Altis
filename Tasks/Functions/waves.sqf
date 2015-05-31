hint "exec";


hint "enemies";
_name = "test";
_location = position uav;
	
hint "loc";

//Spawn enemies
_groupCount = 9;
_lightCount = 3;
	
	
hint "pos";
//Get spawn location
_locationSpawn = [_location,[900,1000],["mrk_safeZone"]] call Zen_FindGroundPosition;

hint "pos2";
	
//Create test markers
_marker = createMarker [_name, _locationSpawn];
_name setMarkerShape "ELLIPSE";
_name setMarkerSize [20,20];
_name setMarkerBrush "Solid";
_name setMarkerColor "ColorOPFOR";
	
hint "mark";
	
_x = 0;

//infantry
while{_x < _groupCount} do{
	_locationS = [_locationSpawn, random 10, random 10] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_group = [_locationS, east, "infantry", 5,"Basic"] call Zen_SpawnInfantry;
	[_group,_location,[0,300],[0,360],"full"] spawn Zen_OrderInfantryPatrol;
	_x = _x + 1;
};

_x = 0;

//IFV
while{_x < _lightCount} do{
	_locationS = [_locationSpawn, random 50, random 50] call BIS_fnc_relPos;
	_veh = [_locationS,(enemyPoolApc call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew;
	_locationS = [_locationS,10,10] call Zen_ExtendPosition;
	_group = [_locationS, east, "infantry", 16,"Basic"] call Zen_SpawnInfantry;
	[_group,_veh] call Zen_MoveInVehicle;		
	[_veh, _location,300,[0,360],"limited"] spawn Zen_OrderVehiclePatrol;
	_x = _x + 1;
};
	
Sleep 450;