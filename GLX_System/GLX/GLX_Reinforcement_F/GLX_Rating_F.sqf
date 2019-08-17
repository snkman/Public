GLX_Rating_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Rating Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Rating
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group"];
	
	private _rating = [];
	
	private _units = (units _group);
	
	private _array = (units _enemy) select { ( (alive _x) && { (_group knowsAbout vehicle _x > 0) } ) };
	
	{_rating = [_x, _rating] call (GLX_Rating_F select 1) } count [_array, _units];
	
	private _return = [_rating] call (GLX_Rating_F select 2);
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Rating Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Rating
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_units","_rating"];
	
	private _array = [];
	
	private _value = 0.01;
	
	private ["_unit","_vehicle"];
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		if (alive _unit) then
		{
			if ( (weapons _unit isEqualTo [] ) || (magazines _unit isEqualTo [] ) ) exitWith {};
			
			_value = _value + 1;
			
			_array pushBack _unit;
		};
		
		_vehicle = (vehicle _unit);
		
		if (_vehicle in _array) then
		{
			_array = _array;
		}
		else
		{
			_array pushBack _vehicle;
			
			if ( (canFire _vehicle) && { (someAmmo _vehicle) } ) then
			{
				if (_vehicle isKindOf "Car") exitWith
				{
					_value = _value + 5;
				};
				
				if (_vehicle isKindOf "Tank") exitWith
				{
					_value = _value + 10;
				};
				
				if (_vehicle isKindOf "Air") exitWith
				{
					_value = _value + 15;
				};
				
				if (_vehicle isKindOf "Ship") exitWith
				{
					_value = _value + 15;
				};
				
				_value = _value + 1;
			};
		};
	};
	
	_rating pushBack _value;
	
	_rating
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Rating Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Rating
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_array"];
	
	private _return = False;
	
	private _value = (GLX_AI select 1);
	
	private _rating = ( (_array select 0) / (_array select 1) );
	
	_rating = (_rating + 0.01) / 2;
	
	if (_rating > 1) then {_rating = 1};
	
	if (_rating > _value) then
	{
		_return = True;
	};
	
	_return
	
	}
];