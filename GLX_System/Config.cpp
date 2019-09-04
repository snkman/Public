// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - System Config
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class GLX_System
	{
		units[] = {};
		weapons[] = {};
		version = "1.0.11";
		requiredVersion = 1.82;
		versionDesc = "Group Link - X";
		requiredAddons[] = {"A3_Data_F","A3_Characters_F"};
	};
};

class CfgMods
{
	class GLX_Mods
	{
		dir = "@GLX";
		tooltip = "GLX";
		author = "=\SNKMAN/=";
		name = "Group Link - X";
		picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
		action = "https://forums.bohemia.net/forums/topic/224903-group-link-x-test-wip/";
		overview = "Group Link - X is a highly dynamic A.I. improvement and enhancement modification for ARMA 3.";
	};
};

class GLX_Path
{
	// ///////////// PBO ////////////////
	// GLX_Root = "\GLX_System\";
	// /////////////////////////////////////

	// ///////////// Script ////////////////
	GLX_Root = "\@GLX\AddOns\GLX_System\";
	// ///////////////////////////////////////
};

#define GLX_EH_System "if (isNil 'GLX_Path') then {GLX_Path = getText (configFile >> 'GLX_Path' >> 'GLX_Root'); execVM (GLX_Path+'GLX_Initialize.sqf') }";

class CfgVehicles
{
	class Man;
	class Land;
	
	class CAManBase : Man
	{
		class EventHandlers
		{
			class GLX_EH_Init
			{
				init = GLX_EH_System
			};
		};
	};
};

class RscText;

class RscStandardDisplay;

class RscDisplayMain : RscStandardDisplay
{
	class controls
	{
		class GLX_System_RscDisplayMain : RscText
		{
			style = 0x01 + 0x100;

			sizeEx = 0.05;

			x = "(SafeZoneH + SafeZoneX) - (1 - 0.45)";
			y = "(SafeZoneH + SafeZoneY) - (1 - 0.83)";

			w = 0.5;
			h = 0.05;

			text = "Group Link - X";
		};

		class GLX_Version_RscDisplayMain : GLX_System_RscDisplayMain
		{
			sizeEx = 0.03;

			colortext[] = {1.0, 0.0, 0.0, 1.0};

			x = "(SafeZoneH + SafeZoneX) - (1 - 0.45)";
			y = "(SafeZoneH + SafeZoneY) - (1 - 0.88)";

			text = "Version: 1.0.11 W.I.P.";
		};
	};
};

class CfgAddOns
{
	class PreloadBanks {};
	
	class PreloadAddOns
	{
		class GLX_System
		{
			list[] = {"GLX_System"};
		};
	};
};