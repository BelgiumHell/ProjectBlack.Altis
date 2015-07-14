// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_UpdateFireSupportAction", _this] call Zen_StackAdd;
private ["_nameString", "_unitsToAdd", "_maxCalls", "_sendPacket", "_IDstoAdd", "_indexes", "_commArray", "_previousUnits", "_newUnits", "_previousIDs", "_newIDs"];

if !([_this, [["STRING"], ["VOID"], ["SCALAR"], ["BOOL"]], [], 2] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_nameString = _this select 0;
_unitsToAdd = _this select 1;

if (typeName _unitsToAdd != "SCALAR") then {
    _unitsToAdd = [_unitsToAdd] call Zen_ConvertToObjectArray;
};

ZEN_STD_Parse_GetSetArgumentOptional(_maxCalls, 2, 0, 0)
ZEN_STD_Parse_GetSetArgumentOptional(_sendPacket, 3, true, false)

if (!(isDedicated) && {hasInterface}) then {
    _indexes = [Zen_Fire_Support_Comm_ID_Array_Local, _nameString, 0] call Zen_ArrayGetNestedIndex;
    {
        _commArray = Zen_Fire_Support_Comm_ID_Array_Local select _x;
        if (_maxCalls != 0) then {
            _commArray set [4, _maxCalls];
        };

        if (typeName _unitsToAdd != "SCALAR") then {
            _titleString = _commArray select 5;
            _guideObj = _commArray select 6;
            _guideType = _commArray select 7;

            _IDstoAdd = [];
            {
                _actionID = _x addAction ["<t color='#990000'>" + _titleString + "</t>", {(_this select 3) spawn Zen_InvokeFireSupportAction}, [_nameString, _guideObj, _guideType], 1, false, true, "", "(_target == _this)"];
                _IDstoAdd pushBack _actionID;
            } forEach _unitsToAdd;

            _previousUnits = _commArray select 1;
            0 = [_previousUnits, _unitsToAdd] call Zen_ArrayAppendNested;

            _previousIDs = _commArray select 1;
            0 = [_previousIDs, _IDstoAdd] call Zen_ArrayAppendNested;
        };
    } forEach _indexes;
};

if (isMultiplayer && {_sendPacket}) then {
    Zen_MP_Closure_Packet = ["Zen_UpdateFireSupportAction", _this];
    publicVariable "Zen_MP_Closure_Packet";
};

call Zen_StackRemove;
if (true) exitWith {};
