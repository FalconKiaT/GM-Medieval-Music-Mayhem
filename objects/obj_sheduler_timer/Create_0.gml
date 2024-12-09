/// @description Define Functions

// Make sure only one global manager objects exists at any given time
if ( global.scheduler_timer_obj == undefined )
{
	// First time this object ever called create, set it up
	global.scheduler_timer_obj = id;
}
else
{
	// Already exists, destroy this duplicate object
	instance_destroy();
	return;
}

show_debug_message("The Scheduler Object has been created!")