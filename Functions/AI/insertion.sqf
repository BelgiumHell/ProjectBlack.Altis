//Set variables
_target = _this select 0;
_startLoc = getMarkerPos "mrk_vehSpawn";
_infSpawn = getMarkerPos "mrk_infSpawn";

//Spawn Chopper
_heli1 = [_startLoc,airPool,50] call Zen_SpawnHelicopter;
_group1 = [_infSpawn, east, "infantry", 14,"Basic"] call Zen_SpawnInfantry;
[_group1,_heli1] call Zen_MoveInVehicle;

_startLoc = [_startLoc,50,50] call Zen_ExtendPosition;

_heli2 = [_startLoc,airPool,50] call Zen_SpawnHelicopter;
_group2 = [_infSpawn, east, "infantry", 14,"Basic"] call Zen_SpawnInfantry;
[_group2,_heli2] call Zen_MoveInVehicle;

_startLoc = [_startLoc,50,50] call Zen_ExtendPosition;

_heliA = [_startLoc,casPool,50] call Zen_SpawnHelicopter;

//Order insertion
[(group _heliA),_target] call BIS_fnc_taskAttack;

Sleep 5;

_target = [_target, 100, 100] call BIS_fnc_relPos;
[_heli2,_target,_group2,"full",15,"fastrope"] spawn Zen_OrderInsertion;

Sleep 5;

_target = [_target, 200, 200] call BIS_fnc_relPos;
[_heli1,_target,_group1,"full",15,"fastrope"] spawn Zen_OrderInsertion;