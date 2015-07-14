/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_location","_list"];
_location = _this select 0;
_list = _this select 1;

hint "radar";
listT = _list;

_exit = true;
_targets = [];

{
	if((typeOf _x) in radarTArray)then{hint "lol";_exit = false; [_targets,count _targets,_x] call Zen_ArrayInsert;};
} forEach _list;

targetsT = _targets;

if(_exit)exitWith{};

[_targets] spawn JOC_taskJet;