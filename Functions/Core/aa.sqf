/////////////////////////
//Script made by Jochem//
/////////////////////////

AA = 0;
markerClear = 0;
AABlacklist = ["mrk_safeZone"];

while{true}do{
	//Set up var
	_dir = round random 360;
	_name = [5] call Zen_StringGenerateRandom;

	//Get position
	_location = [0,0,AABlacklist,1,0,0,0,0,0,[1,10,-1],0,[2,150,0]] call Zen_FindGroundPosition;
	
	
	_marker = createMarker [_name, _location];
	_name setMarkerShape "RECTANGLE";
	_name setMarkerSize [1500,1500];
	_name setMarkerBrush "Border";
	_name setMarkerColor "ColorOPFOR";
	_name setMarkerAlpha 0;
	
	[AABlacklist,count AABlacklist,_name] call Zen_ArrayInsert;

	//Spawn AA emplacement
	//AA tank
	_locationZ = [_location,-7,-7] call Zen_ExtendPosition;
	_ZSU = [_locationZ,"O_APC_Tracked_02_AA_F",0,(_dir + 180)] call Zen_SpawnVehicle;
	[_ZSU,east] call Zen_SpawnVehicleCrew;
	_ZSU setFuel 0;
	_ZSU setSkill 1;
	
	_ZSU addEventHandler["killed", {
		["Functions\AI\AACount.sqf","BIS_fnc_execVM",true,true ] call BIS_fnc_MP;
	}];
	_ZSU addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];

	_ZSU setCombatMode "RED";
	_ZSU setBehaviour "COMBAT";
	
	
	AA = AA + 1;
	markerClear = markerClear + 1;
	if(AA == aaCount)then{
		waitUntil{AA < aaCount};
		if(markerClear == aaCount)then{
			AABlacklist = ["mrk_safeZone"];
			markerClear = 0;
		};
		Sleep 600;
	};
};