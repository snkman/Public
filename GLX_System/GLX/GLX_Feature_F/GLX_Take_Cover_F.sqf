#include "GLX_Macros.hpp"

GLX_Take_Cover_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_units"];
	
	_units = _units - (GLX_Take_Cover select 0);
	
	private "_unit";
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		if (floor (random 100) < (GLX_Feature select 3) ) then
		{
			if ( (alive _unit) && { (isNull objectParent _unit) } ) then
			{
				[_unit, _enemy, _group] call (GLX_Take_Cover_F select 1);
			};
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_enemy","_group"];
	
	private _object = [_unit, _enemy, _group] call (GLX_Take_Cover_F select 2);
	
	if (alive _object) then
	{
		(GLX_Take_Cover select 0) pushBack _unit;
		
		(GLX_Take_Cover select 1) pushBack _object;
		
		[_unit, _enemy, _group, _object] spawn (GLX_Take_Cover_F select 3);
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_enemy","_group"];
	
	private _return = objNull;
	
	if (alive _unit) then
	{
		private _position = _unit;
		
		private _leader = (leader _group);
		
		if ( (_unit == _leader) || (floor (random 100) < 75) ) then
		{
			_position = (_group getVariable "GLX_Move");
		};
		
		private _distance = 30;
		
		if (_unit == _leader) then
		{
			_distance = 30;
		};
		
		_distance = (GLX_Feature select 4);
		
		_objects = nearestTerrainObjects [_position, ["HIDE","BUSH","TREE","WALL","HOUSE","FENCE"], _distance];
		
		_objects = _objects - (GLX_Take_Cover select 1);
		
		if (_objects isEqualTo [] ) exitWith {};
		
		private "_object";
		
		private _count = 0;
		
		for "_count" from _count to (count _objects - 1) do
		{
			_object = (_objects select _count);
			
			if ( (floor (random 100) < 15) || ( (_unit distance _enemy) > (_enemy distance _object) ) ) then
			{
				if ( ( (_unit distance _object) < (_enemy distance _object) ) && { (_enemy distance _object > _distance) } ) then
				{
					// player sideChat format ["GLX_Take_Cover_F > Object > %1", _object];
					
					if ( (boundingBox _object select 1) findIf { (_x > 15) } > -1) exitWith
					{
						// player sideChat format ["GLX_Take_Cover_F > BoundingBox > %1", _object];
					};
					
					if ( (GLX_Take_Cover select 1) findIf { (_object distance _x < 5) } > -1) exitWith
					{
						// player sideChat format ["GLX_Take_Cover_F > Distance > %1", _object];
					};
					
					_return = _object;
				};
			};
			
			if (alive _return) exitWith
			{
				// player sideChat format ["GLX_Take_Cover_F > Exit > %1 > %2 > %3", _unit, _count, (count _objects) ];
			};
		};
	};
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Take Cover
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_enemy","_group","_object"];
	
	// player sideChat format ["GLX_Take_Cover_F > %1 > %2 > %3 > %4", _object, (typeOf _object), (sizeOf typeOf _object), (boundingBox _object select 1) ];
	
	private _random = 100;
	
	if (_unit distance _object < 5) then
	{
		_random = 75;
	};
	
	if (floor (random 100) < _random) then
	{
		_unit setUnitPos "UP";
	}
	else
	{
		_unit setUnitPos "MIDDLE";
	};
	
	// _unit setUnitPos "UP";
	
	private _direction = (_object getDir _enemy);
	
	private _boundingBox = (boundingBox _object select 1 select 0);
	
	// player sideChat format ["GLX_Take_Cover_F > BoundingBox > %1 > %2 > %3", _unit, _object, (boundingBox _object select 1) ];
	
	if (_boundingBox > 3) then
	{
		_boundingBox = 3;
	}
	else
	{
		if (_boundingBox < 1) then
		{
			_boundingBox = _boundingBox + 1;
		};
	};
	
	// player sideChat str (boundingCenter _object);
	
	private _cover = [_object, - _boundingBox, _direction] call GLX_Real_Pos_F;
	
	_unit doMove _cover;
	
	private _spot = objNull;
	
	if (GLX_Debug select 1) then
	{
		_spot = createVehicle ["Sign_Arrow_Large_Blue_F", _cover, [], 0, "CAN_COLLIDE"];
	};
	
	private _time = (time + 10);
	
	_time = _time + (_unit distance _cover);
	
	while { ( (alive _unit) && { (time < _time) } ) } do
	{
		// if (unitReady _unit) exitWith
		
		if (_unit distance2D _cover < _boundingBox) exitWith
		{
			// player sideChat format ["GLX_Take_Cover_F > %1 > %2 > %3", _unit, (_unit distance _cover), (boundingBox _object select 1 select 2) ];
			
			// player sideChat format ["GLX_Take_Cover_F > BoundingBox > %1 > %2 > %3 > %4", _unit, _cover, _object, (boundingBox _object select 1) ];
		};
		
		sleep 1;
	};
	
	if (alive _spot) then
	{
		deleteVehicle _spot;
	};
	
	_unit setUnitPos "AUTO";
	
	if (alive _unit) then
	{
		_flanking = True;
		
		if (time < _time) then
		{
			if (GLX_Debug select 0) then
			{
				_spot = createVehicle ["Sign_Arrow_Large_Green_F", _cover, [], 0, "CAN_COLLIDE"];
			};
			
			if (_object isKindOf "House") exitWith
			{
				sleep (random 10);
				
				if (alive _spot) then
				{
					deleteVehicle _spot;
				};
				
				// player sideChat format ["GLX_Take_Cover_F > House > %1", _unit, _object];
			};
			
			_unit forceSpeed 0;
			
			if ( (floor (random 100) < 35) && { (_unit distance _enemy < 300) } ) then
			{
				sleep (random 5);
				
				if (alive _unit) then
				{
					_group = (group _unit);
					
					if (alive _spot) then
					{
						deleteVehicle _spot;
						
						_spot = createVehicle ["Sign_Arrow_Large_F", _cover, [], 0, "CAN_COLLIDE"];
					};
						
					sleep (random 10);
				};
			}
			else
			{
				sleep (random 5);
			};
			
			if (floor (random 100) < 50) then
			{
				GLX_DeleteAt(GLX_Take_Cover,0,_unit);
				
				[_unit, _enemy, _group] call (GLX_Take_Cover_F select 1);
				
				if (alive _spot) then
				{
					deleteVehicle _spot;
					
					_spot = createVehicle ["Sign_Arrow_Large_Yellow_F", _cover, [], 0, "CAN_COLLIDE"];
				};
				
				sleep (random 5);
				
				if (_unit in (GLX_Take_Cover select 0) ) then
				{
					_flanking = False;
				};
			};
			
			_unit forceSpeed -1;
			
			if (alive _spot) then
			{
				deleteVehicle _spot;
			};
		};
		
		if (_flanking) then
		{
			sleep 10 + (random 30);
			
			GLX_DeleteAt(GLX_Take_Cover,0,_unit);
		};
		
		sleep 10 + (random 30);
		
		GLX_DeleteAt(GLX_Take_Cover,1,_object);
	}
	else
	{
		GLX_DeleteAt(GLX_Take_Cover,0,_unit);
		
		GLX_DeleteAt(GLX_Take_Cover,1,_object);
	};
	
	}
];