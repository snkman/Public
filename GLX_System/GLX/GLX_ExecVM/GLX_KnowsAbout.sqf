/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX- A.I Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ KnowsAbout Script
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
private ["_groups","_count","_group","_string"];

while { (True) } do
{
	_groups = (GLX_Groups select 0);
	
	_groups = _groups - (GLX_Reinforcement select 0);
	
	_count = 0;
	
	for "_count" from _count to (count _groups - 1) do
	{
		_group = (_groups select _count);
		
		if (units _group findIf { (alive _x) } > -1) then
		{
			_string = (_group getVariable "GLX_Disable");
			
			if (_string isEqualTo "GLX_Init") exitWith {};
			
			[_group] call GLX_KnowsAbout_F;
		};
	};
	
	sleep 1;
};