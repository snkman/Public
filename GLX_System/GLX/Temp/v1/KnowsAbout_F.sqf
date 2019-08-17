KnowsAbout_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group"];
	
	private _units = allUnits;
	
	_units = _units select { ( (alive _x) && { (_group knowsAbout vehicle _x > 0) } ) };
	
	private ["_unit","_logic"];
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		if (side _group getFriend side _unit < 0.6) exitWith
		{
			(GLX_Reinforcement select 0) pushBack _group;
			
			if (isNil {_unit getVariable "Logic"} ) then
			{
				private _side = createCenter sideLogic;
				
				private _group = createGroup _side;
				
				_logic = _group createUnit ["Logic", (getPos _unit), [], 0, "NONE"];
				
				[_logic] join _group;
				
				_logic allowDamage False;
				
				_unit setVariable ["Logic", _logic];
			}
			else
			{
				_logic = (_unit getVariable "Logic");
			};
			
			[_unit, _group, _logic] spawn (KnowsAbout_F select 1);
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_logic"];
	
	_position = (getPos _logic);
	
	_value = 100;
	
	_text = format ["%1", _group];
	
	_marker = createMarker [_text, _position];
	
	_marker setMarkerSize [1,1];
	
	_marker setMarkerText _text;
	
	_marker setMarkerShape "Icon";
	
	_marker setMarkerType "mil_dot";
	
	_marker setMarkerColor "colorWhite";
	
	_icon = createVehicle ["Sign_Arrow_Large_Pink_F", _position, [], 0, "CAN_COLLIDE"];
	
	_random = (random 30 - random 50);
	
	private ["_array","_knowsAbout","_distance"];
	
	while { (True) } do
	{
		_array = [_unit, _group] call Visible_F;
		
		_knowsAbout = (_group knowsAbout vehicle _unit);
		
		_time = 5;
		
		if (_array isEqualTo [] ) then
		{
			_distance = 100;
			
			if (_knowsAbout > 0) then
			{
				_time = (_time + 5);
				
				_distance = (_distance / _knowsAbout);
			}
			else
			{
				_time = (_time + 10);
				
				_random = (random 30 - random 50);
			};
			
			_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
			
			// player sideChat format ["Move > %1 > Array: %2 > KnowsAbout: %3", _group, (count _array), (_group knowsAbout _unit) ];
		}
		else
		{
			[_unit, _group, _array] call (GLX_Take_Cover_F select 0);
			
			_logic setPos (getPos _unit);
			
			Marker setMarkerPos (getPos _logic);
			
			if (leader _group in _array) then
			{
				if (floor (random 100) < 50) exitWith
				{
					_position = (getPos leader _group);
				};
				
				_direction = (_unit getDir leader _group);
				
				_distance = (_unit distance leader _group);
				
				if (floor (random 100) < 35) then
				{
					if (floor (random 100) < 50) exitWith
					{
						_distance = (_distance - random 30);
					};
					
					_units = (units _group);
					
					if (_array isEqualTo _units) then
					{
						_distance = (_distance + random 30);
					};
				}
				else
				{
					_direction = (_direction + _random);
				};
				
				_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
				
				_time = (_time + 5);
			}
			else
			{
				_count = (count _array);
				
				_value = (_value / _count);
				
				_position = [ (getPos _logic select 0) + (random _value) - (random _value), (getPos _logic select 1) + (random _value) - (random _value), 0];
			};
			
			// player sideChat format ["Stop > %1 > Array: %2 > KnowsAbout: %3", _group, (count _array), (_group knowsAbout _unit) ];
		};
		
		_group move _position;
		
		_marker setMarkerPos _position;
		
		_icon setPos _position;
		
		sleep _time;
	};
	
	}
];