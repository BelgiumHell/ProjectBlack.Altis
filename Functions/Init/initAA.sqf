/////////////////////////
//Script made by Jochem//
/////////////////////////
radarArray = [];
_radarBlacklist = [];
_tankBlacklist = [];

//Set radars
_radar = 0;
while {_radar < (aaCount / 2)} do
{
	_location = [0,0,_radarBlacklist,1,0,0,[1,0,50],0,0,[1,5,5],[1,[0,0,0],5]] call Zen_FindGroundPosition;
	_dish = "Land_Radar_Small_F" createVehicle _location;

	_trg = createTrigger ["EmptyDetector",_location];
	_trg setTriggerArea [6000,6000,6000,false];
	_trg setTriggerActivation ["WEST","PRESENT", true];
	_trg setTriggerStatements ["sleep 5;(count list thisTrigger > 0) && (count (getPos thisTrigger nearObjects [""Land_Radar_Small_F"",50]) > 0)","[getPos thisTrigger, thislist] spawn JOC_radar;",""];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "ELLIPSE";
   	_nameM setMarkerSize [5000,5000];
    	_nameM setMarkerBrush "Border";
    	_nameM setMarkerColor "ColorOPFOR";
    	//_nameM setMarkerAlpha 0;

	[_radarBlacklist,count _radarBlacklist,_nameM] call Zen_ArrayInsert;
	_radar = _radar + 1;
};

//Place AA-tanks
_tank = 0;
while {_tank < aaCount} do
{
	_location = [0,0,_tankBlacklist,1,0,0,[1,0,10],0,0,[1,5,5],[1,[0,0,0],10]] call Zen_FindGroundPosition;
	_aaTank = "O_APC_Tracked_02_AA_F" createVehicle _location;
	[_aaTank,east] call Zen_SpawnVehicleCrew;

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [3000,3000];
    	_nameM setMarkerBrush "Border";
    	_nameM setMarkerColor "ColorOPFOR";
    	//_nameM setMarkerAlpha 0;
	[_tankBlacklist,count _tankBlacklist,_nameM] call Zen_ArrayInsert;

	_tank = _tank + 1;
};