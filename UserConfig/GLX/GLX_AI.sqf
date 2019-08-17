// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - A.I. Settings
// ////////////////////////////////////////////////////////////////////////////
// The G.L.X A.I. settings are stored in the global array GLX_AI.
// You can change G.L.X A.I. settings by editing the GLX_AI array.
// For each custom G.L.X A.I. setting remove the "//" in front of the respective line and modify the value.
// Example: GLX_AI set [Index, Value];
// In multiplayer all G.L.X A.I. settings are used by the server only.
// ////////////////////////////////////////////////////////////////////////////

  /* Legend:
  
   1.) G.L.X A.I. System:
   ----------------------
       * Reinforcement
  */
  
  // ==============================================================
  // G.L.X A.I. Reinforcement Request: ( Knowledge )
  // ==============================================================
  // Choose knowledge A.I. group(s) need to have about their enemy(s) to requesting reinforcement(s).
  // Note: If this value was set to 4 A.I. group(s) are not able to request reinforcement(s).
  // 0 - 4.00, default is > 1
	// GLX_AI set [0, 1];
	
  // ==============================================================
  // G.L.X A.I. Reinforcement Request Courage: ( Rating )
  // ==============================================================
  // Choose A.I. group(s) courage rating factor.
  // Note: The lower this value the faster A.I. group(s) will be rated overpowered and request reinforcement(s).
  // Example: By default A.I. group(s) with 4 A.I. unit(s) vs 1 enemy unit will not request reinforcement(s) but A.I. group(s) with 4 A.I. unit(s) vs 2 enemy unit(s) will request reinforcement(s).  
  // 0.01 - 1.00, default is 0.15
	// GLX_AI set [1, 0.15];
	
  // ==============================================================
  // G.L.X A.I. Reinforcement Request: ( Limit )
  // ==============================================================
  // Choose how many A.I. group(s) can be requested as reinforcement(s).
  // 0 - 30, default is 3
	// GLX_AI set [2, 3];
	
  // ==============================================================
  // G.L.X A.I. Reinforcement: ( Cancel )
  // ==============================================================
  // Choose time of how long A.I. group(s) should search for their enemy(s) after loosing all knowledge about their enemy(s).
  // 30 - 500, default is 170 seconds
	// GLX_AI set [3, 170];