// goes to results screen
audio_stop_all();
instance_deactivate_all(true);
if(global.current_game_state == GAME_STATES.WIN){
		global.max_level +=1;
}
room_goto(rm_results);