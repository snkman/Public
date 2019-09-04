/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ Trigger Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
params ["_group","_array","_objects"];

_objects = _objects select { (_x isKindOf "EmptyDetector") };

if (True) then
{
	if (_objects isEqualTo [] ) exitWith {};
	
	private ["_object","_type"];
	
	private _count = 0;
	
	for "_count" from _count to (count _objects - 1) do
	{
		_object = (_objects select _count);
		
		if (triggerText _object in _array) exitWith
		{
			_type = (triggerText _object);
			
			_group setVariable ["GLX_Disable", _type];
		};
	};
};

True