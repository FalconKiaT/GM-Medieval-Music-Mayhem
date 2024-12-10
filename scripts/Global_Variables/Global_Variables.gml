/// @description Initialize global variables
// might be better in a script

// <------------------------> Settings <------------------------>

// Volume
global.volume = 100; //a value 0-100 denoting game volume
global.previous_volume = 100
global.max_volume_slider = 100;

// Function to get the volume value scaled to a float from 0 to 1
function get_volume_scaled()
{
	return global.volume / global.max_volume_slider;
}

// Timing
global.note_timing_offset = 0.5;

// Draw FPS
global.do_draw_fps = false;

// <------------------------> Menus <------------------------>
global.max_level = 3.0; // FIXME: value for testing purposes. controls what levels player can access



// <------------------------> possible game states <------------------------>
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