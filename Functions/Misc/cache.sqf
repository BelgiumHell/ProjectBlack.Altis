/////////////////////////
//Script made by Jochem//
/////////////////////////
_location = _this select 0;

_x = 0;

//Trigger to detect units in area
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [900,900,900,false];
_trg setTriggerActivation ["EAST","PRESENT", false];

Sleep 5;

//Uncache
_list = (list _trg);

{_x enableSimulationGlobal false; _x hideObjectGlobal true;}forEach (_list);

//Respawn activation trigger
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [900,900,900,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["this","[getPos thisTrigger]execVM ""Functions\Misc\activate.sqf""",""];