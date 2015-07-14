/////////////////////////
//Script made by Jochem//
/////////////////////////

//AI
JOC_spawnZone = compileFinal preprocessFileLineNumbers "Functions\AI\spawnZone.sqf";
JOC_taskJet = compileFinal preprocessFileLineNumbers "Functions\AI\taskJet.sqf";
JOC_jetMonitor = compileFinal preprocessFileLineNumbers "Functions\AI\jetMonitor.sqf";
JOC_radar = compileFinal preprocessFileLineNumbers "Functions\AI\radar.sqf";
//JOC_sortTargets = compileFinal preprocessFileLineNumbers "Functions\AI\priority.sqf";

//Caching
JOC_cacheInit = compileFinal preprocessFileLineNumbers "Functions\Caching\cacheInit.sqf";
JOC_cache = compileFinal preprocessFileLineNumbers "Functions\Caching\cache.sqf";
JOC_unCache = compileFinal preprocessFileLineNumbers "Functions\Caching\unCache.sqf";
JOC_cacheObj = compileFinal preprocessFileLineNumbers "Functions\Caching\cacheObj.sqf";

//Init
JOC_initAA = compileFinal preprocessFileLineNumbers "Functions\Init\initAA.sqf";
JOC_initTowns = compileFinal preprocessFileLineNumbers "Functions\Init\initTowns.sqf";
JOC_initMines = compileFinal preprocessFileLineNumbers "Functions\Init\initMines.sqf";

//Loadouts
JOC_arsenal = compileFinal preprocessFileLineNumbers "Functions\Loadouts\arsenal.sqf";
JOC_loadoutMaster = compileFinal preprocessFileLineNumbers "Functions\Loadouts\master.sqf";

//Logistics
#include "Logistics\fn_logistics_compile.sqf";
JOC_crateInit = compileFinal preprocessFileLineNumbers "Functions\Logistics\crateInit.sqf";

//Player
JOC_playerLoop = compileFinal preprocessFileLineNumbers "Functions\Player\playerLoop.sqf";

//Tasks
#include "Tasks\fn_task_compile.sqf";
//JOC_task_boat = compileFinal preprocessFileLineNumbers "Functions\Tasks\boat.sqf";
JOC_task_crash = compileFinal preprocessFileLineNumbers "Functions\Tasks\crashedChopper.sqf";

//Towns
JOC_occupy = compileFinal preprocessFileLineNumbers "Functions\Towns\occupy.sqf";
JOC_indTown = compileFinal preprocessFileLineNumbers "Functions\Towns\indTown.sqf";
JOC_monitorTown = compileFinal preprocessFileLineNumbers "Functions\Towns\monitor.sqf";

//vehicle
JOC_vehInit = compileFinal preprocessFileLineNumbers "Functions\Vehicle\vehInit.sqf";
JOC_vehRespawn = compileFinal preprocessFileLineNumbers "Functions\Vehicle\vehicle_respawn.sqf";
JOC_tow = compileFinal preprocessFileLineNumbers "Functions\Vehicle\tow.sqf";
JOC_service = compileFinal preprocessFileLineNumbers "Functions\Vehicle\service.sqf";
JOC_handleVehDamage = compileFinal preprocessFileLineNumbers "Functions\Vehicle\handleDamage.sqf";
JOC_towAttach = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Tow\attach.sqf";
JOC_towDetach = compileFinal preprocessFileLineNumbers "Functions\Vehicle\Tow\detach.sqf";