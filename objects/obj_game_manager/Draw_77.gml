if (global.current_game_state == GAME_STATES.PAUSE ){
	instance_deactivate_all(true);
	
	
}
else
{
	instance_activate_all();
	
}