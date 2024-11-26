// Define the scheduled functions lists

// Create a list of functions created on timers
global.timed_func_list = ds_list_create();

// Create a list of functions set to run on a condition
global.conditioned_func_list = ds_list_create();

// Store a reference to the timer obj
global.global_scheduler_timer_exists = undefined;
