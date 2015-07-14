/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_veh"];
_veh = _this select 0;

_veh vehicleChat "Servicing, please wait...";
_veh setFuel 0;
Sleep 5;

_veh vehicleChat "Repairing...";
Sleep 5;
_veh setDamage 0;

_veh vehicleChat "Rearming...";
Sleep 5;
_veh setVehicleAmmo 1;

_veh vehicleChat "Refueling...";
Sleep 5;
_veh setFuel 1;

_veh vehicleChat "Done!";