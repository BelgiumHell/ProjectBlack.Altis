/////////////////////////
//Script made by Jochem//
/////////////////////////
_startloc = [1000,1000,0];
_hor = 15;
_vert = 15;

cacheTriggers =[];
_trgA0 = [];
_trgA1 = [];
_trgA2 = [];
_trgA3 = [];
_trgA4 = [];
_trgA5 = [];
_trgA6 = [];
_trgA7 = [];
_trgA8 = [];
_trgA9 = [];
_trgA10 = [];
_trgA11 = [];
_trgA12 = [];
_trgA13 = [];
_trgA14 = [];

cacheTriggers = [
_trgA0,
_trgA1,
_trgA2,
_trgA3,
_trgA4,
_trgA5,
_trgA6,
_trgA7,
_trgA8,
_trgA9,
_trgA10,
_trgA11,
_trgA12,
_trgA13,
_trgA14
];

_xA = 0;
_yA = 0;
_location = _startloc;
while {_xA < _hor} do
{
	while {_yA < _vert} do
	{
		_array = cacheTriggers select _xA;
		_trg = createTrigger ["EmptyDetector",_location,true];
  	 	_trg setTriggerArea [4000,4000,4000,true];
 	    	_trg setTriggerActivation ["WEST","PRESENT", true];
  		_trg setTriggerStatements ["(!((typeOf (thisList select 0)) in jetArray)) OR ((count thisList) > 1)","[getPos thisTrigger] spawn JOC_unCache","[thisTrigger] spawn JOC_cache"];
		[_array, _yA, _trg] call Zen_ArrayInsert;

		_nameM = [5] call Zen_StringGenerateRandom;
		_marker = createMarker [_nameM, _location];
    		_nameM setMarkerShape "RECTANGLE";
    		_nameM setMarkerSize [1000,1000];
    		_nameM setMarkerBrush "Border";
    		_nameM setMarkerColor "ColorOPFOR";
		_nameM setMarkerAlpha 0;
		location = _location;

		_yA = _yA + 1;
		_location = [_location,2000,0] call Zen_ExtendPosition;
	};

	_yA = 0;
	_xA = _xA + 1;
	_location = [_startLoc,(_xA * 2000),90] call Zen_ExtendPosition;

};

cacheTriggers = [
_trgA0
_trgA1,
_trgA2,
_trgA3,
_trgA4,
_trgA5,
_trgA6,
_trgA7,
_trgA8,
_trgA9,
_trgA10,
_trgA11,
_trgA12,
_trgA13,
_trgA14
];

/*_array = [[[1,2],[3,4]],[[5,6,7],[8,9]]];
_result = ((_array select 1) select 0) select 2; //_result is 7*/