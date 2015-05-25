/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
*/
_unit =(_this select 0);

//
_rand = random(5);

if(_rand <= 1)then{
	[_unit] execVM "Functions\bomber.sqf";
	bomber = bomber + 1;
};