// ////////////////////////////////////////////////////////////////////////////
// GLX - Radio Settings
// ////////////////////////////////////////////////////////////////////////////
// Radio Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Radio") then
{
	GLX_Radio =
	[
		30,
		[1000, 3000, 5000, 7000]
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Radio.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_Radio.sqf";
		};
	};
};