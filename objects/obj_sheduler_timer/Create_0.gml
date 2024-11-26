/// @description Define Functions

// Make sure only one global manager objects exists at any given time
if ( global.global_scheduler_timer_exists == undefined )
{
	// First time this object ever called create, set it up
	global.global_scheduler_timer_exists = true;
}
else if (global.global_scheduler_timer_exists)
{
	// Already exists, destroy this duplicate object
	instance_destroy();
	return;
}

// Bool to not check if states has been defined every frame
has_current_state_been_defined = false


// <----------------------------------------------> FUNCTIONS <---------------------------------------------->

// Function used to check if the timers should run, returns true if they should
function should_timers_run()
{
	if (!has_current_state_been_defined)
	{
		// Dont check conditions until they are defined by the global controller
		if (!variable_global_exists("current_game_state") || global.current_game_state == undefined)
		{
			// Hasnt been defined
			return;
		}
		// has been defined
		has_current_state_been_defined = true;
	}
	
	// Check for conditions
	var _check = global.current_game_state != GAME_STATES.PAUSE;
	var _check = _check && global.current_game_state != GAME_STATES.PAUSE_TIMER;
	
	// Return result
	return _check;
}