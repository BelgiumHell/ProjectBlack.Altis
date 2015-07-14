/////////////////////////
//Script made by Jochem//
/////////////////////////

_s = 0;
while{_s < mineCount}do{
   	_j = 0;
	_location = [0,0,opTownMarkers,1,[1,700]] call Zen_FindGroundPosition;

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
	_nameM setMarkerType "hd_objective";
	_nameM setMarkerColor "ColorOPFOR";

	_mine = createMine ["ATMine", _location, [], 0];
	east revealMine _mine;


	while{_j < 15}do{
   		_mine = createMine ["APERSBoundingMine", _location, [], 75];
    		east revealMine _mine;
   		_j = _j + 1;
	};
   	_s = _s + 1;
};