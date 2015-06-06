/////////////////////////
//Script made by Jochem//
/////////////////////////
_location = _this select 0;

_supports = ["insert","convoy"];
_qrf = _supports call BIS_fnc_selectRandom;


if(_qrf == "insert") then{
	[_location]execVM "Functions\AI\insertion.sqf";
};

if(_qrf == "convoy") then{
	[_location]execVM "Functions\AI\convoy.sqf";
};

_town = nearestLocations [getPosATL player, ["NameCityCapital","NameCity","NameVillage"], 200];
_capitals = nearestLocations [getPosATL player, ["NameCityCapital"], 25000];

if(_town in _capitals)then{
	[_location]execVM "Functions\AI\taskCAS.sqf";
}