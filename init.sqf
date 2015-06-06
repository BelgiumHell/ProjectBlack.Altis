/////////////////////////
//Script made by Jochem//
/////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"

// Project Black by Jochem
// Version = 0.1a
// Tested with ArmA 3 <version number>

execVM "R3F_LOG\init.sqf";
enableSaving [false, false];

// All clients stop executing here, do not delete this line
if (!isServer) exitWith {};
// Execution stops until the mission begins (past briefing), do not delete this line
sleep 1;

[]execVM "missionInit.sqf";

