#include "GLX_Macros.hpp"

/*  ////////////////////////////////////////////////////////////////////////////////
\   \ A.I. Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ System Script
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
GLX_System_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// System
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	private _time = 0;
	
	private _delay = 0;
	
private _bool = True;

private _value = 100;

if (floor (random 100) < 50) then
{
	_bool = False;
	
	_group setCombatMode "RED";
};

if (floor (random 100) < 50) then
{
	_group setSpeedMode "FULL";
};

private _position = (getPos leader _group);

_group setVariable ["GLX_Move", _position];

[_enemy, _group, _logic] spawn GLX_UnAssign_F;

(GLX_Reinforcement select 0) pushBack _group;

(GLX_Reinforcement select 1) pushBack _group;

private _groups = (_logic getVariable "GLX_Reinforcement");

_groups pushBack _group;

private _random = selectRandom [5, -5, 7, -7, 13, -13];

private _marker = [_group, "colorWhite"] call (GLX_Marker_F select 0);

// player sideChat format ["GLX_System > Random > %1 > %2", _group, _random];

private _icon = createVehicle ["Sign_Arrow_Large_Pink_F", (getPos _logic), [], 0, "CAN_COLLIDE"];

private ["_units","_enemy","_knowsAbout","_distance"];

while { (units _group findIf { (alive _x) } > -1) } do
{
	_units = [];
	
	_value = (_logic getVariable "GLX_Time");
	
	if (time > _value) exitWith {};
	
	_enemy = [_enemy, _group] call GLX_Enemy_F;
	
	_knowsAbout = (_group knowsAbout vehicle _enemy);
	
	if (_knowsAbout > 0) then
	{
		if (alive _enemy) then
		{
			_units = [_enemy, _group] call GLX_Visible_F;
		};
		
		if (_units findIf { (alive _x) } > -1) then
		{
			_logic setPos (getPos _enemy);
			
			_logic setVariable ["GLX_Time", (time + 310) ];
			
			(str _logic) setMarkerPos [ (getPos _logic select 0), (getPos _logic select 1) - 30, 0];
		};
		
		if (_delay == 0) then
		{
			_delay = (time + (GLX_AI select 0) );
		};
		
		if (time > _delay) then
		{
			_delay = 0;
			
			_count = - 1;
			
			_count = _count + (count _groups);
			
			if (_count < (GLX_AI select 1) ) then
			{
				[_enemy, _group, _logic] call GLX_Reinforcement_F;
			};
		};
		
		if (floor (random 100) < 50) exitWith
		{
			[_enemy, _group, _units] call (GLX_Take_Cover_F select 0);
		};
	};
	
	if (time > _time) then
	{
		_time = [_enemy, _group, _logic] call (GLX_Move_F select 0);
	};
	
	(str _logic) setMarkerText format ["%1 > %2", _groups, (_timeOut - time) ];
	
	sleep 5;
};

GLX_DeleteAt(GLX_Reinforcement,0,_group);

GLX_DeleteAt(GLX_Reinforcement,1,_group);

if (units _group findIf { (alive _x) } > -1) then
{
	_position = waypointPosition [_group, 0];
	
	_group move _position;
	
	(str _group) setMarkerPos _position;
	
	(str _group) setMarkerText format ["%1", _group];
};

_groups deleteAt (_groups find _group);

if (_groups isEqualTo [] ) then
{
	deleteMarker (str _logic);
	
	deleteVehicle _logic;
	
	(group _enemy) setVariable ["Logic", nil];
};