_driver = _this select 0;
_vehicle = vehicle _driver;
_target = (nearestObjects [_vehicle, towableObjects, 20]) select 0;

vehicleT = _vehicle;

_vehicle setVariable ["towing", true, true];
removeAllActions _driver;
_target attachTo [_vehicle, [0, -8, 2.1]];
_driver addAction ["Detach", {[_this select 0]call JOC_towDetach;}];