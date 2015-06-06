//Set variables
_target = _this select 0;
_startLoc = getMarkerPos "mrk_vehSpawn";
_infSpawn = getMarkerPos "mrk_infSpawn";


//Spawn Infantry
_groupTruck1 = [_infSpawn, east, "infantry", 12,"Basic"] call Zen_SpawnInfantry;
_groupTruck2 = [_infSpawn, east, "infantry", 12,"Basic"] call Zen_SpawnInfantry;
_groupApc = [_infSpawn, east, "infantry", 16,"Basic"] call Zen_SpawnInfantry;


//Spawn veh
_truck1 = [_startLoc,(truckPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
[_truck1,east] call Zen_SpawnVehicleCrew; 

_startLoc = [_startLoc,20,20] call Zen_ExtendPosition;

_truck2 = [_startLoc,(truckPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
[_truck2,east] call Zen_SpawnVehicleCrew; 

_startLoc = [_startLoc,20,20] call Zen_ExtendPosition;

_apc = [_startLoc,(apcPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
[_apc,east] call Zen_SpawnVehicleCrew; 

_startLoc = [_startLoc,20,20] call Zen_ExtendPosition;

_ifv = [_startLoc,(ifvPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
[_ifv,east] call Zen_SpawnVehicleCrew; 


//Move in veh
[_groupTruck1,_truck1] call Zen_MoveInVehicle;
[_groupTruck2,_truck2] call Zen_MoveInVehicle;
[_groupApc,_apc] call Zen_MoveInVehicle;

//Order insertion
[_ifv,_target,300] spawn Zen_OrderVehiclePatrol;

Sleep 2;

[_truck1,_target,_groupTruck1,"normal"] spawn Zen_OrderInsertion;

Sleep 2;

[_truck2,_target,_groupTruck2,"normal"] spawn Zen_OrderInsertion;

Sleep 2;

[_apc,_target,_groupApc,"normal"] spawn Zen_OrderInsertion;