/////////////////////////
//Script made by Jochem//
/////////////////////////
_location = _this select 0;

hint "activating";

//Trigger to detect units in area
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [900,900,900,false];
_trg setTriggerActivation ["EAST","PRESENT", false];

Sleep 5;

//Uncache
_list = (list _trg);
{_x enableSimulationGlobal true; _x hideObjectGlobal false;} forEach (_list);

_trgD = createTrigger ["EmptyDetector",_location];
_trgD setTriggerArea [1200,1200,1200,false];
_trgD setTriggerActivation ["WEST","PRESENT", false];
_trgD setTriggerStatements ["this","",""];

_trgC = createTrigger ["EmptyDetector",_location];
_trgC setTriggerArea [900,900,900,false];
_trgC setTriggerActivation ["EAST","PRESENT", false];
_trgC setTriggerStatements ["this","",""];

Sleep 10;

waitUntil{(count list _trgD < 1) or (count list _trgC < 1)};

if((count list _trgD) < 1)then{
	[_location] execVM "Functions\Misc\cache.sqf";
};
if((count list _trgC) < 2)then{
	_town = nearestLocations [_location, ["NameCityCapital","NameCity","NameVillage"], 100];
	_nameM = text (_town select 0);
	deleteMarker _nameM;
};