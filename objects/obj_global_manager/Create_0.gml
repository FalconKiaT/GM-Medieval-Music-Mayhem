// Make sure only one global manager objects exists at any given time
if ( !variable_global_exists("global_manager_exists") || global.global_manager_exists == undefined )
{
	// First time this object ever called create, set it up
	global.global_manager_exists = true;
}
else if (global.global_manager_exists)
{
	// Already exists, destroy this duplicate object
	instance_destroy();
	return;
}

//leaving this here just in case
if(room_exists(rm_mainMenu)){
	global.current_game_state = GAME_STATES.MENU
}
if(global.current_game_state == GAME_STATES.MENU){
	audio_play_sound(snd_menu_music,10,true)
}

