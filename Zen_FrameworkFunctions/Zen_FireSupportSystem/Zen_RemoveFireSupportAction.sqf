// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

#include "Zen_StandardLibrary.sqf"
#include "Zen_FrameworkLibrary.sqf"

_Zen_stack_Trace = ["Zen_RemoveFireSupportAction", _this] call Zen_StackAdd;
private ["_nameString", "_indexes", "_sendPacket", "_commArray", "_units", "_IDs", "_unitsToRemove", "_unitsRemaining"];

if !([_this, [["STRING"], ["VOID"], ["BOOL"]], [], 1] call Zen_CheckArguments) exitWith {
    call Zen_StackRemove;
};

_nameString = _this select 0;

if (!(isDedicated) && {hasInterface}) then {
    _indexes = [Zen_Fire_Support_Comm_ID_Array_Local, _nameString, 0] call Zen_ArrayGetNestedIndex;
    _commArray = Zen_Fire_Support_Comm_ID_Array_Local select (_indexes select 0);

    if (count _this > 1) then {
        _unitsToRemove = [(_this select 1)] call Zen_ConvertToObjectArray;
        _unitsRemaining =+ (_commArray select 1);
        {
            0 = [_unitsRemaining, _x] call Zen_ArrayRemoveValue;
        } forEach _unitsToRemove;
    } else {
        _unitsToRemove = _commArray select 1;
        _unitsRemaining = [];
        _this set [1, _unitsToRemove];
    };

    {
        _IDs = _commArray select 2;
        if (_x in _unitsToRemove) then {
            _x removeAction (_IDs select _forEachIndex);
            _IDs set [_forEachIndex, -1];
        };
    } forEach (_commArray select 1);

    0 = [_IDs, -1] call Zen_ArrayRemoveValue;
    if (count _unitsRemaining == 0) then {
        0 = [Zen_Fire_Support_Comm_ID_Array_Local, (_indexes select 0)] call Zen_ArrayRemoveIndex;
    } else {
        _commArray set [1, _unitsRemaining];
    };
};

ZEN_STD_Parse_GetSetArgumentDefault(_sendPacket, 2, true, false)
if (isMultiplayer && {_sendPacket}) then {
    Zen_MP_Closure_Packet = ["Zen_RemoveFireSupportAction", _this];
    publicVariable "Zen_MP_Closure_Packet";
};

call Zen_StackRemove;
if (true) exitWith {};
