/////////////////////////
//Script made by Jochem//
/////////////////////////
_ok = 0;

//Get location of town
capitals = nearestLocations [getPosATL player, ["NameCityCapital"], 25000];
capitalName = "Pyrgos";
towns = nearestLocations [getPosATL player, ["NameCity"], 25000];
villages = nearestLocations [getPosATL player, ["NameVillage"], 25000];


while{_ok == 0}do{
	targetTown = villages select (floor (random (count villages)));
	if((count towns + count capitals) > count occupiedTowns)then{targetTown = towns select ((count occupiedTowns) - count capitals);};
	if((count capitals) >= count occupiedTowns)then{targetTown = capitals select (count occupiedTowns);};
	townName = text targetTown;
	if (!(townName in occupiedTowns))then{_ok = 1; [occupiedTowns,count occupiedTowns,townName] call Zen_ArrayInsert;};
	Sleep 1;
};

_place = targetTown;

if(_place in towns)then{
	_location = position (_place);
	_name = townName;
	
	_trg = createTrigger ["EmptyDetector",_location,true];
	_trg setTriggerArea [900,900,900,false];
	_trg setTriggerActivation ["WEST","PRESENT", false];
	_trg setTriggerStatements ["this","[getPos thisTrigger,400,8,2,2,0,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	
	_marker = createMarker [_name, _location];
	_name setMarkerShape "ELLIPSE";
	_name setMarkerSize [550,550];
	_name setMarkerBrush "DiagGrid";
	_name setMarkerColor "ColorOPFOR";
	
	[townMarkers,count townMarkers,_name] call Zen_ArrayInsert;
};

if(_place in villages)then{
	_location = position (_place);
	_name = townName;
	
	_location = position (_place);
	_trg = createTrigger ["EmptyDetector",_location,true];
	_trg setTriggerArea [700,700,700,false];
	_trg setTriggerActivation ["WEST","PRESENT", false];
	_trg setTriggerStatements ["this","[getPos thisTrigger,200,4,2,0,0,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	
	_marker = createMarker [_name, _location];
	_name setMarkerShape "ELLIPSE";
	_name setMarkerSize [300,300];
	_name setMarkerBrush "DiagGrid";
	_name setMarkerColor "ColorOPFOR";
	
	[townMarkers,count townMarkers,_name] call Zen_ArrayInsert;
};

if(_place in capitals)then{
	_location = position (_place);
	_name = townName;
	
	_location = position (_place);
	_trg = createTrigger ["EmptyDetector",_location,true];
	_trg setTriggerArea [1200,1200,1200,false];
	_trg setTriggerActivation ["WEST","PRESENT", false];
	_trg setTriggerStatements ["this","[getPos thisTrigger,700,12,4,2,2,0]execVM ""Functions\Core\spawnZone.sqf""",""];
	
	_marker = createMarker [_name, _location];
	_name setMarkerShape "ELLIPSE";
	_name setMarkerSize [700,700];
	_name setMarkerBrush "DiagGrid";
	_name setMarkerColor "ColorOPFOR";
	
	[townMarkers,count townMarkers,_name] call Zen_ArrayInsert;
};