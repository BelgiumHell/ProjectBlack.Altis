/////////////////////////
//Script made by Jochem//
/////////////////////////
[]execVM "Tasks\Functions\waves.sqf";

hint "test";
_trg = _this select 0;
_time = 600;

_x = 0;
while{_x < 600 and destroyed == 0}do{
    _text = format["%1/100 files received",(_x / 6)];
    [[[_text],"Tasks\Functions\chat.sqf"],"BIS_fnc_execVM",true,true ] call BIS_fnc_MP;

    _x = _x + 6;
    Sleep 6;
    
    hint "loop";

    waitUntil{count(list _trg) > 0};
};

hacked = 1;