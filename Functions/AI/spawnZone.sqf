/////////////////////////
//Script made by Jochem//
/////////////////////////

//[amount(SCALAR),patrol(BOOLEAN)] heli:[amount(SCALAR),patrol(BOOLEAN),type(STRING)]
private["_location","_radius","_inf","_car","_apc","_ifv","_tank","_heli","_boat"];
_location = _this select 0;
_radius = _this select 1;
_inf = _this select 2;
_car = _this select 3;
_apc = _this select 4;
_ifv = _this select 5;
_tank = _this select 6;
_heli = _this select 7;
_boat = _this select 8;
//if(_radius < 1)exitWith{};

//Spawn infantry
_j = 0;
if((_inf select 0) > 0)then{
	while{_j < (_inf select 0)} do{
		_locationS = [_location,[0,_radius],0,1] call Zen_FindGroundPosition;
		_locationS = [_locationS,1,1] call Zen_ExtendPosition;
		_groupV = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantry;
		if(_inf select 1)then{
			[_groupV,_location,[0,_radius],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
		};
		_groupG = [_locationS, east, "infantry", 2,"Basic"] call Zen_SpawnInfantryGarrison;
		_j = _j + 1;
	};
};

//Spawn cars
_j = 0;
if((_car select 0) > 0)then{
	while{_j < (_car select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(carPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
		[_veh,east] call Zen_SpawnVehicleCrew;
		if(_car select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
		};
		_j = _j + 1;
	};
};

//Spawn apc's
_j = 0;
if((_apc select 0) > 0)then{
	while{_j < (_apc select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    		[_veh,east] call Zen_SpawnVehicleCrew;
		if(_apc select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
		};
		_j = _j + 1;
	};
};

//Spawn ifv's
_j = 0;
if((_ifv select 0) > 0)then{
	while{_j < (_ifv select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(ifvPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    		[_veh,east] call Zen_SpawnVehicleCrew;
		if(_ifv select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
		};
		_j = _j + 1;
	};
};

//Spawn tanks
_j = 0;
if((_tank select 0) > 0)then{
	while{_j < (_tank select 0)} do{
		_locationS = [_location,[0,_radius],0,1,[1,_radius]] call Zen_FindGroundPosition;
		_veh = [_locationS,(tankPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    		[_veh,east] call Zen_SpawnVehicleCrew;
		if(_tank select 1)then{
			[_veh, _location, _radius,[0,360],"limited",true] spawn Zen_OrderVehiclePatrol;
		};
		_j = _j + 1;
	};
};

//Spawn heli's
/*_j = 0;
_pool = [];
if((_heli select 0) > 0)then{
	while{_j < (_heli select 0)} do{
		_locationS = [_location,[0,_radius],0,0,[1,_radius]] call Zen_FindGroundPosition;
		if((_heli select 2) == "transport")then{
			_pool = heliPool;
		};
		if((_heli select 2) == "cas")then{
			_pool = casPool
		};
		_heli = [_locationS,(_pool call BIS_fnc_selectRandom),50] call Zen_SpawnHelicopter;
		_j = _j + 1;
	};
};*/

boatT = (_boat select 1);

//Spawn boats
_j = 0;
if((_boat select 0) > 0)then{
	while{_j < 6} do{
		_locationS = [_location,[0,_radius],0,2,[1,_radius]] call Zen_FindGroundPosition;
		_boat = [_locationS,["O_Boat_Armed_01_hmg_F"]] call Zen_SpawnBoat;
		if(true)then{
			[_boat, _location, _radius] spawn Zen_OrderBoatPatrol;
		};
		_j = _j + 1;
	};
};