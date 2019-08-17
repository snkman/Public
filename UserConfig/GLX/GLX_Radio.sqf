// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - Radio Settings
// ////////////////////////////////////////////////////////////////////////////
// The G.L.X Radio settings are stored in the global array GLX_Radio.
// You can change G.L.X Radio settings by editing the GLX_Radio array.
// For each custom G.L.X Radio setting remove the "//" in front of the respective line and modify the value.
// Example: GLX_Radio set [Index, Value];
// In multiplayer all G.L.X Radio settings are used by the server only.
// ////////////////////////////////////////////////////////////////////////////

  // ==============================================================
  // G.L.X A.I. Radio: ( Time )
  // ==============================================================
  // Choose time A.I. group(s) should need to request reinforcement(s).
  // Note: This value will be recalculated with the skill of the requesting A.I. group leader.
  // 0 - 100, default is 30 seconds
	// GLX_Radio set [0, 30];
	
  // ==============================================================
  // G.L.X A.I. Radio: ( Distance )
  // ==============================================================
  // Choose distance within specific A.I. group(s) are able to request reinforcement(s).
  // 0 - 10000, default is [1000, 3000, 5000, 7000] - [Man, Car, Tank, Air, Ship]
	// GLX_Radio set [1, [1000, 3000, 5000, 7000] ];