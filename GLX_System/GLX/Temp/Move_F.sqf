params ["_unit","_group","_logic"];

private ["_knowsAbout","_distance","_position","_direction"];

if (True) then
{
	_knowsAbout = (_group knowsAbout vehicle _unit);
	
	_time = (time + 5);
	
	if (_array isEqualTo [] ) then
	{
		_distance = 100;
		
		if (_knowsAbout > 0) then
		{
			if (_knowsAbout < 1) then {_knowsAbout = 1};
			
			_time = (_time + 5);
			
			_distance = (_distance / _knowsAbout);
		}
		else
		{
			_time = (_time + 5);
			
			// _random = (random 15 - random 30);
			
			_random = selectRandom [3, -3, 5, -5, 7, -7, 13, -13];
			
			// player sideChat format ["Move > %1 > Random: %2", _group, _random];
		};
		
		_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
		
		// player sideChat format ["Move > %1 > Array: %2 > KnowsAbout: %3", _group, (count _array), (_group knowsAbout _unit) ];
	}
	else
	{
		_time = (_time + 5);
		
		if (leader _group in _array) then
		{
			_time = (_time + 5);
			
			if (floor (random 100) < 35) exitWith
			{
				_position = (getPos leader _group);
				
				// player sideChat format ["Move_F > Leader > %1", _group];
			};
			
			_direction = (_unit getDir leader _group);
			
			_direction = (_direction + _random);
			
			// player sideChat format ["Move_F > Flank > %1", _group];
			
			_distance = (_unit distance leader _group);
			
			if (floor (random 100) < 50) then
			{
				if (floor (random 100) < 0) exitWith
				{
					// _distance = (_distance - random 30);
				};
				
				_units = (units _group);
				
				if (_array isEqualTo _units) then
				{
					_distance = (_distance + random 30);
					
					// player sideChat format ["Move_F > Back > %1", _group];
				};
			}
			else
			{
				// _direction = (_direction + _random);
			};
			
			_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
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
};

_time