GLX_Marker_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Marker Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Marker
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_object","_color"];
	
	private _marker = format ["%1", _object];
	
	if (getMarkerPos _marker isEqualTo [0,0,0] ) then
	{
		_marker = createMarker [_marker, [0,0,0] ];
		
		_marker setMarkerSize [1,1];
		
		_marker setMarkerText _marker;
		
		_marker setMarkerColor _color;
		
		_marker setMarkerShape "Icon";
		
		_marker setMarkerType "mil_dot";
	};
	
	_marker
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Marker Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Marker
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit"];
	
	_string = str _unit;
	
	_marker = createMarker [_string, (getPos _unit) ];
	
	_marker setMarkerShape "Icon";
	
	_marker setMarkerSize [1,1];
	
	_marker setMarkerType "mil_triangle";
	
	_marker setMarkerColor "colorYellow";
	
	while { (alive _unit) } do
	{
		_type = "I.d.l.e.";
		
		_marker setMarkerPos (getPos _unit);
		
		_marker setMarkerDir (getDir _unit);
		
		if (behaviour _unit isEqualTo "AWARE") then
		{
			_type = "AWARE";
			
			_marker setMarkerColor "colorGreen";
		}
		else
		{
			_type = "COMBAT";
			
			_marker setMarkerColor "colorYellow";
		};
		
		if (True) then
		{
			if (group _unit in (GLX_Join select 0) ) exitWith
			{
				_type = "Joined";
			};
			
			if (group _unit in (GLX_Location select 0) ) then
			{
				// _type = "Location";
			};
			
			if (group _unit in (GLX_Reinforcement select 0) ) then
			{
				_type = "Request";
				
				if (group _unit in (GLX_Reinforcement select 1) ) then
				{
					_type = "Requested";
				};
			};
		};
		
		if (group _unit in (GLX_Location select 0) ) then
		{
			_type = _type + " > Location";
		};
		
		if (_unit in (GLX_House_Search select 0) ) then
		{
			_type = "House Search";
		};
		
		if (_unit == leader _unit) then
		{
			_marker setMarkerColor "colorRed";
			
			_string = format ["%1 > %2 > %3 > %4 > %5 > %6 > %7 > %8", _type, _unit, (side _unit), (behaviour _unit), (combatMode _unit), (speedMode _unit), (currentCommand _unit), (assignedTarget _unit) ];
		}
		else
		{
			_string = format ["%1 > %2 > %3 > %4 > %5", _type, _unit, (side _unit), (currentCommand _unit), (assignedTarget _unit) ];
		};
		
		if (unitReady _unit) then
		{
			_string = _string + "> Ready";
		};
		
		if (side _unit == CIVILIAN) then
		{
			_marker setMarkerColor "colorWhite";
		};
		
		if (isPlayer _unit) then
		{
			_marker setMarkerColor "colorBlue";
		};
		
		_marker setMarkerText _string;
		
		sleep 1;
	};
	
	_marker setMarkerColor "colorGrey";
	
	_marker setMarkerText format ["%1", _unit];
	
	}
];