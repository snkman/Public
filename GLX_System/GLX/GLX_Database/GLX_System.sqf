// ////////////////////////////////////////////////////////////////////////////
// GLX - System Settings
// ////////////////////////////////////////////////////////////////////////////
// System Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_System") then
{
	GLX_System =
	[
		True,
		[EAST, WEST, RESISTANCE]
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_System.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_System.sqf";
		};
	};
};