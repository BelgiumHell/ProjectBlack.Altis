/////////////////////////
//Script made by Jochem//
/////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "Functions\fn_compile.sqf";

// Project Black by Jochem
// Version = 0.3EXP
// Tested with ArmA 3 <1.46>

enableSaving [false, false];
mrk_area setMarkerAlpha 0;

// Execution stops until the mission begins (past briefing), do not delete this line
Sleep 1;

// All clients stop executing here, do not delete this line
if (!isServer) exitWith {};

[]execVM "missionInit.sqf";