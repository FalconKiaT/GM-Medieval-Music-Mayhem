
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
pause_width = 815
pause_height = 766
	// text alignment
text_border = 8
text_dist = 100

	// text options
option[0] = spr_btn_resum
option[1] = spr_btn_restart
option[2] = spr_btn_main_menu
	// options array size
text_array_length = array_length(option)

	// position in pause menu
pos_pause=0

// pause menu end

// detects level
if (room_exists(rm_mock_level1_prototype)){
	global.current_level = 1;
}

























