/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I. Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ KnowsAbout Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
params ["_group"];

private _units = allUnits;

private _side = (side _group);

_units = _units select { ( (alive _x) && { (_group knowsAbout vehicle _x > 0) } ) };

private ["_unit","_logic"];

private _count = 0;

for "_count" from _count to (count _units - 1) do
{
	_unit = (_units select _count);
	
	if (side _unit getFriend _side < 0.6) exitWith
	{
		_logic = [_unit, _group] call (GLX_Logic_F select 0);
		
		[_unit, _group, _logic] spawn (GLX_System_F select 0);
	};
};

True