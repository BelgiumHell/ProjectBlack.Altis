/////////////////////////
//Script made by Jochem//
/////////////////////////
_object = (attachedObjects player select 0);

switch (_this select 1) do
{
	//UP -> increase height
	case 200: 
	{
		hint "up";
		detach _object;
		_object setPosASL [getPosASL player select 0,getPosASL _object select 1,((getPosASL _object select 2) + 0.25)];
		_object attachTo [player];
	};
	//DOWN -> decrease height
	case 208: 
	{
		hint "down";
		detach _object;
		_object setPosASL [getPosASL player select 0,getPosASL _object select 1,((getPosASL _object select 2) - 0.25)];
		_object attachTo [player];
	};
	//Ignore all others
	default{};
};