/// @description In case object gets destroyed

// Only clear the global field if its the same object
if (global.global_scheduler_timer_exists == self)
{
	global.global_scheduler_timer_exists = undefined;
}

