// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - Feature Settings
// ////////////////////////////////////////////////////////////////////////////
// The G.L.X Feature settings are stored in the global array GLX_Feature.
// You can change G.L.X Feature settings by editing the GLX_Feature array.
// For each custom G.L.X Feature setting remove the "//" in front of the respective line and modify the value.
// Example: GLX_Feature set [Index, Value];
// In multiplayer all G.L.X Feature settings are used by the server only.
// ////////////////////////////////////////////////////////////////////////////

  /* Legend:
  
   1.) A.I. Combat Features:
   -------------------------
	   * Smoke ( Man )
	   * Smoke ( Vehicle )
	   * Flare	   
	   * Take Cover
	   
   2.) A.I. I.d.l.e. Features:
   ---------------------------
       * 
       * 
  */
  
  // ==============================================================
  // G.L.X A.I. Smoke Man: ( Chance )
  // ==============================================================
  // 0 - 100, default is 50%
    // GLX_Feature set [0, 50];
	
  // ==============================================================
  // G.L.X A.I. Smoke Vehicle: ( Chance )
  // ==============================================================
  // 0 - 100, default is 75%
    // GLX_Feature set [1, 75];
	
  // ==============================================================
  // G.L.X A.I. Flare: ( Chance )
  // ==============================================================
  // 0 - 100, default is 50%
    // GLX_Feature set [2, 50];
	
  // ==============================================================
  // G.L.X A.I. Take Cover: ( Chance )
  // ==============================================================
  // Choose chance of how A.I. should be able to search for cover.
  // 0 - 100, default is 35%
	// GLX_Feature set [3, 35];
	
	// --------------------------------------------------------------
	// G.L.X A.I. Take Cover: ( Distance )
	// --------------------------------------------------------------
	// Choose distance within A.I. should be able to search for cover.
	// 10 - 100, default is 15 meters
	  // GLX_Feature set [4, 15];