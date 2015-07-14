/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_targetC"];

_targetC = jetTargets select 0;
targetC = _targetC;
_j = 1;
while{(alive (units jetG select 0)) OR (alive (units jetG select 1))}do {
	scopeName "loop1";
	while{!alive _targetC OR ((vehicle _targetC) == _targetC)}do{
		_targetC = jetTargets select _j;
		_j = _j + 1;
		if(count jetTargets < _j)then{
			(vehicle (units jetG select 0)) landAt 0;
			(vehicle (units jetG select 0)) addEventHandler["LandedStopped",{deleteVehicle _this select 0;}];
			(vehicle (units jetG select 1)) landAt 0;
			(vehicle (units jetG select 1)) addEventHandler["LandedStopped",{deleteVehicle _this select 0;}];
			breakOut "loop1";
		};
	};
	jetG move (position _targetC);
	Sleep 10;
	targetC = _targetC;
};

Sleep 1800;

jetActive = false;