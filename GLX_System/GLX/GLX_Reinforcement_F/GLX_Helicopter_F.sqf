GLX_Helicopter_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group","_vehicle"];
	
	if (_vehicle isKindOf "Helicopter") then
	{
		_vehicle land "GET OUT";
	};
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group","_vehicle"];
	
	if (_vehicle isKindOf "Helicopter") then
	{
		if (False) then
		{
			_unit = objNull;
			
			_units = (units _group);
			
			_units = _units - (crew _vehicle);
			
			_unit = (_units select 0);
			
			_vehicle doMove (getPos _unit);
		};
		
		while { (alive _vehicle) } do
		{
			if (unitReady _vehicle) exitWith
			{
				_vehicle land "LAND";
			};
			
			sleep 5;
		};
	};
	
	}
];