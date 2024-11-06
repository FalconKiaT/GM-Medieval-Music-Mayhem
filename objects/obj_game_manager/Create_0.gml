
// possible game states
enum GAME_STATES{
	 PLAY =0,
	 PAUSE =1,
	 OVER=2,
	 DIALOGUE=3,
	 WIN=4
	
	
}

// Game state
var _pervious_game_state
global.current_game_state = GAME_STATES.PLAY;

// Some deafult resolutions 
global.res_width = 1600;
global.res_height = 900;

// sets the resolutions


// Used in pause surfaces
pause_sur =-1;
pause_sur_buffer = -1;


