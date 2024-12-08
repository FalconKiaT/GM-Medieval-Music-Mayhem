// Feather disable GM2017

// Debugging, block all actions on this object
if (1 == 1)
{
	return;
}

// Health to gameover detection
if((health <= 0) && global.current_game_state == GAME_STATES.PLAY)
{
	global.current_game_state = GAME_STATES.OVER; // game over
	
	alarm[0] = game_get_speed(gamespeed_fps) * 1;// timer
}

/*
// Toggles the pause state during gameplay
if(keyboard_check_pressed(vk_escape)){
	if (global.current_game_state != GAME_STATES.OVER || global.current_game_state != GAME_STATES.WIN){
		
		if ((global.current_game_state == GAME_STATES.PLAY && global.current_game_state != GAME_STATES.PAUSE)){
			show_debug_message("paused")
			
			show_debug_message(global.current_game_state)
			_pervious_game_state = global.current_game_state;
			global.current_game_state = GAME_STATES.PAUSE;
		
		
		}
		else if (global.current_game_state == GAME_STATES.PAUSE){
			show_debug_message("unpaused")
			
			global.current_game_state = GAME_STATES.PAUSE_TIMER;
			show_debug_message(global.current_game_state)
		}
		
	}
}
*/


// debug for ending song
if(keyboard_check_pressed(vk_f1)){
	global.music_timestamp = 185.81
}

if(global.current_game_state == GAME_STATES.PLAY && (global.music_timestamp >= 185.81)){
	global.current_game_state = GAME_STATES.WIN
	alarm[0] = game_get_speed(gamespeed_fps) * 1;
}
















