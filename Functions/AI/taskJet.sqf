/////////////////////////
//Script made by Jochem//
/////////////////////////
//0 = Airbase
//1 = AAC Airfield
//2 = Krya Nera Airstrip
//3 = Selakeno Airfield
//4 = Molos Airfield
//5 = Almyra Salt Lake Airstrip
private ["_targetA"];
_targetA = _this select 0;

//Check if active
if(jetActive)then{
	jetTargets = jetTargets + _targetA;
};
if(!(jetActive))then{
	jetActive = true;

	//Get airfield
	_airfieldID = [false,airfieldOccup]call Zen_ValueFindInArray;
	_mrkN = format ["mrk_jetSpawn_%1",_airfieldID];
	_airfield = getMarkerPos _mrkN;

	//Spawn and take-off
	_pilot1 = [_airfield,(jetPool call BIS_fnc_selectRandom),0] call Zen_SpawnAircraft;
	_airfield2 = [_airfield,20,270] call Zen_ExtendPosition;
	_pilot2 = [_airfield2,(jetPool call BIS_fnc_selectRandom),0] call Zen_SpawnAircraft;
	_jet1 = vehicle _pilot1;
	_jet2 = vehicle _pilot2;
	jetG = group _pilot1;
	[_pilot2] joinSilent jetG;
	jetTargets = _targetA;
	Sleep 5;
	[]spawn JOC_jetMonitor;
};