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
	
	if (vehicle _leader isKindOf "Air") then
	{
		_distance = 300;
		
		_time = (_time + 15);
		
		_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
	}
	else
	{
		_direction = (_enemy getDir _leader);
		
		_distance = (_enemy distance2D _leader);
		
		if (_units isEqualTo [] ) then
		{
			_position = [_enemy, _group, _logic] call (GLX_Move_F select 1);
		}
		else
		{
			// [_enemy, _group, _logic] call (GLX_Static_Weapon_F select 0);
			
			_position = [_enemy, _group, _logic] call (GLX_Move_F select 2);
		};
	};
	
	_group move _position;
	
	if (alive _icon) then
	{
		_icon setPos _position;
	};
	
	if (GLX_Debug select 1) then
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
	
	if ( (_knowsAbout > 0) && { (_distance > 100) } ) then
	{
		if (alive _enemy) then
		{
			_distance = (_distance - random 50);
		}
		else
		{
			_distance = (_distance - random 100);
		};
		
		_direction = [_enemy, _group] call (GLX_Move_F select 3);
		
		_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
		
		// player sideChat format ["GLX_Move_F > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
	}
	else
	{
		_distance = 100;
		
		_time = (_time + 5);
		
		[_enemy, _group, _logic] call (GLX_House_Search_F select 0);
		
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
		_time = (_time + 15);
	};
	
	if (_leader in _units) then
	{
		private _value = 5;
		
		if (_distance < 200) then
		{
			_value = 15;
			
			if (combatMode _group isEqualTo "YELLOW") then
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
		
		if (_random == 0) exitWith
		{
			_value = 3 - (random 7);
			
			_direction = (_direction + _value);
			
			if (_distance < 100) then
			{
				_distance = (_distance - random 10);
			}
			else
			{
				_distance = (_distance - random 100);
			};
		};
		
		_tweak = (GLX_Tweak select 1);
		
		if (floor (random 100) < _tweak) then
		{
			_direction = [_enemy, _group] call (GLX_Move_F select 3);
		};
		
		// player sideChat format ["GLX_Move_F > Flank > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
		
		if (floor (random 100) < 50) then
		{
			if (_distance > 200) then
			{
				// _distance = (_distance - 50);
				
				_distance = (_distance - random 50);
				
				// _distance = (_distance - random 100);
				
				// player sideChat format ["GLX_Move_F > Forward %1 > %2 > %3 > %4 > %5", _group, (_time - time), _random, _distance, (combatMode _group) ];
			}
			else
			{
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
								// _distance = (_distance - 10);
								
								_distance = (_distance - random 10);
								
								// player sideChat format ["GLX_Move_F > Forward > %1 > %2 > %3 > %4 > %5", _group, _random, (_time - time), _distance, (combatMode _group) ];
							};
						};
					};
				};
			};
		};
	}
	else
	{
		[_enemy, _group, _logic] call (GLX_Move_F select 1);
	};
	
	_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
	
	_position
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Move Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Move
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group"];
		
	private _tweak = (GLX_Tweak select 0);
	
	private _value = selectRandom _tweak;
	
	if (_tweak isEqualTo [] ) then
	{
		_value = (random 15);
	};
	
	private _return = _value;
	
	if (_random < 0) then
	{
		_return = - _value;
	};
	
	// player sideChat format ["GLX_Move_F > Random > %1 > %2 > %3 > %4 > %5", _group, _return, (_time - time), _distance, (combatMode _group) ];
	
	private _distance = (_enemy distance2D _leader);
	
	if (_distance > 200) then
	{
		_value = 1;
		
		_value = _value + (random 1);
		
		if (_distance > 300) then
		{
			_value = _value + (random 1);
		};
		
		_return = (_return / _value);
	};
	
	_direction = (_direction + _return);
	
	_direction
	
	}
];