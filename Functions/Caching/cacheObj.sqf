////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_obj"];
_obj = _this select 0;

{
	if(isNil {_x getVariable "JOC_caching_disabled"})then{
		_x enableSimulationGlobal false; _x hideObjectGlobal true;
	};
} forEach (_obj);