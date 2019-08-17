GLX_Flare_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Flare Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Flare
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	private _units = (units _group);
	
	if ( (floor (random 100) < (GLX_Feature select 2) ) || ( { (_units findIf { ( (alive _x) && (hmd _x isEqualTo "") ) } > -1) } ) ) then
	{
		private ["_unit","_muzzle"];
		
		private _count = 0;
		
		for "_count" from _count to (count _units - 1) do
		{
			_unit = (_units select _count);
			
			_muzzle = getArray (configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "muzzles");
			
			if ( (alive _unit) && (count _muzzle == 2) ) exitWith
			{
				private _magazines = [];
				
				private _array = ["1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell"];
				
				{if ( (_x in _array) || (currentMagazine _unit in _array) ) then {_magazines pushBack _x; _unit removeMagazine _x} } forEach magazines _unit;
				
				sleep 5 + (random 15);
				
				private ["_random","_direction","_range","_distance","_flare"];
				
				private _count = 3 + (random 5);
				
				if (isNil { (_unit getVariable "GLX_Flare") } ) then
				{
					_unit setVariable ["GLX_Flare", _count];
				}
				else
				{
					_count = (_unit getVariable "GLX_Flare");
				};
				
				while { ( (alive _unit) && { (alive _logic) } && { (_count > 0) } ) } do
				{
					if (_unit distance _logic < 200) then
					{
						_random = 30 - (random 50);
						
						_direction = (_unit getDir _enemy);
						
						_range = (_direction + _random);
						
						_distance = 130 + (random 50);
						
						if (_unit distance _logic < _distance) then
						{
							_distance = (_unit distance _logic);
							
							_distance = (_distance + _random);
						};
						
						_flare = "F_40mm_White" createVehicle [ (getPos _unit select 0) + (_distance * sin _range), (getPos _unit select 1) + (_distance * cos _range), 70 + (random 70) ];
						
						_flare setVelocity [0,0,-0.3];
						
						_count = _count - 1;
						
						_unit setVariable ["GLX_Flare", _count];
					};
					
					sleep 30 + (random 50);
				};
				
				if (alive _unit) then
				{
					{_unit addMagazine _x} count _magazines;
				};
			};
		};
	};
	
	}
];