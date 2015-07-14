/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_name = [5] call Zen_StringGenerateRandom;
radarDestroyed = 0;
_ok = 0;


//Get position
while{_ok == 0}do{
    _location       = [0,0,occupiedMarkers,1,0,0,[1,0,10],0,0,[1,5,5],[1,[0,0,0],10]] call Zen_FindGroundPosition;
    _nearestPlayers = [];
    {
        if (isPlayer _x && _x distance _location < 1000) then {
            _nearestPlayers pushBack _x
        };
    } forEach (playableUnits + switchableUnits);
    if(count _nearestPlayers == 0)then{_ok = 1;locationT = _location;};
};
_location = locationT;
_dropLocation = getMarkerPos "mrk_return";
 

//Spawn tower
tower = [_location, "Land_TTowerBig_2_F"] call Zen_SpawnVehicle;


//Create task markers

_location= [_location, random 150, random 150] call BIS_fnc_relPos;
_marker = createMarker [_name, _location];
_name setMarkerShape "RECTANGLE";
_name setMarkerSize [200,200];
_name setMarkerBrush "Solid";
_name setMarkerColor "ColorOPFOR";


//Create task
_task = [west,"An enemy radio tower is blocking our communications. Destroy it ASAP","Destroy radio tower",_location,true,"",_name] call Zen_InvokeTask;


//Disable radio
{_x setVariable ["tf_sendingDistanceMultiplicator", 0.1]} forEach playableUnits; 


_x = 0;

//Spawn enemy's
_groupCount = 5;
_carCount = 2;

//infantry
while{_x < _groupCount} do{
    _locationS = [_location, random 200, random 200] call BIS_fnc_relPos;
    _locationS = [_locationS,1,1] call Zen_ExtendPosition;
    _group = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantry;
    [_group,_location,[0,200],[0,360],"limited","safe"] spawn Zen_OrderInfantryPatrol;
    _x = _x + 1;
};

_x = 0;

//cars
while{_x < _carCount} do{
    _locationS = [_location, random 200, random 200] call BIS_fnc_relPos;
    _locationS = [_locationS,1,1] call Zen_ExtendPosition;
    _veh = [_locationS,(carPool call BIS_fnc_selectRandom)] call Zen_SpawnVehicle;
    [_veh,east] call Zen_SpawnVehicleCrew; 
    _x = _x + 1;
};

_x = 0;


//Spawn complete trigger
_trgdead = createTrigger ["EmptyDetector",_dropLocation];
_trgdead setTriggerStatements ["!alive tower","radarDestroyed = 1",""];

waitUntil { radarDestroyed == 1};


//Complete task
    [_name, "succeeded"] call Zen_UpdateTask;


//Cleanup
Sleep 5;

taskActive = 1;

deleteMarker _marker;