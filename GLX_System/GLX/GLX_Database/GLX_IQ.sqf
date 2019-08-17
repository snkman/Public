// ////////////////////////////////////////////////////////////////////////////
// GLX - I.Q. Settings
// ////////////////////////////////////////////////////////////////////////////
// I.Q. Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_IQ") then
{
	GLX_IQ =
	[
		3
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_IQ.sqf" call GLX_Exist_F) then
		{
			call compile preprocessFileLineNumbers "UserConfig\GLX\GLX_IQ.sqf";
		};
	};
};