GLX_Radio_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Radio Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Radio
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_group"];
	
	private _distance = 0;
	
	if (units _group findIf { ( (alive _x) && ( ("ItemRadio" in assignedItems _x) ) ) } > -1) then
	{
		private _index = 0;
		
		private _array = (GLX_Radio select 1);
		
		private _vehicle = (vehicle leader _group);
		
		if (True) then
		{
			if (_vehicle isKindOf "Car") exitWith
			{
				_index = 1;
			};
			
			if (_vehicle isKindOf "Tank") exitWith
			{
				_index = 2;
			};
			
			if (_vehicle isKindOf "Air") exitWith
			{
				_index = 3;
			};
		};
		
		_distance = (_array select _index);
	};
	
	_distance
	
	}
];