/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - Initialize Script
 \   \------------------------------------------------------------------------------
  \   \ Initialize Script
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////

private _bool = False;

if (is3DEN) exitWith {};

if (isServer) then
{
	_bool = True;
}
else
{
	if (hasInterface) exitWith {};
	
	_bool = True;
};

GLX_FilePatching = False;

if (isFilePatchingEnabled) then
{
	GLX_FilePatching = True;
};

if (_bool) then
{
	_bool = False;
	
	GLX_Join = [ [] ];
	
	GLX_Move = [ [] ];
	
	GLX_Logic = [ [] ];
	
	GLX_Groups = [ [] ];
	
	GLX_Location = [ [] ];
	
	GLX_Take_Cover = [ [], [] ];
	
	GLX_House_Search = [ [], [] ];
	
	GLX_Reinforcement = [ [], [] ];
	
	call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Debug_F\GLX_Debug_F.sqf");
	
	call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Debug_F\GLX_Header_F.sqf");
	
	if (isNil "GLX_Initialize") then
	{
		_bool = True;
		
		GLX_Initialize = True;
		
		["Initialize", "Done"] call (GLX_Debug_F select 0);
	}
	else
	{
		if (GLX_Initialize) exitWith
		{
			_bool = True;
		};
		
		["Initialize", "Disabled"] call (GLX_Debug_F select 0);
	};
	
	if (_bool) then
	{
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Extension_F.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_AI.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_IQ.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_Radio.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_Debug.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_Tweak.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_System.sqf");
		
		call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Database\GLX_Feature.sqf");
		
		if (GLX_System select 0) exitWith
		{
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_EH_F\GLX_EH_Fired_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Debug_F\GLX_Marker_F.sqf");
		
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Feature_F\GLX_Smoke_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Feature_F\GLX_Flare_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Feature_F\GLX_Take_Cover_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Feature_F\GLX_House_Search_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Time_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Move_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Logic_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Radio_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_System_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Rating_F.sqf");
			
			call compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_UnAssign_F.sqf");
			
			GLX_Location_F = compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_System_F\GLX_Location_F.sqf");
			
			GLX_KnowsAbout_F = compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_KnowsAbout_F.sqf");
			
			GLX_Reinforcement_F = compile preprocessFileLineNumbers (GLX_Path+"GLX\GLX_Reinforcement_F\GLX_Reinforcement_F.sqf");
			
			if (GLX_Debug select 2) then
			{
				["Cursor","Debug"] spawn (GLX_Debug_F select 1);
			};
			
			execVM (GLX_Path+"GLX\GLX_ExecVM\GLX_Spawn.sqf");
			
			execVM (GLX_Path+"GLX\GLX_ExecVM\GLX_KnowsAbout.sqf");
		};
		
		["Initialize", "Disabled"] call (GLX_Debug_F select 0);
	};
};