#include "GLX_Macros.hpp"

/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I Project
 \   \------------------------------------------------------------------------------
  \   \ Reinforcement Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
params ["_enemy","_group","_logic"];

private "_groups";

private _return = objNull;

private _side = (side _group);

private _leader = (leader _group);

private _array = ["GLX_Move","GLX_Reinforcement"];

if (_group in (GLX_Location select 0) ) then
{
	_groups = (_group getVariable "GLX_Location");
	
	_groups = _groups - (GLX_Reinforcement select 0);
	
	_groups = _groups select { (_x in (GLX_Location select 0) ) };
}
else
{
	_groups = (GLX_Groups select 0);;
	
	_groups = _groups - (GLX_Reinforcement select 0);
	
	_groups append (GLX_Join select 0);
};

private _distance = [_group] call (GLX_Radio_F select 0);

private ["_group","_string"];

private _count = 0;

for "_count" from _count to (count _groups - 1) do
{
	_group = (_groups select _count);
	
	if (_leader distance (leader _group) < _distance) then
	{
		if (_side getFriend side _group > 0.6) then
		{
			if (side _enemy getFriend side _group < 0.6) then
			{
				_string = (_group getVariable "GLX_Disable");
				
				if (_string in _array) exitWith {};
				
				_return = _group;
				
				_distance = (_leader distance (leader _group) );
			};
		};
	};
};

if (_return isEqualType grpNull) then
{
	_group = _return;
	
	if (_group in (GLX_Join select 0) ) exitWith
	{
		GLX_DeleteAt(GLX_Join,0,_group);
	};
	
	[_enemy, _group, _logic] spawn (GLX_System_F select 0);
	
	// player sideChat format ["GLX_Reinforcement_F > %1", _group];
};

True