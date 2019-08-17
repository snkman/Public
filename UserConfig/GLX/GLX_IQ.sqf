// ////////////////////////////////////////////////////////////////////////////
// Group Link - X - I.Q. Settings
// ////////////////////////////////////////////////////////////////////////////
// The G.L.X I.Q. settings are stored in the global array GLX_IQ.
// You can change G.L.X I.Q. settings by editing the GLX_IQ array.
// For each custom G.L.X I.Q. setting remove the "//" in front of the respective line and modify the value.
// Example: GLX_IQ set [Index, Value];
// In multiplayer all G.L.X I.Q. settings are used by the server only.
// ////////////////////////////////////////////////////////////////////////////

  // ==============================================================
  // G.L.X A.I. I.Q. Knowledge: ( Duration )
  // ==============================================================
  // Choose value of how fast A.I. should loose knowledge about their enemy(s) after loosing line of sight.
  // Note: 0 = Very fast / 7 = Very slow
  // Description: If this value was set to 0 A.I. without line of sight to their enemy(s) will almost instantly loose all their enemy(s) knowledge and enemy(s) position accuracy.
  // 0 - 7, default is 3
	// GLX_IQ set [0, 3];