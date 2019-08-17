GLX_Move_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	// _time = (time + 5);
	
	if (_units isEqualTo [] ) then
	{
		call (GLX_Move_F select 1);
	}
	else
	{
		call (GLX_Move_F select 2);
	};
	
	_group move _position;
	
	_icon setPos _position;
	
	_marker setMarkerPos _position;
	
	_group setVariable ["GLX_Move", _position];
	
	_marker setMarkerText format ["%1 > %2 > %3 > %4", _group, _enemy, _knowsAbout, (leader _group distance _position) ];
	
	_time
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	private _distance = 100;
	
	if (_knowsAbout > 0) then
	{
		_time = (_time + 10);
		
		if (_knowsAbout < 1) then {_knowsAbout = 1};
		
		_distance = (_distance / _knowsAbout);
	}
	else
	{
		_time = (_time + 15);
		
		_random = selectRandom [5, -5, 7, -7, 13, -13];
		
		// player sideChat format ["GLX_Move_F > %1 > Random: %2", _group, _random];
	};
	
	_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
	
	// player sideChat format ["GLX_Move_F > %1 > Array: %2 > KnowsAbout: %3", _group, (count _units), (_group knowsAbout _enemy) ];
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	_time = (_time + 5);
	
	if (leader _group in _units) then
	{
		private _value = 5;
		
		_time = (_time + 5);
		
		private _distance = (_enemy distance leader _group);
		
		if (_distance < 200) then
		{
			_value = 15;
			
			if (_bool) then
			{
				_value = 35;
			};
		};
		
		if (floor (random 100) < _value) exitWith
		{
			_position = (getPos leader _group);
			
			// player sideChat format ["GLX_Move_F > Leader > %1 > %2 > %3", _group, _distance, (combatMode _group) ];
		};
		
		private _direction = (_enemy getDir leader _group);
		
		_direction = (_direction + _random);
		
		// player sideChat format ["GLX_Move_F > Flank > %1 > %2 > %3", _group, _distance, (combatMode _group) ];
		
		if (floor (random 100) < 50) then
		{
			_time = (_time + 5);
			
			if (_distance < 200) then
			{
				private _array = (units _group);
				
				if (_units isEqualTo _array) then
				{
					// _distance = (_distance - random 50);
					
					// _distance = (_distance + random 30);
					
					// player sideChat format ["GLX_Move_F > Back > %1", _group];
				}
				else
				{
					// _distance = (_distance - random 50);
				};
			}
			else
			{
				_distance = (_distance - random 50);
				
				_direction = (_enemy getDir leader _group);
				
				// player sideChat format ["GLX_Move_F > Forward > %1", _group];
			};
		};
		
		_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
	}
	else
	{
		private _value = 100;
		
		private _count = (count _units);
		
		_value = (_value / _count);
		
		_position = [ (getPos _logic select 0) + (random _value) - (random _value), (getPos _logic select 1) + (random _value) - (random _value), 0];
	};
	
	// player sideChat format ["Stop > %1 > Array: %2 > KnowsAbout: %3", _group, (count _units), (_group knowsAbout _enemy) ];
	
	True
	
	}
];