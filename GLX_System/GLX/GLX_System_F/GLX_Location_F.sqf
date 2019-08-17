/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ Location Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
params ["_group","_units"];

private _array = _units select { (side _x isEqualTo sideLogic) };

_units = _units - _array;

if (True) then
{
	if (_units isEqualTo [] ) exitWith {};
	
	_array = [];
	
	private "_unit";
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		_array pushBack (group _unit);
	};
	
	_array pushBack _group;
	
	(GLX_Location select 0) append _array;
	
	_group setVariable ["GLX_Location", _array];
};

True