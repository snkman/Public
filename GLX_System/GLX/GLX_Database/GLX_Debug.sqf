// ////////////////////////////////////////////////////////////////////////////
// GLX - Debug Settings
// ////////////////////////////////////////////////////////////////////////////
// Debug Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Debug") then
{
	GLX_Debug =
	[
		False,
		False,
		False
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Debug.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_Debug.sqf";
		};
	};
};