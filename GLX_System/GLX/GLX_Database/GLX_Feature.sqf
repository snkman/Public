// ////////////////////////////////////////////////////////////////////////////
// GLX - Feature Settings
// ////////////////////////////////////////////////////////////////////////////
// Feature Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Feature") then
{
	GLX_Feature =
	[
		50,
		75,
		50,
		35,
		15
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Feature.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_Feature.sqf";
		};
	};
};