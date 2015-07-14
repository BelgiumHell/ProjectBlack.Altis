/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_location","_task"];
_location = _this select 0;

_trg = createTrigger ["EmptyDetector",_location];
_trg setTriggerArea [6000,6000,6000,false];
_trg setTriggerActivation ["WEST","PRESENT", true];
_trg setTriggerStatements ["(count list thisTrigger > 0) && (count (getPos thisTrigger nearObjects [""Land_Radar_Small_F"",50]) > 0)","",""];

while{(count (_location nearObjects ["Land_Radar_Small_F",50]) >= 1)}do{
	hint "radarCheck";
	_list = list _trg;

	_exit = true;
	_targets = [];

	{
		if(((typeOf _x) in radarTArray) && (((_x distance _location) * 0.05) <= (getPosASL _x select 2)))then{_task = true; [_targets,count _targets,_x] call Zen_ArrayInsert;};
	} forEach _list;

	targetsT = _targets;

	if(_task)then{
		[_targets] spawn JOC_taskJet;
	};
	
	sleep 7;
};