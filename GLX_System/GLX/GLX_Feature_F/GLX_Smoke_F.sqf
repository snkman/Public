GLX_Smoke_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Smoke Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Smoke
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group"];
	
	if (floor (random 100) < (GLX_Feature select 0) ) then
	{
		private _units = (units _group);
		
		if (_units findIf { (alive _x) } > -1) then
		{
			private ["_unit","_magazines"];
			
			private _count = 0;
			
			for "_count" from _count to (count _units - 1) do
			{
				_unit = (_units select _count);
				
				_magazines = (magazines _unit);
				
				if ( (alive _unit) && { ("SmokeShell" in _magazines) } ) exitWith
				{
					_unit doWatch (getPos _enemy);
					
					sleep 1 + (random 3);
					
					_unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
				};
			};
		};
	};
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Smoke Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Smoke
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_vehicle"];
	
	if (floor (random 100) < (GLX_Feature select 1) ) then
	{
		private _units = (units _group);
		
		// player sideChat format ["GLX_Smoke_F > Vehicle > %1", _group];
		
		_units = _units select { ( (_x in assignedVehicle _x) && { (assignedVehicleRole _x select 0 == "Cargo") } && { ("SmokeShell" in magazines _x) } ) };
		
		if (_units isEqualTo [] ) exitWith {};
		
		private _velocity = (vectorMagnitude velocity _vehicle) * 3.6;
		
		if (_velocity > 10) then
		{
			sleep 1 + (random 3);
		};
		
		private _direction = (_enemy getDir _vehicle);
		
		private ["_unit","_position","_smoke","_speed","_value","_angle"];
		
		private _random = 1 + (random 3);
		
		private _count = 0;
		
		for "_count" from _count to (count _units - 1) do
		{
			_unit = (_units select _count);
			
			if (_random == 0) exitWith {};
			
			if ( (alive _unit) && { (floor (random 100) < 50) } ) then
			{
				_unit removeMagazines "SmokeShell";
				
				sleep (random 3);
				
				_position = [ (getPos _unit select 0), (getPos _unit select 1), (getPos _unit select 2) + 2];
				
				_smoke = createVehicle ["SmokeShell", _position, [], 0, "NONE"];
				
				_random = _random - 1;
				
				_speed = 7 + (random 3);
				
				_value = 150 + (random 60);
				
				_angle = (_direction - _value);
				
				_smoke setVelocity [ (sin _angle) * _speed, (cos _angle) * _speed, _speed];
			};
		};
	};
	
	}
];