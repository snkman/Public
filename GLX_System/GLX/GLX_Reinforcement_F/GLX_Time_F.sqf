GLX_Time_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Time Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Time
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group","_logic"];
	
	private _return = False;
	
	private _time = (_logic getVariable "GLX_Time");
	
	if (time > _time) then
	{
		_return = True;
	}
	else
	{
		if (_group in (GLX_Join select 0) ) then
		{
			_time = (_group getVariable "GLX_Time");
			
			if (time > _time) then 
			{
				_return = True;
			};
		};
	};
	
	if (GLX_Debug select 0) then
	{
		(str _logic) setMarkerText format ["%1 > %2", _groups, (_time - time) ];
	};
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Time Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Time
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group","_logic"];
	
	private _time = time;
	
	_time = _time + (GLX_AI select 3);
	
	_group setVariable ["GLX_Time", _time];
	
	_logic setVariable ["GLX_Time", _time];
	
	True
	
	}
];