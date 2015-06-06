_player = _this select 0;

waitUntil {alive _player};
sleep 0.1;
_player setPosASL getPosASL respawn_obj;
_player addEventHandler ["killed", {[_this select 0] execVM "Functions\Misc\player_respawn.sqf"}];