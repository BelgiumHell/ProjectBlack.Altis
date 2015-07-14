/////////////////////////
//Script made by Jochem//
/////////////////////////
disableSerialization;	//_display var doesn't work otherwise
_class = _this select 0;

_object = _class createVehicle getPos player;

_object attachTo [player,[0,5,0]];
player setVariable["building",true,true];

//Add buttons to change height and rotation
_display = findDisplay 46;
_display displaySetEventHandler ["KeyDown","_this call JOC_buildKeypress"];

player addAction ["<t color='#0000ff'>Place</t>", {detach (attachedObjects player select 0); removeAllActions player;}];
player addAction ["<t color='#ff1111'>Cancel</t>", {_object = (attachedObjects player select 0); detach _object; deleteVehicle _object; removeAllActions player;}];