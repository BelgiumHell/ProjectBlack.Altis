_town= _this select 0;


waituntil{DAC_NewZone == 0};
_DACvalues = ["m1",[1,0,0],[4,4,20,5],[3,2,20,5],[2,2,10,5],[],[0,0,0,0]];
[getMarkerPos _missionLoc,400,400,0,0,_DACvalues] call DAC_fNewZone;