GLX_Debug_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Debug Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Debug
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_array"];
	
	_array = _this;
	
	if (GLX_Debug select 0) then
	{
		private _header = _array call (GLX_Header_F select 0);
		
		private _text = "<t size='1.3'> <t color='#0000ff'>Sctipt Based</t> <t color='#bebebe'></t></t>";
		
		if (GLX_Path isEqualTo "\GLX_System\") then
		{
			_text = "<t size='1.3'> <t color='#0000ff'>AddOn Based</t> <t color='#bebebe'></t></t>";
		};
		
		_string = parseText (_header + _text);
		
		hint _string;
	};
	
	True
	
	},
	
	// ////////////////////////////////////////////////////////////////////////////
	// Debug Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Debug
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{
	
	private _header = _this call (GLX_Header_F select 0);
	
	private _text = format ["<t color='#bebebe'>Server:</t> %1<br/><t color='#bebebe'>Multiplayer:</t> %2<br/><t color='#bebebe'>Dedicated:</t> %3", isServer, isMultiplayer, isDedicated];
	
	private ["_object","_group","_string","_knowledge","_enemy"];
	
	while { (True) } do
	{
		_object = cursorTarget;
		
		if (alive _object) then
		{
			_group = (group _object);
			
			if (isNull _group) then
			{
				_string = format ["%1<t align='center'><t color='#bebebe'>Object:</t> %2<br/><t color='#bebebe'>Type:</t> %3<br/><t color='#bebebe'>Distance:</t> %4<br/></t>%5", _header, _object, (typeOf _object), (player distance _object), _text];
			}
			else
			{
				_knowledge = 0;
				
				_enemy = player;
				
				if (alive _enemy) then
				{
					if (_object targetKnowledge _enemy select 0) then
					{
						_knowledge = (_object knowsAbout vehicle _enemy);
					};
				}
				else
				{
					_enemy = "Unknown";
				};
				
				_string = format ["%1<t align='center'><t color='#bebebe'>Group:</t> %2<br/><t color='#bebebe'>Unit:</t> %3<br/><t color='#bebebe'>Skill:</t> %4<br/><t color='#bebebe'>Enemy:</t> %5<br/><t color='#bebebe'>Knowledge:</t> %6<br/><t color='#bebebe'>Behaviour:</t> %7<br/><t color='#bebebe'>Combat Mode:</t> %8<br/><t color='#bebebe'>Speed Mode:</t> %9<br/><t color='#bebebe'>Type:</t> %10<br/><t color='#bebebe'>Distance:</t> %11<br/></t>%12", _header, _group, _object, (_object skillFinal "general"), _enemy, _knowledge, (behaviour _object), (combatMode _object), (speedMode _object), (typeOf _object), (player distance _object), _text];
			};
			
			hint parseText _string;
		};
		
		sleep 1;
	};
	
	}
];