_driver = _this select 0;
_vehicle = vehicle _driver;
_target = (nearestObjects [_vehicle, towableObjects, 20]) select 0;

detach _target;
removeAllActions (driver _vehicle);
_vehicle setVariable ["towing", false, true];