//Set variables
_target = _this select 0;
jetActive = true;
landed = 0;
_airfield = getMarkerPos "mrk_jetSpawn";

//Spawn jet
_pilot = [_airfield,(jetPool call BIS_fnc_selectRandom),0] Call Zen_SpawnAircraft;

//Set group 
enemyCasGroup = group _pilot;
//enemyCasGroup setCombatMode "RED";
//enemyCasGroup setBehaviour "COMBAT";
//enemyCasGroup setSpeedMode "FULL";

_jet = vehicle _pilot;

//Trigger for enemy presence
_trgD = createTrigger ["EmptyDetector",_location];
_trgD setTriggerArea [900,900,900,false];
_trgD setTriggerActivation ["WEST","PRESENT", false];
_trgD setTriggerStatements ["this","",""];

while{true}do{
	[enemyCasGroup,_target] call BIS_fnc_taskAttack;
	
	waitUntil{fuel _jet < 0.2 or list _trgD < 1};

	_jet landAt 0;
	_jet addEventHandler ["LandedStopped", {landed = 1}];

	waitUntil{landed == 1};

	if (list _trgD < 1) exitWith {deleteVehicle _jet};
}