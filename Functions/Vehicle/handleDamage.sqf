_tank = _this select 0;
_part = _this select 1;
_damage = _this select 2;

_text = format["%1,%2",_part,_damage,(_tank getHit _part)];
hint _text;

if((_tank getHitPointDamage "hitHull") > 0.8)then{
	_tank setHitPointDamage ["HitEngine", 1];
	_tank setHitPointDamage ["HitTurret", 1];
	_tank setHitPointDamage ["HitGun", 1];
	_tank allowDamage false;
};
if(!((_tank getHitPointDamage "hitHull") > 0.8))then{
	_tank setHit[_part,((_damage * 3) + (_tank getHit _part))];
};