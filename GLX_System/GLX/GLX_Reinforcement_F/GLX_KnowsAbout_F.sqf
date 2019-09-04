GLX_KnowsAbout_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// KnowsAbout
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group"];
	
	private _units = allUnits;
	
	private _side = (side _group);
	
	private _leader = (leader _group);
	
	// _units = [_group] call (GLX_KnowsAbout_F select 1);
	
	_units = _units select { ( [_x, _group] call (GLX_KnowsAbout_F select 1) ) };
	
	// _units = _units select { ( (alive _x) && { (_group knowsAbout vehicle _x > 0) } ) };
	
	// _units = _units select {_knowledge = (_leader targetKnowledge vehicle _x) select 2; ( (alive _x) && { (_knowledge > 0) } ) };
	
	private ["_unit","_logic"];
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		if (side _unit getFriend _side < 0.6) exitWith
		{
			_logic = [_unit, _group] call (GLX_Logic_F select 0);
			
			// [_unit, _group, _logic] spawn (GLX_System_F select 0);
			
			[_unit, _group, _logic] execFSM (GLX_Path+"GLX\GLX_ExecFSM\GLX_System.fsm");
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
	{params ["_enemy","_group"];
	
	private _return = False;
	
	if (alive _enemy) then
	{
		private _units = (units _group);
		
		private ["_unit","_knowledge"];
		
		private _count = 0;
		
		for "_count" from _count to (count _units - 1) do
		{
			_unit = (_units select _count);
			
			_knowledge = (_unit targetKnowledge vehicle _enemy) select 2;
			
			if (_knowledge > 0) exitWith
			{
				_return = True;
			};
		};
		
		// player sideChat format ["GLX_KnowsAbout_F > %1 > %2 > %3 > %4", _group, _unit, _knowledge, _return];
	};
	
	_return
	
	}
];