//checks what room its in to determine game state
if (room_exists(rm_mock_level1_prototype)){
	
	global.current_game_state = GAME_STATES.PLAY;
	
}

show_debug_message(global.current_game_state)

// before pause state
_pervious_game_state= global.current_game_state;




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

// pause menu end
if (room == rm_mock_level1_prototype){
	show_debug_message("yes")
}