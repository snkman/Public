#include "GLX_Macros.hpp"

GLX_Static_Weapon_F = [
	
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_enemy","_group","_logic"];
	
	private _units = (units _group);
	
	private _array = ( (GLX_Static_Weapon select 0) + (GLX_House_Search select 0) );
	
	_units = _units - _array;
	
	private _leader = (leader _group);
	
	_units deleteAt (_units find _leader);
	
	_units = _units select { ( (alive _x) && { (isNull objectParent _x) } ) };
	
	if (count _units > 1) then
	{
		private _unit = _units select (count _units - 1);
		
		private _vehicle = [_unit, _group, _logic] call (GLX_Static_Weapon_F select 1);
		
		if (alive _vehicle) then
		{
			[_unit, _group, _logic, _vehicle] spawn (GLX_Static_Weapon_F select 2);
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_logic"];
	
	private _return = objNull;
	
	private _leader = (leader _group);
	
	private _objects = _unit nearEntities ["StaticWeapon", 100];
	
	if (_objects isEqualTo [] ) exitWith {_return};
	
	private _array = ( (GLX_Static_Weapon select 1) + (GLX_Static_Weapon select 2) );
	
	_objects = _objects - _array;
	
	_objects = _objects select { ( (alive _x) && { (someAmmo _x) } && { (_unit knowsAbout _x > 0) } && { (_x distance _leader < 100) } ) };
	
	private ["_vehicle","_side","_crew"];
	
	private _count = 0;
	
	for "_count" from _count to (count _objects - 1) do
	{
		_vehicle = (_objects select _count);
		
		_side = False;
		
		if (getNumber (configFile >> "CfgVehicles" >> (typeOf _unit) >> "side") isEqualTo getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side") ) then
		{
			_side = True;
		};
		
		_crew = (crew _vehicle);
		
		if ( (_side) && { (_crew isEqualTo [] ) } ) exitWith
		{
			_return = _vehicle;
		};
	};
	
	_return
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_logic","_vehicle"];
	
	_unit assignAsGunner _vehicle;
	
	_unit doMove (getPos _vehicle);
	
	(GLX_Static_Weapon select 0) pushBack _unit;
	
	(GLX_Static_Weapon select 1) pushBack _vehicle;
	
	[_unit] orderGetIn True; [_unit] allowGetIn True;
	
	// player sideChat format ["GLX_Static_Weapon_F > Vehicle > %1", _vehicle];
	
	private _time = (time + 30);
	
	private _distance = (_unit distance _vehicle);
	
	_time = (_time + _distance);
	
	while { ( (alive _unit) && { (time < _time) } && { (isNull objectParent _unit) } ) } do
	{
		sleep 5;
	};
	
	if ( (alive _unit) && { (time < _time) } && { (_unit == gunner _vehicle) } ) then
	{
		[_unit, _group, _vehicle] spawn (GLX_Static_Weapon_F select 3);
	}
	else
	{
		GLX_DeleteAt(GLX_Static_Weapon,0,_unit);
		
		GLX_DeleteAt(GLX_Static_Weapon,1,_vehicle);
		
		_unit leaveVehicle _vehicle; [_unit] orderGetIn False; [_unit] allowGetIn False;
	};
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_vehicle"];
	
	private _mortar = True;
	
	private _missile = False;
	
	_array = (magazines _unit) select { (_x isKindOf "RocketBase") };
	
	player sideChat str _array;
	
	if (getArray (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "availableForSupportTypes") isEqualTo [] ) then
	{
		_mortar = False;
		
		private _weapons = (weapons _vehicle);
		
		private _magazines = getArray (configfile >> "CfgWeapons" >> (_weapons select 0) >> "magazines");
		
		private _magazine = (_magazines select 0);
		
		private _ammo = getText (configfile >> "CfgMagazines" >> _magazine >> "ammo");
		
		if (_ammo isKindOf "MissileBase") then
		{
			_missile = True;
		};
	};
	
	while { ( (alive _unit) && { (_unit == gunner _vehicle) } ) } do
	{
		if ( (canFire _vehicle) && { (someAmmo _vehicle) } ) then
		{
			if (_mortar) then
			{
				if (_vehicle in (GLX_Static_Weapon select 2) ) exitWith {};
				
				[_unit, _group, _vehicle] spawn (GLX_Mortar_F select 0);
			}
			else
			{
				if (_missile) then
				{
					_weapon = (weapons _vehicle select 0);
					
					// _enemy = (_group getVariable "GLX_Enemy");
					
					// _vehicle fireAtTarget [_enemy, _weapon];
					
					_unit leaveVehicle _vehicle; [_unit] orderGetIn False; [_unit] allowGetIn False;
					
					player sideChat format ["GLX_Static_Weapon_F > Missile > %1 > %2", _unit, _weapon];
				};
			};
		}
		else
		{
			_unit leaveVehicle _vehicle; [_unit] orderGetIn False; [_unit] allowGetIn False;
		};
		
		if (_unit distance leader _group > 100) then
		{
			[_unit, _group, _vehicle] call (GLX_Static_Weapon_F select 4);
		};
		
		if (behaviour leader _group isEqualTo "AWARE") then
		{
			[_unit, _group, _vehicle] call (GLX_Static_Weapon_F select 4);
		};
		
		sleep 5;
	};
	
	if (_unit == gunner _vehicle) then
	{
		_unit leaveVehicle _vehicle; [_unit] orderGetIn False; [_unit] allowGetIn False;
	};
	
	GLX_DeleteAt(GLX_Static_Weapon,0,_unit);
	
	sleep 10 + (random 30);
	
	GLX_DeleteAt(GLX_Static_Weapon,1,_vehicle);
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_group","_vehicle"];
	
	// if (_group in (GLX_Artillery select 0) ) exitWith {};
	
	_unit leaveVehicle _vehicle; [_unit] orderGetIn False; [_unit] allowGetIn False;
	
	True
	
	}
];