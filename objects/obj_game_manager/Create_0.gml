
// possible game states
enum GAME_STATES{
	 PLAY =0,
	 PAUSE =1,
	 OVER=2,
	 DIALOGUE=3,
	 WIN=4,
	 MENU=5,
	
	
}


// Game state
var _pervious_game_state
global.current_game_state = GAME_STATES.PLAY;

// Some deafult resolutions 
global.res_width = 1600;
global.res_height = 900;




// Used in pause surfaces
pause_sur =-1;
pause_sur_buffer = -1;

// pause menu
	// menu box
pause_width = 64
pause_height = 64
	// text alignment
text_border = 8
text_dist = 32

	// text options
option[0] = "Resume"
option[1] = "Retry"
option[2] = "Exit"
	// options array size
text_array_length = array_length(option)

	// position in pause menu
pos_pause=0

//global variables
global.current_game_state = GAME_STATES.PLAY;

