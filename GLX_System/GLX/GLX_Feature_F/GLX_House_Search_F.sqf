#include "GLX_Macros.hpp"

GLX_House_Search_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// House Search Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// House Search
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	if (floor (random 100) < (GLX_Feature select 5) ) then
	{
		private _units = (units _group);
		
		private _array = (GLX_House_Search select 0);
		
		_units = _units - _array;
		
		private _leader = (leader _group);
		
		_units deleteAt (_units find _leader);
		
		_units = _units select { ( (alive _x) && { (isNull objectParent _x) } ) };
		
		if (count _units > 1) then
		{
			private _unit = _units select (count _units - 1);
			
			private _objects = nearestObjects [_logic, ["House"], 100];
			
			_objects = _objects - (GLX_House_Search select 1);
			
			if (_objects isEqualTo [] ) exitWith {};
			
			private _object = (_objects select 0);
			
			if (_unit distance _object < 100) then
			{
				[_unit, _group, _logic, _objects] call (GLX_House_Search_F select 1);
			};
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// House Search Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// House Search
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_logic","_objects"];
	
	private ["_building","_positions"];
	
	private _count = 0;
	
	for "_count" from _count to (count _objects - 1) do
	{
		_building = (_objects select _count);
		
		_positions = [_building] call GLX_Building_Pos_F;
		
		// player sideChat format ["GLX_House_Search_F > Positions > %1", _positions];
		
		if (_positions > 1) exitWith
		{
			[_unit, _group, _logic, _building, _positions] spawn (GLX_House_Search_F select 2);
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// House Search Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// House Search
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_logic","_building","_positions"];
	
	(GLX_House_Search select 0) pushBack _unit;
	
	(GLX_House_Search select 1) pushBack _building;
	
	if (alive _unit) then
	{
		private ["_position","_distance","_time"];
		
		while { ( (alive _unit) && { (alive _logic) } && { (_positions > 0) } && { (_unit distance _building < 100) } ) } do
		{
			_position = (_building buildingPos _positions);
			
			_distance = (_unit distance _position);
			
			if (_distance > 3) then
			{
				_unit doMove _position;
				
				_time = (time + 10);
				
				_time = (_time + _distance);
				
				while { ( (alive _unit) && { (alive _logic) } && { (time < _time) } && { (_unit distance _building < 100) } ) } do
				{
					if (unitReady _unit) exitWith
					{
						sleep (random 5);
					};
					
					if (_unit distance _logic > 100) exitWith
					{
						_positions = 0;
					};
					
					sleep 5;
				};
			};
			
			_positions = _positions - 1;
			
			// player sideChat format ["GLX_House_Search_F > Positions > %1", _positions];
		};
	};
	
	GLX_DeleteAt(GLX_House_Search,0,_unit);
	
	sleep 30 + (random 50);
	
	GLX_DeleteAt(GLX_House_Search,1,_building);
	
	}
];