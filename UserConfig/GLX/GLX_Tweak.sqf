// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - Tweak Settings
// ////////////////////////////////////////////////////////////////////////////
// The G.L.X Tweak settings are stored in the global array GLX_Tweak.
// You can change G.L.X Tweak settings by editing the GLX_Tweak array.
// For each custom G.L.X Tweak setting remove the "//" in front of the respective line and modify the value.
// Example: GLX_Tweak set [Index, Value];
// In multiplayer all G.L.X Tweak settings are used by the server only.
// ////////////////////////////////////////////////////////////////////////////

  /* Description:
  
   The G.L.X Tweak settings are used to modify some of the main G.L.X A.I. combat system values.
   Most of the G.L.X Tweak settings are base settings only used to dynamically calculate and modify the G.L.X A.I. combat behaviours within the G.L.X A.I. combat system.
   This means some of the G.L.X Tweak settings will be randomized by the G.L.X A.I. combat system.
   
   Warning: Changes of the G.L.X Tweak settings may will extremely change your gameplay experiance!
  
  */
  
  // ==============================================================
  // G.L.X A.I. Movement: ( Random )
  // ==============================================================
  // Choose A.I. movement system random main values.
  // Note: Empty array [] means fully randomized A.I. movement system.
  // Description: Distance from current position to next position in meters.
  // Example: [3, 5, 7, 10] or [3, 13, 5, 15] or [1, 3, 5, 7, 10] or [10, 13, 15] or [15]
  // 0 - 30, default is []
	// GLX_Tweak set [0, [] ];