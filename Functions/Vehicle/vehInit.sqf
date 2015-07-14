/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_vehicle"];

_vehicle = _this select 0;
_vehicletype = typeOf _vehicle;
_time = 0;

Sleep 1;

_vehicle setDamage 0;

//F-18
if(_vehicletype == "JS_JC_FA18F" or _vehicletype == "JS_JC_FA18E")then{
    //mod_cat synchronizeObjectsAdd [_vehicle];
    //mod_fuel synchronizeObjectsAdd [_vehicle];
    //mod_iflols synchronizeObjectsAdd [_vehicle];
    [_vehicle] call TTT_fnc_syncCatapult;
    [_vehicle] call TTT_fnc_syncFuelAction;
    [_vehicle] call TTT_fnc_syncIFLOLS;
    _time = 3600;
};

//Towing tractor
if(_vehicletype == "Peral_B_600")then{
    //[_vehicle]spawn JOC_tow;
    _time = 60;
};

//Blackhawk
if(_vehicletype == "RHS_UH1Y_UNARMED" or _vehicletype == "RHS_UH1Y")then{
    _time = 600;
};

//Apache
if(_vehicletype == "fza_ah64d_b2e")then{
    _time = 1800;
};

//LittleBird
if(_vehicletype == "MELB_AH6M_L")then{
    _time = 1800;
};

//Chinook
if(_vehicletype == "B_Heli_Transport_03_unarmed_F" or _vehicletype == "kyo_MH47E_H")then{
    _time = 600;
};

//Tank
if(_vehicletype == "Burnes_FV4034_01")then{
    _vehicle addEventHandler ["HandleDamage" , {[(_this select 0),(_this select 1), (_this select 2)]spawn JOC_handleVehDamage;}];
    _time = 1800;
};

//Marshall
if(_vehicletype == "B_APC_Wheeled_01_cannon_F")then{
    _time = 1800;
};

//MRAP
if(_vehicletype == "blx_ridgback_HMG_W")then{
    _time = 600;
};

//HMVEE
if(_vehicletype == "rhsusf_m1025_w_s_m2" or _vehicletype == "rhsusf_m1025_w_s_Mk19" or _vehicletype == "rhsusf_m998_w_s_4dr")then{
    _time = 300;
};

//Landing craft
if(_vehicletype == "Burnes_MK10_1")then{
    _time = 600;
};

//Ammo container
if(_vehicletype == "B_Slingload_01_Ammo_F" or _vehicletype == "B_Slingload_01_Fuel_F" or _vehicletype == "B_Slingload_01_Medevac_F" or _vehicletype == "B_Slingload_01_Cargo_F" or _vehicletype == "B_Slingload_01_Repair_F" or _vehicletype == "B_CargoNet_01_ammo_F")then{
    _time = 300;
};

[_vehicle,_time] spawn JOC_vehRespawn;