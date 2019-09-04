#include "GLX_Macros.hpp"

GLX_EH_Fired_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler Fired Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler Fired
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit"];
	
	if (False) then
	{
		private _weapon = (currentWeapon _unit);
		
		private _ammo = (_unit ammo _weapon);
		
		_ammo = _ammo + 1;
		
		_unit setAmmo [_weapon, _ammo];
	};
	
	if (isServer) then
	{
		if (GLX_Feature select 6) then
		{
			// if (isPlayer _unit) then
			
			if (_unit in GLX_Players) then
			{
				_this call (GLX_EH_Fired_F select 1);
			};
		};
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler Fired Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler Fired Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{params ["_unit","_weapon","_muzzle"];
	
	if (count (GLX_Advancing select 0) < 5) then
	{
		private _group = (group _unit);
		
		if (_group in (GLX_Advancing select 1) ) exitWith {};
		
		(GLX_Advancing select 1) pushBack _group;
		
		[_group] spawn
		{
			params ["_group"];
			
			sleep 10;
			
			GLX_DeleteAt(GLX_Advancing,1,_group);
		};
		
		private _distance = [_unit, _weapon, _muzzle] call (GLX_Advancing_F select 0);
		
		if (_distance > 0) then
		{
			private _groups = (GLX_Groups select 0);
			
			private _array = ( (GLX_Watch select 0) + (GLX_Advancing select 0) + (GLX_Reinforcement select 0) );
			
			_groups = _groups - _array;
			
			private ["_group","_leader","_string"];
			
			private _count = 0;
			
			for "_count" from _count to (count _groups - 1) do
			{
				_group = (_groups select _count);
				
				_leader = (leader _group);
				
				if (isNull objectParent _leader) then
				{
					_string = (_group getVariable "GLX_Disable");
					
					if (_string isEqualTo "GLX_Init") exitWith {};
					
					[_unit, _group, _distance] call (GLX_Advancing_F select 1);
					
					// player sideChat format ["GLX_EH_Fired_F > Advancing > %1 > %2", _group, _distance];
				};
			};
		};
	};
	
	True
	
	}
];