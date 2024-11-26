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

// <--------------------> IAN CODE <------------------------->

// Create a list of functions created on timers
global.timed_func_list = ds_list_create();

// Function used to check if the timers should run, returns true if they should
function should_timers_run()
{
	// Check for conditions
	var _check = global.current_game_state != GAME_STATES.PAUSE;
	var _check = _check && global.current_game_state != GAME_STATES.PAUSE_TIMER;
	
	// Return result
	return _check;
}

// Create a list of functions set to run on a condition
global.conditioned_func_list = ds_list_create();

// <--------------------> END IAN CODE <------------------------->