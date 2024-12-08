/// @description Insert description here
// You can write your code in this editor

// Only clear the global field if its the same object
if (global.scheduler_timer_obj == id)
{
	global.scheduler_timer_obj = undefined;
	show_debug_message("A Scheduler Object stored in a global has been destroyed!")
}
else
{
	show_debug_message("A Scheduler Object has been destroyed!")
}