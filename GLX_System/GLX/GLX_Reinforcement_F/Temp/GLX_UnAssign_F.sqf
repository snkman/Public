GLX_UnAssign_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// UnAssign Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// UnAssign
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	if (_group knowsAbout vehicle _enemy == 0) then
	{
		_leader = (leader _group);
		
		if (isNull objectParent _leader) then
		{
			_objects = _leader nearEntities ["Car", 100];
			
			_objects = _objects select { ( (alive _x) && { (fuel _x > 0) } && { (canMove _x) } && { (crew _x isEqualTo [] ) } && { (_leader knowsAbout _x > 0) } ) };
			
			if (_objects isEqualTo [] ) exitWith {};
			
			_units = (units _group);
			
			_vehicle = (_objects select 0);
			
			_leader assignAsDriver _vehicle;
			
			_units deleteAt (_units find _leader);
			
			if (_vehicle emptyPositions "Gunner" > 0) then
			{
				_unit = (_units select 0);
				
				_unit assignAsGunner _vehicle;
				
				_units deleteAt (_units find _unit);
			};
			
			{_x assignAsCargo _vehicle} forEach _units;
		};
	};
	
	while { (units _group findIf { (alive _x) } > -1) } do
	{
		if ( (_group knowsAbout vehicle _enemy > 0) || (leader _group distance2D _logic < 200) ) exitWith
		{
			_units = (units _group);
			
			if (isNull objectParent leader _group) then
			{
				_units = _units select { (assignedVehicleRole _x select 0 == "Cargo") };
			}
			else
			{
				_vehicle = (vehicle leader _group);
				
				_gunner = (gunner vehicle leader _group);
				
				if ( (alive _gunner) || (vehicle leader _group isKindOf "Air") ) then
				{
					_units = _units select { (assignedVehicleRole _x select 0 == "Cargo") };
					
					_driver = (driver vehicle leader _group);
					
					if ( (alive _driver) && { (alive _gunner) } ) then
					{
						[_driver, _gunner] spawn (GLX_UnAssign_F select 1);
					};
					
					if (vehicle leader _group isKindOf "Helicopter") then
					{
						if (floor (random 100) < 50) then
						{
							_array = _units select { (backpack _x isEqualTo "B_Parachute") };
							
							{_x action ["EJECT", vehicle leader _group]; sleep 1 - (random 1) } forEach _array;
						};
					};
				};
			};
			
			_units allowGetIn False;
			
			private _knowledge = (_group knowsAbout vehicle _enemy);
			
			if (_knowledge > 0) then
			{
				if (isNull objectParent leader _group) then
				{
					[_enemy, _group] call (GLX_Smoke_F select 0);
				}
				else
				{
					[_enemy, _group, vehicle leader _group] call (GLX_Smoke_F select 1);
				};
			};
		};
		
		_enemy = [_enemy, _group] call GLX_Enemy_F;
		
		sleep 1;
	};
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// UnAssign Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// UnAssign
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_driver","_gunner"];
	
	_driver forceSpeed 0;
	
	sleep 10;
	
	_driver forceSpeed -1;
	
	while { (alive _gunner) } do
	{
		sleep 10;
	};
	
	[_driver] allowGetIn False;
	
	}
];