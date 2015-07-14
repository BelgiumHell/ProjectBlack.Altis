/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_vehicle","_active"];
_vehicle = _this select 0;
_active = 0;
_vehicle setVariable ["towing", false, true];

//if(isServer)exitWith{};

while{alive _vehicle}do{
    _targetC = (nearestObjects [_vehicle, towableObjects, 10]) select 0;
    
    _positionT = getPosASL _targetC;
    _positionV = getPosASL _vehicle;
    _positionR = [_positionT,8,(getDir _targetC),"Compass",((getPosASL _targetC) select 2)] call Zen_ExtendPosition;

    if((_positionV distance _positionR) < 2) then{
        (driver _vehicle) addAction ["Attach vehicle", {[_this select 1]spawn JOC_towAttach;}];
        waitUntil{!((_positionV distance _positionR) < 2)};
    };
    
    waitUntil {(!(_vehicle getVariable "towing"))};
    Sleep 1;
};