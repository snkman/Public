GLX_Logic_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Logic Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Logic
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group"];
	
	private _logic = [_enemy, _group] call (GLX_Logic_F select 1);
	
	if (alive _logic) then
	{
		(GLX_Join select 0) pushBack _group;
	}
	else
	{
		private _side = createCenter sideLogic;
		
		private _group = createGroup _side;
		
		_logic = _group createUnit ["Logic", (getPos _enemy), [], 0, "NONE"];
		
		private _time = time;
		
		[_logic] join _group;
		
		_logic allowDamage False;
		
		_time = _time + (GLX_AI select 3);
		
		(GLX_Logic select 0) pushBack _logic;
		
		_logic setVariable ["GLX_Time", _time];
		
		_logic setVariable ["GLX_Reinforcement", [] ];
		
		_logic setVariable ["GLX_Enemy", (group _enemy) ];
		
		if (GLX_Debug select 0) then
		{
			[_logic, "colorRed"] call (GLX_Marker_F select 0);
		};
		
		_logic setVariable ["GLX_Random", [1, -1] ];
		
		// _logic setVariable ["GLX_Random", [5, -5, 7, -7, 13, -13, 15, -15] ];
		
		// player sideChat format ["GLX_Logic_F > Logic > %1 > %2", _group, _logic];
	};
	
	_logic
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Logic Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Logic
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group"];
	
	private _return = objNull;
	
	private _array = (GLX_Logic select 0);
	
	private "_logic";
	
	private _count = 0;
	
	for "_count" from _count to (count _array - 1) do
	{
		_logic = (_array select _count);
		
		if ( (group _enemy) isEqualTo (_logic getVariable "GLX_Enemy") ) exitWith
		{
			_return = _logic;
		};
	};
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Logic Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Logic
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group","_logic","_random"];
	
	private _array = [1];
	
	// private _array = [5, 7, 13, 15];
	
	private _string = (_group getVariable "GLX_Disable");
	
	if (_string isEqualTo "GLX_Move") then
	{
		if (_random < 0) then
		{
			_array = [-1];
			
			// _array = [-5, -7, -13, -15];
		};
		
		(GLX_Move select 0) pushBack _group;
	}
	else
	{
		if (_random > 0) then
		{
			_array = [-1];
			
			// _array = [-5, -7, -13, -15];
		};
	};
	
	_logic setVariable ["GLX_Random", _array];
	
	True
	
	}
];