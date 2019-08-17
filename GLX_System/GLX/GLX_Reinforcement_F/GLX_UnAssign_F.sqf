#include "GLX_Macros.hpp"

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
		[_group] call GLX_Assign_F;
	};
	
	private _array = [];
	
	private _distance = 200;
	
	private _units = (units _group);
	
	private _vehicle = (vehicle leader _group);
	
	if (_vehicle isKindOf "Helicopter") then
	{
		_distance = (_distance + 100);
		
		_array = _units select { ( (assignedVehicleRole _x select 0 == "Cargo") && (backpack _x isEqualTo "B_Parachute") ) };
		
		if (_array isEqualTo [] ) exitWith {};
		
		if (floor (random 100) < 50) exitWith
		{
			_vehicle flyInHeight 200;
		};
		
		_array = [];
	};
	
	private ["_units","_vehicle","_knowsAbout"];
	
	while { (units _group findIf { (alive _x) } > -1) } do
	{
		if ( (_group knowsAbout vehicle _enemy > 0) || (leader _group distance2D _logic < _distance) ) exitWith
		{
			_units = (units _group);
			
			_vehicle = (vehicle leader _group);
			
			GLX_DeleteAt(GLX_Reinforcement,1,_group);
			
			if (isNull objectParent leader _group) then
			{
				_units = _units select { (assignedVehicleRole _x select 0 == "Cargo") };
			}
			else
			{
				if (_vehicle isKindOf "LandVehicle") exitWith
				{
					private _driver = (driver _vehicle);
					
					private _gunner = (gunner _vehicle);
					
					if (alive _gunner) then
					{
						_units = _units select { (assignedVehicleRole _x select 0 == "Cargo") };
					};
					
					[_driver, _gunner, _vehicle] spawn (GLX_UnAssign_F select 1);
				};
				
				if (_vehicle isKindOf "Helicopter") exitWith
				{
					_units = _units select { (assignedVehicleRole _x select 0 == "Cargo") };
					
					if (_array isEqualTo [] ) exitWith {};
					
					private _height = (getPos _vehicle select 2);
					
					if (_height > 100) then
					{
						{moveOut _x; sleep 1 - (random 1) } forEach _array;
					}
					else
					{
						_vehicle land "GET OUT";
					};
					
					while { (True) } do
					{
						if (_array findIf { (_x in _vehicle) } == -1) exitWith {};
						
						sleep 5;
					};
					
					_vehicle flyInHeight 100;
				};
			};
			
			_units allowGetIn False;
			
			_knowsAbout = (_group knowsAbout vehicle _enemy);
			
			if (_knowsAbout > 0) then
			{
				if (isNull objectParent leader _group) then
				{
					if (call GLX_DayTime_F) exitWith
					{
						[_enemy, _group] spawn (GLX_Smoke_F select 0);
					};
					
					[_enemy, _group, _logic] spawn (GLX_Flare_F select 0);
				}
				else
				{
					[_enemy, _group, _vehicle] spawn (GLX_Smoke_F select 1);
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
	{params ["_driver","_gunner","_vehicle"];
	
	_driver forceSpeed 0;
	
	sleep 10;
	
	_driver forceSpeed -1;
	
	if (alive _gunner) then
	{
		while { ( (alive _gunner) && { (_gunner in _vehicle) } && { (someAmmo _vehicle) } && { (canFire _vehicle) } ) } do
		{
			sleep 10;
		};
		
		[_driver] allowGetIn False;
		
		if (alive _gunner) then
		{
			[_gunner] allowGetIn False;
		};
	};
	
	}
];