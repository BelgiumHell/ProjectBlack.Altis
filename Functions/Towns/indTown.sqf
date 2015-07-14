/////////////////////////
//Script made by Jochem//
/////////////////////////
_villages  = nearestLocations [getPosATL player, ["NameVillage"], 35000];
_villagesT = [_villages,opTowns] call Zen_ArrayFilterValues;
_villagesT = [_villagesT,blackTowns] call Zen_ArrayFilterValues;

_x = 0;
while{_x < count _villagesT}do{
    _village  = _villagesT select _x;
    _name     = text _village;
    _location = position (_village);

    _marker = createMarker [_name, _location];
    _name setMarkerShape "ELLIPSE";
    _name setMarkerSize [300,300];
    _name setMarkerBrush "DiagGrid";
    _name setMarkerColor "ColorCIV";

    _trg = createTrigger ["EmptyDetector",_location,true];
    _trg setTriggerArea [300,300,300,false];
    _trg setTriggerActivation ["WEST","PRESENT", false];
    _trg setTriggerStatements ["this","_town = nearestLocations [(getPos thisTrigger), [""NameVillage""], 50];_nameM = text (_town select 0);_nameM setMarkerColor ""ColorBLUFOR"";",""];

    _x = _x + 1;
    Sleep 0.1;
};