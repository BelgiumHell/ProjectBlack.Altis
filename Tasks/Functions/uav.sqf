uav_ID = [uav, "Hack uav", 5, {true}, {
	[{uavStart = 1;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP; []execVM "Tasks\Functions\waves.sqf";
}, true] call AGM_Interaction_fnc_addInteraction;