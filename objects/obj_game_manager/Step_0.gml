

// Health to gameover detection
if((health <= 0) && global.current_game_state == GAME_STATES.PLAY)
{
	global.current_game_state = GAME_STATES.OVER;//game over
	alarm[0] = room_speed * 10;// change room_speed forgot the other one
}

// Toggles the pause state during gameplay
if(keyboard_check_pressed(vk_escape)){
	
	if (global.current_game_state != GAME_STATES.PAUSE){
		_pervious_game_state = global.current_game_state;
		global.current_game_state = GAME_STATES.PAUSE;
		
		
	}
	else if (global.current_game_state == GAME_STATES.PAUSE){
		global.current_game_state = _pervious_game_state;
	}
	
}