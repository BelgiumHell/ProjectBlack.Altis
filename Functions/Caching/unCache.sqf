/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_location"];
_location = _this select 0;

_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [2000,2000,2000,false];
_trg setTriggerActivation ["EAST","PRESENT", false];

Sleep 5;

_list = (list _trg);

Sleep 2;
{
	if(isNil {_x getVariable "JOC_caching_disabled"})then{
		_x enableSimulationGlobal true; _x hideObjectGlobal false;
	};
} forEach (_list);

Sleep 10;

deleteVehicle _trg;