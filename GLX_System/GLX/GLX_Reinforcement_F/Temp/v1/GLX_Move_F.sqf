/*  ////////////////////////////////////////////////////////////////////////////////
\   \ A.I. Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ Move Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
GLX_Move_F = [

	{params ["_unit","_group","_logic"];

private ["_distance","_position","_direction"];

if (True) then
{
	_time = (time + 5);
	
	if (_units isEqualTo [] ) then
	{
		_distance = 100;
		
		if (_knowsAbout > 0) then
		{
			_time = (_time + 5);
			
			if (_knowsAbout < 1) then {_knowsAbout = 1};
			
			_distance = (_distance / _knowsAbout);
		}
		else
		{
			_time = (_time + 10);
			
			_random = selectRandom [5, -5, 7, -7, 13, -13];
			
			// player sideChat format ["GLX_Move_F > %1 > Random: %2", _group, _random];
		};
		
		_position = [ (getPos _logic select 0) + (random _distance) - (random _distance), (getPos _logic select 1) + (random _distance) - (random _distance), 0];
		
		// player sideChat format ["GLX_Move_F > %1 > Array: %2 > KnowsAbout: %3", _group, (count _units), (_group knowsAbout _unit) ];
	}
	else
	{
		_time = (_time + 5);
		
		if (leader _group in _units) then
		{
			_time = (_time + 5);
			
			private _value = 15;
			
			if (_bool) then
			{
				_value = 35;
			};
			
			if (floor (random 100) < _value) exitWith
			{
				_position = (getPos leader _group);
				
				// player sideChat format ["GLX_Move_F > Leader > %1 > %2", _group, (combatMode _group) ];
			};
			
			_direction = (_unit getDir leader _group);
			
			_direction = (_direction + _random);
			
			// player sideChat format ["GLX_Move_F > Flank > %1 > %2", _group, (combatMode _group) ];
			
			_distance = (_unit distance leader _group);
			
			if (floor (random 100) < 35) then
			{
				if (leader _group distance _unit < 200) then
				{
					_array = (units _group);
					
					if (_units isEqualTo _array) then
					{
						_distance = (_distance + random 30);
						
						// player sideChat format ["GLX_Move_F > Back > %1", _group];
					};
				}
				else
				{
					_distance = (_distance - random 30);
					
					// player sideChat format ["GLX_Move_F > Forward > %1", _group];
				};
			};
			
			_position = [_logic, _distance, _direction] call GLX_Real_Pos_F;
		}
		else
		{
			_count = (count _units);
			
			_value = (_value / _count);
			
			_position = [ (getPos _logic select 0) + (random _value) - (random _value), (getPos _logic select 1) + (random _value) - (random _value), 0];
		};
		
		// player sideChat format ["Stop > %1 > Array: %2 > KnowsAbout: %3", _group, (count _units), (_group knowsAbout _unit) ];
	};
	
	_group move _position;
	
	_icon setPos _position;
	
	_marker setMarkerPos _position;
	
	_group setVariable ["GLX_Move", _position];
	
	(str _group) setMarkerText format ["%1 > %2 > %3 > %4", _group, _unit, _knowsAbout, (leader _group distance _position) ];
};

_time