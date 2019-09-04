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
	   * House Search
	   * 
	   
   2.) A.I. I.d.l.e. Features:
   ---------------------------
       * Weapon Fire React
       * 
  */
  
// ////////////////////////////////////////////////////////////////////////////
// 1.) A.I. Combat Feature Settings
// ////////////////////////////////////////////////////////////////////////////

  // ==============================================================
  // G.L.X A.I. Smoke Man: ( Chance )
  // ==============================================================
  // Choose chance of how A.I. without vehicle should be able to use smoke at daytime.
  // 0 - 100, default is 50%
    // GLX_Feature set [0, 50];
	
  // ==============================================================
  // G.L.X A.I. Smoke Vehicle: ( Chance )
  // ==============================================================
  // Choose chance of how A.I. with vehicle should be able to use smoke at daytime.
  // 0 - 100, default is 75%
    // GLX_Feature set [1, 75];
	
  // ==============================================================
  // G.L.X A.I. Flare: ( Chance )
  // ==============================================================
  // Choose chance of how A.I. should be able to use flares at nighttime.
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
	  
  // ==============================================================
  // G.L.X A.I. House Search: ( Chance )
  // ==============================================================
  // Choose chance of how A.I. should be able to do house search.
  // 0 - 100, default is 50%
	// GLX_Feature set [5, 50];
	
// ////////////////////////////////////////////////////////////////////////////
// 2.) A.I. I.d.l.e. Feature Settings
// ////////////////////////////////////////////////////////////////////////////

  // ==============================================================
  // G.L.X A.I. Weapon Fire:
  // ==============================================================
  // Choose if A.I. should be able to react to weapon fire.
  // True / False, default is True
	// GLX_Feature set [6, True];
	
	// --------------------------------------------------------------
	// G.L.X A.I. Weapon Fire Type: ( Distance )
	// --------------------------------------------------------------
	// Choose distance within A.I. should be able to react to specific kind of weapon fire in meters.
	// [Suppressed, Grenade Launcher, Rocket Launcher, Default], default is [15, 50, 300, 700]
	  // GLX_Feature set [7, [15, 50, 300, 700] ];