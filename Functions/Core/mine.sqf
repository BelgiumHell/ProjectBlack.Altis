/////////////////////////
//Script made by Jochem//
/////////////////////////
_x = 0;
_name = [5] call Zen_StringGenerateRandom;

_location = [0,0,townMarkers,1,[1,700]] call Zen_FindGroundPosition;


_marker = createMarker [_name, _location];
_name setMarkerType "hd_objective";
_name setMarkerColor "ColorBLUFOR";
 

_mine = createMine ["APERSBoundingMine", _location, [], 0];
east revealMine _mine;


while{_x < 15}do{
	_mine = createMine ["APERSBoundingMine", _location, [], 75];
	east revealMine _mine;
	_x = _x + 1;
};