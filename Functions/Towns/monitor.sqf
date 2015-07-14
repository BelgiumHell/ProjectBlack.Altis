/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_location","size"];
_location = _this select 0;
_size = _this select 1;

//Complete trigger
_trgC = createTrigger ["EmptyDetector",_location];
_trgC setTriggerArea [_size,_size,_size,false];
_trgC setTriggerActivation ["EAST","PRESENT", false];
_trgC setTriggerStatements ["this","",""];

Sleep 10;

waitUntil{(count list _trgC < 5)};

deleteVehicle _trgC;
deleteVehicle _trgC;
_town = nearestLocations [_location, ["NameCityCapital","NameCity","NameVillage"], 100];
_nameM = text (_town select 0);
_nameM setMarkerColor "ColorBLUFOR";
[bluTownsN,count bluTownsN,_nameM] call Zen_ArrayInsert; [bluTowns,count bluTowns,_town] call Zen_ArrayInsert;