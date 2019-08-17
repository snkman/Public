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
				
				[_logic, "colorRed"] call (Marker_F select 0);
			}
			else
			{
				_logic = (_unit getVariable "Logic");
				
				(GLX_Join select 0) pushBack _group;
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
	
	private _time = 0;
	
	private _delay = 0;
	
	private _value = 100;
	
	private _position = (getPos _logic);
	
	// private _random = (random 15 - random 30);
	
	private _random = selectRandom [3, -3, 5, -5, 7, -7, 13, -13];
	
	private _marker = [_group, "colorWhite"] call (Marker_F select 0);
	
	private _icon = createVehicle ["Sign_Arrow_Large_Pink_F", _position, [], 0, "CAN_COLLIDE"];
	
	// player sideChat format ["Move_F > Random > %1 > %2", _group, _random];
	
	private ["_array","_unit","_knowsAbout","_distance"];
	
	while { (True) } do
	{
		_array = [];
		
		_unit = [_unit, _group] call Enemy_F;
		
		_knowsAbout = (_group knowsAbout vehicle _unit);
		
		if (_knowsAbout > 0) then
		{
			if (alive _unit) then
			{
				_array = [_unit, _group] call Visible_F;
			};
			
			if (_array findIf { (alive _x) } > -1) then
			{
				_logic setPos (getPos _unit);
				
				(str _logic) setMarkerPos (getPos _logic);
			};
			
			if (_delay == 0) then
			{
				_delay = (time + 30);
			};
			
			if (time > _delay) then
			{
				_delay = 0;
				
				[_unit, _group, _logic] call Reinforcement_F;
			};
			
			[_unit, _group, _array] call (GLX_Take_Cover_F select 0);
		};
		
		if (time > _time) then
		{
			_time = [_unit, _group, _logic] call Move_F;
		};
		
		sleep 5;
	};
	
	}
];