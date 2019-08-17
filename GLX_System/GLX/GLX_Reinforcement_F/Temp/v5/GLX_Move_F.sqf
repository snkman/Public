GLX_Move_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	private _time = (time + 5);
	
	private _leader = (leader _group);
	
	private _direction = (_enemy getDir _leader);
	
	private _distance = (_enemy distance2D _leader);
	
	if (_units isEqualTo [] ) then
	{
		_position = [_enemy, _group, _logic] call (GLX_Move_F select 1);
	}
	else
	{
		_position = [_enemy, _group, _logic] call (GLX_Move_F select 2);
	};
	
	_group move _position;
	
	if (alive _icon) then
	{
		_icon setPos _position;
	};
	
	if (GLX_Debug select 0) then
	{
		_marker setMarkerPos _position;
		
		_marker setMarkerText format ["%1 > %2 > %3 > %4", _group, _enemy, _knowsAbout, (leader _group distance _position) ];
	};
	
	_group setVariable ["GLX_Move", _position];
	
	_time
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	_time = (_time + 5);
	
	private _distance = 100;
	
	if (_knowsAbout > 0) then
	{
		private _leader = (leader _group );
		
		if (_enemy distance _leader < _distance) then
		{
			_distance = (_enemy distance _leader);
			
			// _distance = (_distance - random 30);
			
			_distance = (_distance - random _distance);
		}
		else
		{
			_distance = (_distance - random 100);
		};
		
		_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
		
		// player sideChat format ["GLX_Move_F > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
	}
	else
	{
		_time = (_time + 5);
		
		_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
	};
	
	_position
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	if (isNull objectParent _leader) then
	{
		_time = (_time + 5);
	}
	else
	{
		if (vehicle _leader isKindOf "Helicopter") exitWith
		{
			_time = (_time + 5);
		};
		
		_time = (_time + 15);
	};
	
	if (_leader in _units) then
	{
		private _value = 5;
		
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
			_position = (getPos _leader);
			
			// player sideChat format ["GLX_Move_F > Leader > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
		};
		
		_time = (_time + 5);
		
		_direction = (_direction + _random);
		
		// player sideChat format ["GLX_Move_F > Flank > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
		
		if (floor (random 100) < 50) then
		{
			if (_distance > 200) exitWith
			{
				_distance = (_distance - random 50);
				
				if (floor (random 100) < 50) then
				{
					_time = (_time + 5);
					
					if (floor (random 100) < 50) then
					{
						_direction = (_direction - _random);
					};
				};
				
				// player sideChat format ["GLX_Move_F > Forward %1 > %2 > %3 > %4 > %5", _group, (_time - time), _random, _distance, (combatMode _group) ];
			};
			
			if (floor (random 100) < 50) then
			{
				private _array = (units _group);
				
				if (_units isEqualTo _array) then
				{
					if (_distance < 50) then
					{
						_distance = (_distance + random 50);
						
						// player sideChat format ["GLX_Move_F > Back > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
					}
					else
					{
						if (_distance > 100) then
						{
							_distance = (_distance - random 30);
							
							if (floor (random 100) < 50) then
							{
								_direction = (_direction - _random);
							};
							
							// player sideChat format ["GLX_Move_F > Forward > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
						};
					};
				};
			};
		};
	}
	else
	{
		_distance = 100;
		
		_distance = (_distance - random 50);
	};
	
	_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
	
	_position
	
	}
];