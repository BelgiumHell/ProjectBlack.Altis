/////////////////////////
//Script made by Jochem//
/////////////////////////
hint "leuk";
_name = [5] call Zen_StringGenerateRandom;

//[location,size,infantryCount,carCount,lightCount,heavyCount,helicopterCount]
_location = _this select 0;
_size = _this select 1;
_infantryCount = _this select 2;
_carCount = _this select 3;
_lightCount = _this select 4;
_heavyCount = _this select 5;
_heliCount = _this select 6;


//Create zone
_groups = [];
_vehicles = [];
//infantry
_x = 0;

while{_x < _infantryCount} do{
	_locationS = [_location, random _size, random _size] call BIS_fnc_relPos;
	_locationS = [_locationS,1,1] call Zen_ExtendPosition;
	_group = [_locationS, east, "infantry", 5,"Basic"] call Zen_SpawnInfantry;
	[_group,_location,[0,_size],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
	[_groups, count _groups, _group] call Zen_ArrayInsert;
	_x = _x + 1;
};

_x = 0;

//cars
while{_x < _carCount} do{
	_locationS = [_location, random _size, random _size] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,400]] call Zen_FindGroundPosition;
	_veh = [_locationS,(carPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew;
	[_groups, count _groups, group(crew _veh select 0)] call Zen_ArrayInsert;
	[_vehicles, count _vehicles, _veh] call Zen_ArrayInsert;
	_x = _x + 1;
};

_x = 0;

//APC
while{_x < _lightCount} do{
	_locationS = [_location, random _size, random _size] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,400]] call Zen_FindGroundPosition;
	_veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew;
	[_groups, count _groups, group(crew _veh select 0)] call Zen_ArrayInsert;
	[_vehicles, count _vehicles, _veh] call Zen_ArrayInsert;
	_x = _x + 1;
};

_x = 0;

//IFV
while{_x < _lightCount} do{
	_locationS = [_location, random _size, random _size] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,400]] call Zen_FindGroundPosition;
	_veh = [_locationS,(ifvPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew;
	[_groups, count _groups, group(crew _veh select 0)] call Zen_ArrayInsert;
	[_vehicles, count _vehicles, _veh] call Zen_ArrayInsert;
	_x = _x + 1;
};

_x = 0;

//tanks
while{_x < _heavyCount} do{
	_locationS = [_location, random _size, random _size] call BIS_fnc_relPos;
	_locationS = [_locationS,0,0,1,[1,400]] call Zen_FindGroundPosition;
	_veh = [_locationS,(tankPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
	[_veh,east] call Zen_SpawnVehicleCrew;
	[_groups, count _groups, group(crew _veh select 0)] call Zen_ArrayInsert;
	[_vehicles, count _vehicles, _veh] call Zen_ArrayInsert;
	_x = _x + 1;
};

_trgD = createTrigger ["EmptyDetector",_location];
_trgD setTriggerArea [(_size * 1.5),(_size * 1.5),(_size * 1.5),false];
_trgD setTriggerActivation ["WEST","PRESENT", false];
_trgD setTriggerStatements ["this","",""];

_trgC = createTrigger ["EmptyDetector",_location];
_trgC setTriggerArea [_size,_size,_size,false];
_trgC setTriggerActivation ["EAST","PRESENT", false];
_trgC setTriggerStatements ["this","",""];

waitUntil{(count list _trgD < 1) or (count list _trgC < 1)};

if((count list _trgD) < 1)then{
	[_groups,_vehicles] execVM "Functions\Misc\clean.sqf";
	
	//Respawn activation trigger
	if(_infantryCount == 8)then{
		_trg = createTrigger ["EmptyDetector",_location,true];
		_trg setTriggerArea [900,900,900,false];
		_trg setTriggerActivation ["WEST","PRESENT", false];
		_trg setTriggerStatements ["this","[getPos thisTrigger,400,8,2,2,0,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	};
	
	if(_infantryCount == 4)then{
		_trg = createTrigger ["EmptyDetector",_location,true];
		_trg setTriggerArea [700,700,700,false];
		_trg setTriggerActivation ["WEST","PRESENT", false];
		_trg setTriggerStatements ["this","[getPos thisTrigger,200,4,2,0,0,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	};
	
	if(_infantryCount == 12)then{
		_trg = createTrigger ["EmptyDetector",_location,true];
		_trg setTriggerArea [1200,1200,1200,false];
		_trg setTriggerActivation ["WEST","PRESENT", false];
		_trg setTriggerStatements ["this","[getPos thisTrigger,700,12,4,2,2,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	};
};
if((count list _trgC) < 2)then{
	hint "occupied";
	_town = nearestLocations [_location, ["NameCityCapital","NameCity","NameVillage"], 100];
	_nameM = text (_town select 0)
	deleteMarker _nameM;
};
