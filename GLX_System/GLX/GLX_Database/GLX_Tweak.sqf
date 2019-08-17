// ////////////////////////////////////////////////////////////////////////////
// GLX - Tweak Settings
// ////////////////////////////////////////////////////////////////////////////
// Tweak Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Tweak") then
{
	GLX_Tweak =
	[
		[5, 10, 15, 10, 5]
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Tweak.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_Tweak.sqf";
		};
	};
};