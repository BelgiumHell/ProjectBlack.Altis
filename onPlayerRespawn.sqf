player setPosASL getPosASL respawn_obj;

player addEventHandler ["hit", {(_this select 0) setDamage 0}];	//Prevent vanilla damage from ruining ACE
player addEventHandler ["InventoryClosed", {[groundArray,count groundArray,(_this select 1)] call Zen_ArrayInsert;}]; //Delete dropped items
player addEventHandler ["fired", {
if((_this select 0) distance respawn_obj < 500)then{
	hint "Don't fire in base!";
	deleteVehicle (_this select 6);
};
}]; //Base protection
[]spawn JOC_loadoutMaster;
[]spawn JOC_playerLoop;