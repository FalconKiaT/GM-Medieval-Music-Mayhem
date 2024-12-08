// goes to results screen

// Debugging, block all actions on this object
if (1 == 1)
{
	return;
}

audio_stop_all();
instance_deactivate_all(true);
if(global.current_game_state == GAME_STATES.WIN){
		
		
		room_goto(rm_results);
		
}
room_goto(rm_results);