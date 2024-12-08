/// @description Run scheduled functions

// Update timers on timed funcs
// Only update timed funcs if the game is not paused
	// Update timers on delayed functions
for (var i = ds_list_size(global.timed_func_list) - 1; i >= 0; i--) 
{
	// Get timed_func struct
	var timed_func = global.timed_func_list[| i];
		
	// Check if we are still in the same room the delayed function was added in
	if (!timed_func.is_room_correct())
	{
			// We arent, remove it from list and continue
		ds_list_delete(global.timed_func_list, i);
		continue;
	}
		
	// Check if the conditions for counting are met
	if (!timed_func.func_count_condition())
	{
		// We dont meet the condition to count this frame, skip
		continue;
	}
	
	// update function timer
	timed_func.advance_timer(); 

	// Check if its finished
	if (!timed_func.is_timer_done()) 
	{
		// Not finished yet, continue
		continue;
	} 
	// Else it did finish, execute function and remove it from list
	timed_func.execute_function();
	ds_list_delete(global.timed_func_list, i);
}

// Check if any conditioned funcs should be executed
// Update timers on delayed functions
for (var i = ds_list_size(global.conditioned_func_list) - 1; i >= 0; i--) 
{
	// Get timed_func struct
	var _condition_func = global.conditioned_func_list[| i];
		
	// Check if we are still in the same room the delayed function was added in
	if (!_condition_func.is_room_correct())
	{
		// We arent, remove it from list and continue
		ds_list_delete(global.conditioned_func_list, i);
		continue;
	}

	// Check for condition
	if (!_condition_func.func_condition()) 
	{
		// We havent met the condition yet, continue
		continue;
	} 
	// Else we did meet it, execute function and remove it from list
	_condition_func.func_to_execute();
	ds_list_delete(global.conditioned_func_list, i);
}