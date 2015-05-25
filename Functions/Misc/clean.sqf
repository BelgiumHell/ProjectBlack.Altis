/////////////////////////
//Script made by Jochem//
/////////////////////////

_groupsT = _this select 0;
_veh = _this select 1;
_x = 0;
_y = 0;
_groupCount = (count _groupsT);
_vehCount = (count _veh);

//Groups
while{_groupCount > _x}do{
	_groupT = _groupsT select _x;
	_unitCount = (count units _groupT);
	while{_unitCount > _y}do{
		_unit = units _groupT select 0;
		deleteVehicle _unit;
		_y = _y + 1;
		Sleep 0.5;
	};
	waitUntil{count units _groupT == 0};
	Sleep 3;
	_x = _x + 1;
	_y = 0;
};


_x = 0;
_y = 0;

//Vehicles
while{_vehCount > _x}do{
	_veh = _veh select _x;
	deleteVehicle _veh;
	_x = _x + 1;
	Sleep 0.5;
};