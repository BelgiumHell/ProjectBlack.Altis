/////////////////////////
//Script made by Jochem//
/////////////////////////
_fobCount = -1;

while{true}do{
	_truck = "B_Truck_01_box_F" createVehicle getPos fobSpawn;
	_truck setPosASL getPosASL fobSpawn;
	_truck setDamage 0;
	[_truck] spawn JOC_fobInit;

	_fobCount = _fobCount + 1;

	waitUntil {Sleep 2;((_fobCount < (count bluTowns)) && (!(alive _truck)))};
	deleteVehicle _truck;
	Sleep 5;
};