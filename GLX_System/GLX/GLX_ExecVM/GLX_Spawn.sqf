/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ Spawn Script
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
private ["_array","_bool","_groups"];

_array = [];

_bool = False;

while { (True) } do
{
	_groups = (allGroups - _array);
	
	if (True) then
	{
		if (_groups isEqualTo [] ) exitWith {};
		
		_array append _groups;
		
		if (_bool) then
		{
			[_groups, _bool] spawn GLX_Spawn_F;
		}
		else
		{
			[_groups, _bool] call GLX_Spawn_F;
			
			_bool = True;
		};
	};
	
	sleep 5;
};
		
		
	
	