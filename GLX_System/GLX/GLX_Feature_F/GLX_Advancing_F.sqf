#include "GLX_Macros.hpp"

GLX_Advancing_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_object","_weapon","_muzzle"];
	
	private _return = 0;
	
	private _array = ["Throw","Put"];
	
	private _value = (GLX_Feature select 7);
	
	if (_weapon in _array) exitWith {_return};
	
	private _type = {_weapon isKindOf [_this, configFile >> "CfgWeapons"] };
	
	if ( ("Pistol" call _type) || ("Rifle" call _type) ) then
	{
		private _muzzle = (currentMuzzle _object);
		
		if (_weapon isEqualTo _muzzle) exitWith
		{
			private _accessories = (_object weaponAccessories _muzzle);
			
			private _suppressor = (_accessories select 0);
			
			if (_suppressor isEqualTo "") exitWith
			{
				_return = (_value select 3);
			};
			
			_return = (_value select 0);
		};
		
		_return = (_value select 1);
	}
	else
	{
		if ("Launcher" call _type) exitWith
		{
			_return = (_value select 2);
		};
		
		_return = (_value select 3);
	};
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_object","_group","_value"];
	
	private _leader = (leader _group);
	
	if (_group knowsAbout vehicle _object == 0) then
	{
		private _distance = (_object distance _leader);
		
		if (_distance < _value) then
		{
			[_object, _group, _distance] spawn (GLX_Advancing_F select 2);
			
			// player sideChat format ["GLX_Advancing_F > Group > %1", _group];
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_object","_group","_distance"];
	
	// private _array = (GLX_Move select 0);
	
	// if (_group in _array) exitWith
	
	private _string = (_group getVariable "GLX_Disable");
	
	if (_string isEqualTo "GLX_Move") exitWith
	{
		[_object, _group, _distance] spawn (GLX_Advancing_F select 3);
	};
	
	// if (True) then
	
	if ( (floor (random 100) < 35) && { (_distance > 100) } && { (_distance < 300) } && { (_group knowsAbout vehicle _object == 0) } ) exitWith
	{
		private _units = (units _group);
		
		private _leader = (leader _group);
		
		private _behaviour = (behaviour _leader);
		private _speedMode = (speedMode _leader);
		
		_units select { ( (_x == _leader) || (floor (random 100) < 50) ) } apply {_x doWatch (getPos _object) };
		
		if (_distance > 300) then
		{
			if (_leader hasWeapon "Binocular") then
			{
				_leader selectWeapon "Binocular";
				
				sleep 5 + (random 10);
				
				_leader selectWeapon (primaryWeapon _leader);
			};
		};
		
		if (_group knowsAbout vehicle _object == 0) then
		{
			_group setBehaviour "AWARE";
			_group setSpeedMode "NORMAL";
			
			if (floor (random 100) < 50) then
			{
				_group setSpeedMode "FULL";
			};
			
			(GLX_Advancing select 0) pushBack _group;
			
			private _position = [ (getPos _object select 0) + (random 50 - random 50), (getPos _object select 1) + (random 50 - random 50), 0];
			
			_group move _position;
			
			private _bool = True;
			
			private _count = (random 50);
			
			while { (_count > 0) } do
			{
				if ( (_group in (GLX_Reinforcement select 0) ) || ( (alive _object) && { (_group knowsAbout vehicle _object > 0) } ) ) exitWith
				{
					_bool = False;
				};
				
				_count = _count - 1;
				
				sleep 1;
			};
			
			GLX_DeleteAt(GLX_Advancing,0,_group);
			
			if (_bool) then
			{
				_group move (getPos _leader);
				
				sleep 10 + (random 30);
			};
		};
		
		if (_group in (GLX_Reinforcement select 0) ) exitWith {};
		
		_group setBehaviour _behaviour;
		_group setSpeedMode _speedMode;
		
		if (count waypoints _group == 1) then
		{
			private _position = waypointPosition [_group, 0];
			
			private _value = 50;
			
			if ( (alive _object) && { (_group knowsAbout vehicle _object > 0) } && { (side _group getFriend side _object > 0.6) } )then
			{
				private _random = (random 50);
				
				_value = (_value + _random);
			};
			
			if (floor (random 100) < _value) then
			{
				_group move _position;
			};
		};
	};
	
	[_object, _group, _distance] spawn (GLX_Advancing_F select 3);
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_object","_group","_distance"];
	
	sleep (random 1);
	
	private _units = (units _group);
	
	private _leader = (leader _group);
	
	(GLX_Watch select 0) pushBack _group;
	
	{if ( (floor (random 100) < 5) && { (alive _object) } ) then {_x setUnitPos "DOWN"} else {if (floor (random 100) < 15) then {_x setUnitPos "MIDDLE"} } } count _units;
	
	_units select { ( (_x == _leader) || (floor (random 100) < 50) ) } apply {_x doWatch (getPos _object) };
	
	if (_distance > 300) then
	{
		if (_leader hasWeapon "Binocular") then
		{
			_leader selectWeapon "Binocular";
			
			sleep 5 + (random 10);
			
			_leader selectWeapon (primaryWeapon _leader);
		};
	};
	
	sleep (random 10);
	
	GLX_DeleteAt(GLX_Watch,0,_group);
	
	{_x setUnitPos "AUTO"} count _units;
	
	if (_group in (GLX_Reinforcement select 0) ) exitWith {};
	
	if (_distance < 100) then
	{
		_units deleteAt (_units find _leader);
		
		_units select { (floor (random 100) < 50) } apply {_x doMove [ (getPos _object select 0) + (random 50 - random 50), (getPos _object select 1) + (random 50 - random 50), 0] };
	};
	
	}
];