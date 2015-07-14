/////////////////////////
//Script made by Jochem//
/////////////////////////
taskActive = 0;

convoy = 0;
crash = 0;
destroyArty = 0;
kill = 0;
nuke = 0;
radio = 0;
rescue = 0;
uavM = 0;

_tasks = ["convoy","crash","destroyArty","kill","radio","rescue"];//All (almost)finished tasks are in here

while{true}do{
    _task = _tasks call BIS_fnc_selectRandom;
    
    if(_task == "convoy" and convoy < 1) then{
        []execVM "Tasks\convoy.sqf";
        taskActive = 1;
        convoy = 5;
    };
    if(_task == "crash" and crash < 1) then{
        []execVM "Tasks\crashedChopper.sqf";
        taskActive = 1;
        crash = 4;
    };
    if(_task == "destroyArty" and destroyArty < 1) then{
        []execVM "Tasks\destroyArty.sqf";
        taskActive = 1;
        destroyArty = 4;
    };
    if(_task == "kill" and kill < 1) then{
        []execVM "Tasks\kill.sqf";
        taskActive = 1;
        kill = 4;
    };
    if(_task == "nuke" and nuke < 1) then{
        []execVM "Tasks\nuke.sqf";
        taskActive = 1;
        nuke = 8;
    };
    if(_task == "radio" and radio < 1) then{
        []execVM "Tasks\radioTower.sqf";
        taskActive = 1;
        radio = 7;
    };
    if(_task == "rescue" and rescue < 1) then{
        []execVM "Tasks\rescue.sqf";
        taskActive = 1;
        rescue = 3;
    };
    if(_task == "uav" and uavM < 1) then{
        []execVM "Tasks\uav.sqf";
        taskActive = 1;
        uavM = 3;
    };
    
    if(taskActive == 1)then{
        convoy = convoy - 1;
        crash = crash - 1;
        destroyArty = destroyArty - 1;
        kill = kill - 1;
        nuke = nuke - 1;
        radio = radio - 1;
        rescue = rescue - 1;
        uavM = uavM - 1;
    };
    
    waitUntil{taskActive == 0;};
    Sleep 1200;
};