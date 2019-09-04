#include "GLX_Macros.hpp"

GLX_System_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// System
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	_time = 0;
	
	private _delay = 0;
	
	private _bool = True;
	
	private _marker = "";
	
	private _icon = objNull;
	
	if (floor (random 100) < 50) then
	{
		_bool = False;
		
		_group setCombatMode "RED";
	};
	
	if (floor (random 100) < 50) then
	{
		_group setSpeedMode "FULL";
	};
	
	private _leader = (leader _group);
	
	_position = (getPos _leader);
	
	(units _group) doWatch (getPos _enemy);
	
	_group setVariable ["GLX_Move", _position];
	
	(GLX_Reinforcement select 0) pushBack _group;
	
	(GLX_Reinforcement select 1) pushBack _group;
	
	_group setVariable ["GLX_Time", (time + (GLX_AI select 3) ) ];
	
	private _array = (_logic getVariable "GLX_Random");
	
	private _random = selectRandom _array;
	
	[_group, _logic, _random] call (GLX_Logic_F select 2);
	
	private _groups = (_logic getVariable "GLX_Reinforcement");
	
	_groups pushBack _group;
	
	_array = _groups - (GLX_Move select 0);
	
	if (count _array > 2) then
	{
		_array = [-1, 0, 1];
		
		_random = selectRandom _array;
		
		_logic setVariable ["GLX_Random", _array];
		
		// player sideChat format ["GLX_System > Random > %1 > %2", _group, _random];
	};
	
	[_enemy, _group, _logic] spawn (GLX_Unassign_F select 0);
	
	// player sideChat format ["GLX_System > Random > %1 > %2", _group, _random];
	
	if (GLX_Debug select 1) then
	{
		_marker = [_group, "colorWhite"] call (GLX_Marker_F select 0);
	};
	
	if (GLX_Debug select 2) then
	{
		_icon = createVehicle ["Sign_Arrow_Large_Pink_F", (getPos _leader), [], 0, "CAN_COLLIDE"];
	};
	
	private ["_units","_enemy","_knowsAbout","_string"];
	
	while { (units _group findIf { (alive _x) } > -1) } do
	{
		_units = [];
		
		if ( [_group, _logic] call (GLX_Time_F select 0) ) exitWith {};
		
		_enemy = [_enemy, _group] call GLX_Enemy_F;
		
		_knowsAbout = (_group knowsAbout vehicle _enemy);
		
		if (_knowsAbout > 0) then
		{
			[_enemy, _group, _logic] call (GLX_System_F select 1);
		};
		
		if (time > _time) then
		{
			if (_knowsAbout > 0) then
			{
				_time = (time + 5);
			}
			else
			{
				_time = (time + 15);
			};
			
			_string = (_group getVariable "GLX_Disable");
			
			if (_string isEqualTo "GLX_Move") exitWith {};
			
			_time = [_enemy, _group, _logic] call (GLX_Move_F select 0);
			
			// player sideChat format ["GLX_System_F > %1 > %2 > %3 > %4", _group, _random, (_time - time), (combatMode _group) ];
		};
		
		sleep 5;
	};
	
	call (GLX_System_F select 2);
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// System Function 1
	// ////////////////////////////////////////////////////////////////////////////
	// System
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	// _logic setPos (getPos _enemy);
	
	if (alive _enemy) then
	{
		_logic setPos (getPos _enemy);
		
		_units = [_enemy, _group] call GLX_Visible_F;
	};
	
	if (_units findIf { (alive _x) } > -1) then
	{
		[_group, _logic] call (GLX_Time_F select 1);
	};
	
	if (GLX_Debug select 1) then
	{
		(str _logic) setMarkerPos [ (getPos _logic select 0), (getPos _logic select 1) + 30, 0];
	};
	
	if (_delay == 0) then
	{
		_delay = time;
		
		_delay = _delay + (GLX_Radio select 0);
	};
	
	if (time > _delay) then
	{
		_delay = 0;
		
		if (_knowsAbout > (GLX_AI select 0) ) then
		{
			_string = (_group getVariable "GLX_Disable");
			
			if (_string isEqualTo "GLX_Request") exitWith {};
			
			if (_group in (GLX_Join select 0) ) exitWith {};
			
			private _count = - 1;
			
			private _array = _groups;
			
			_array = _array - (GLX_Join select 0);
			
			_count = _count + (count _array);
			
			if (_count < (GLX_AI select 2) ) then
			{
				if (call (GLX_Rating_F select 0) ) then
				{
					[_enemy, _group, _logic] call GLX_Reinforcement_F;
				};
			};
		};
	};
	
	[_enemy, _group, _units] call (GLX_Take_Cover_F select 0);
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// System Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// System
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	if (alive _icon) then
	{
		deleteVehicle _icon;
	};
	
	private _units = (units _group);
	
	GLX_DeleteAt(GLX_Join,0,_group);
	
	GLX_DeleteAt(GLX_Reinforcement,0,_group);
	
	GLX_DeleteAt(GLX_Reinforcement,1,_group);
	
	if (_units findIf { (alive _x) } > -1) then
	{
		private _position = waypointPosition [_group, 0];
		
		player sideChat str _position;
		
		_group move _position;
		
		_units allowGetIn True;
		
		_units orderGetIn True;
		
		if (GLX_Debug select 1) then
		{
			(str _group) setMarkerPos _position;
			
			(str _group) setMarkerText format ["%1", _group];
		};
		
		private _vehicle = (vehicle leader _group);
		
		[_group, _vehicle] spawn (GLX_Helicopter_F select 1);
		
		{_x forceSpeed -1; _x setUnitPos "AUTO"} count _units;
	}
	else
	{
		deleteMarker (str _group);
		
		if (_group in (GLX_Location select 0) ) then
		{
			GLX_DeleteAt(GLX_Location,0,_group);
			
			private _array = (_group getVariable "GLX_Location");
			
			_array deleteAt (_array find _group);
			
			{_x setVariable ["GLX_Location", _array] } count _array;
		};
	};
	
	_groups deleteAt (_groups find _group);
	
	if (_groups isEqualTo [] ) then
	{
		if (GLX_Debug select 1) then
		{
			deleteMarker (str _logic);
		};
		
		GLX_DeleteAt(GLX_Logic,0,_logic);
		
		deleteVehicle _logic;
	};
	
	True
	
	}
];