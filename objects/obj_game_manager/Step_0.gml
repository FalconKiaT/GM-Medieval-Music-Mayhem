// Feather disable GM2017



// Health to gameover detection
if((health <= 0) && global.current_game_state == GAME_STATES.PLAY)
{
	global.current_game_state = GAME_STATES.OVER;//game over
	audio_stop_all();
	audio_play_sound(death_sound,10,false);
	alarm[0] = game_get_speed(gamespeed_fps) * 1;// timer
}

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


if (global.current_game_state == GAME_STATES.PAUSE){
	
	// Pause menu inputs
	up_key = keyboard_check_pressed(vk_up);
	down_key = keyboard_check_pressed(vk_down);
	enter_key = keyboard_check_pressed(vk_enter);

	// running menu inputs
	pos_pause += down_key-up_key;
	

	if (pos_pause >= text_array_length){
		pos_pause = 0;
	}
	if (pos_pause <0 ){
		pos_pause = text_array_length-1;	
	}
	
	if (down_key || up_key){
		// Author: NenadSimic for the sound effect CC Attribution 3.0 Unported 
		audio_play_sound(snd_button_clicked,1,false);
	}
	if (enter_key){
		switch(pos_pause){
	
			case 0:
				global.current_game_state = GAME_STATES.PAUSE_TIMER;
				break;
			case 1:
				global.current_game_state = _pervious_game_state;
				audio_stop_all();
				score = 0;
				health = 100;
				room_restart();
				break;
			case 2:
				global.current_game_state = GAME_STATES.MENU;
				audio_stop_all();
				health =100
				instance_deactivate_all(true);
				instance_deactivate_object(obj_game_manager)
				room_goto(rm_mainMenu)
				break;
	
	
	
	
		}
	}
}

// debug for ending song
if(keyboard_check_pressed(vk_f1)){
	global.current_game_state = GAME_STATES.WIN
	alarm[0] = game_get_speed(gamespeed_fps) * 3;
}
// win  condition
if(global.current_game_state == GAME_STATES.PLAY && (global.music_timestamp >= global.music_timestamp_max)){
	global.current_game_state = GAME_STATES.WIN
	alarm[0] = game_get_speed(gamespeed_fps) * 3;
}
















