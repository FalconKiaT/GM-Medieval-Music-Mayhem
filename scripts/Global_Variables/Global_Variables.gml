/// @description Initialize global variables
// might be better in a script

//settings
global.volume = 100; //a value 0-100 denoting game volume
global.note_timing_offset = 0.5;

//menus
global.max_level = 1.0; //controls what levels player can access

// possible game states
enum GAME_STATES{
	 PLAY =0,
	 PAUSE =1,
	 OVER=2,
	 DIALOGUE=3,
	 WIN=4,
	 MENU=5,
	 PAUSE_TIMER =6,
	 TIMER =7,
	 
		 
	
	 
	
	
}


// Game state
global.current_game_state = GAME_STATES.MENU;

// Some deafult resolutions 
global.res_width = 1600;
global.res_height = 900;

// The current level
global.current_level= 0;


// level scoring
global.level_one_high_score =0;