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
  // G.L.X A.I. Movement Distance: ( Random )
  // ==============================================================
  // Choose A.I. movement distance random values.
  // Note: Empty array [] means fully randomized A.I. movement distance. 1 value array e.g. [5] means fixed A.I. movement distance.
  // Description: Low values ( 1, 3, 5 ) will make A.I. flank less. High values ( 7, 10, 13, 15 ) will make A.I. flank more.
  // Example: [3, 5, 7, 10] or [3, 13, 5, 15] or [1, 3, 5, 7, 10] or [10, 13, 15] or [3, 5, 7] or [7] or [15]
  // 0 - 30, default is [5, 10, 15, 10, 5] v.1.0.05 [] ( Fully randomized )
	// GLX_Tweak set [0, [5, 10, 15, 10, 5] ];
	
  // ==============================================================
  // G.L.X A.I. Movement Type: ( Chance )
  // ==============================================================
  // Choose A.I. movement system type ( Tactical / Aggressive ) chance.
  // Note: Lower value will make A.I. move more aggressive ( straight ) to their target position.
  // Example: 100 = A.I. will try to use flank movement as much as possible. 0 = A.I. will try to move straight to their target position as much as possible.
  // 0 - 100, default is 75%
	// GLX_Tweak set [1, 75];