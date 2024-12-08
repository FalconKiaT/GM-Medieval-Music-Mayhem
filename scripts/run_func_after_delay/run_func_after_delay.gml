// A script holding the function to be used to execute a function after some time  has passed.

// NOTE 1: 
// All timer counting is handled on obj_global_manager,
// if its not present in the room, it wont work.

// NOTE 2: 
// The timed function wont continue to count or run if the room is switched.
// It will get removed from the list at obj_global_manager


// <-------------------------------------------> SECONDS BASED <------------------------------------------->

// Function to call to execute a function on a delay, timer only counts if _func_count_condition returns true
// WARNING: THE _func_count_condition MUST BE DEFINED AS A FUNCTION THAT RETURNS A BOOLEAN
// Syntax: [_delay_seconds -> float] [_func_to_execute -> function definition] [_func_count_condition -> function definition WITH BOOL RETURN]
function run_func_after_delay_seconds_condition(_delay_seconds, _func_to_execute, _func_count_condition) 
{
	// Make sure scheduler timer object exists
	if (global.scheduler_timer_obj == undefined)
	{
		global.scheduler_timer_obj = instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}
	
	// Make sure that the object is active and not disabled
	instance_activate_object(global.scheduler_timer_obj);
	
	// Create it and add it to list
	var _timed_func = delayed_func_seconds_constructor(_delay_seconds, _func_to_execute, _func_count_condition);
    ds_list_add(global.timed_func_list, _timed_func);
	
	// Return the ID
	return _timed_func.get_id();
}

// Overloaded run func but doesnt require count condition, it will always count
// Syntax: [_delay_seconds -> float] [_func_to_execute -> function definition]
function run_func_after_delay_seconds(_delay_seconds, _func_to_execute) 
{
	// Make sure scheduler timer object exists
	if (global.scheduler_timer_obj == undefined)
	{
		global.scheduler_timer_obj = instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}
	
	// Make sure that the object is active and not disabled
	instance_activate_object(global.scheduler_timer_obj);
	
	// Create it and add it to list
	var _timed_func = delayed_func_seconds_constructor(_delay_seconds, _func_to_execute, function(){return true});
    ds_list_add(global.timed_func_list, _timed_func);
	
	// Return the ID
	return _timed_func.get_id();
}





// <-------------------------------------------> FRAME BASED <------------------------------------------->


// Function to call to execute a function on a delay, timer only counts if _func_count_condition returns true
// WARNING: THE _func_count_condition MUST BE DEFINED AS A FUNCTION THAT RETURNS A BOOLEAN
// Syntax: [_delay_frames -> float] [_func_to_execute -> function definition] [_func_count_condition -> function definition WITH BOOL RETURN]
function run_func_after_delay_frames_condition(_delay_frames, _func_to_execute, _func_count_condition) 
{
	// Make sure scheduler timer object exists
	if (global.scheduler_timer_obj == undefined)
	{
		global.scheduler_timer_obj = instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}
	
	// Make sure that the object is active and not disabled
	instance_activate_object(global.scheduler_timer_obj);
	
	// Else it was defined, create it and add it to list
	var _timed_func = delayed_func_frames_constructor(_delay_frames, _func_to_execute, _func_count_condition);
    ds_list_add(global.timed_func_list, _timed_func);
	
	// Return the ID
	return _timed_func.get_id();
}

// Overloaded run func but doesnt require count condition, it will always count
// Syntax: [_delay_frames -> float] [_func_to_execute -> function definition]
function run_func_after_delay_frames(_delay_frames, _func_to_execute) 
{
	// Make sure scheduler timer object exists
	if (global.scheduler_timer_obj == undefined)
	{
		global.scheduler_timer_obj = instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}
	
	// Make sure that the object is active and not disabled
	instance_activate_object(global.scheduler_timer_obj);
	
	// Create it and add it to list
	var _timed_func = delayed_func_frames_constructor(_delay_frames, _func_to_execute, function(){return true});
    ds_list_add(global.timed_func_list, _timed_func);
	
	// Return the ID
	return _timed_func.get_id();
}


// <-------------------------------------------> CONSTRUCTORS <------------------------------------------->


// Delayed function struct for better data handling
function delayed_func_seconds_constructor(_delay_seconds, _func_to_execute, _func_count_condition) 
{
    return 
	{
        delay_seconds: _delay_seconds,							// The delay in seconds
        func: _func_to_execute,									// The function to execute after the delay
		func_count_condition: _func_count_condition,			// Function that checks the condition to advance the timer
		func_id: scheduler_generate_random_30_digit_number(),	// Generates a random 30 digit ID to use in referencing
		room_id: room,											// Store a reference to the room it was called from
		
        // Method to update the timer
        advance_timer: function() 
		{
            self.delay_seconds -= get_delta_time();
        },
        
        // Method to check if the timer is done
        is_timer_done: function() 
		{
            return self.delay_seconds <= 0;
        },
		
		// Method to check if we have switched rooms
		is_room_correct: function()
		{
			return room == room_id;
		},

        // Method to execute the function. Checks if the timer is done
        execute_function: function() 
		{
            if (self.is_timer_done()) 
			{
                self.func();  // Execute the function
                return true;
            }
			// Timer is not done yet
            return false;
        },
		
		// Method to override how much time is left in the timer
		override_timer: function(_target_time)
		{
			self.delay_seconds = _target_time;
		},
		
		// Method to get the id of the func
		get_id: function()
		{
			return self.func_id
		},
    };
}


// Delayed function struct for better data handling
function delayed_func_frames_constructor(_delay_frames, _func_to_execute, _func_count_condition) 
{
    return 
	{
        delay_frames: _delay_frames,							// The delay in frames
        func: _func_to_execute,									// The function to execute after the delay
		func_count_condition: _func_count_condition,			// Function that checks the condition to advance the timer
		func_id: scheduler_generate_random_30_digit_number(),	// Generates a random 30 digit ID to use in referencing
		room_id: room,											// Store a reference to the room it was called from
		
        // Method to update the timer
        advance_timer: function() 
		{
            self.delay_frames -= 1;
        },
        
        // Method to check if the timer is done
        is_timer_done: function() 
		{
            return self.delay_frames <= 0;
        },
		
		// Method to check if we have switched rooms
		is_room_correct: function()
		{
			return room == room_id;
		},

        // Method to execute the function. Checks if the timer is done
        execute_function: function() 
		{
            if (self.is_timer_done()) 
			{
                self.func();  // Execute the function
                return true;
            }
			// Timer is not done yet
            return false;
        },
		
		// Method to override how much time is left in the timer
		override_timer: function(_target_time)
		{
			self.delay_frames = _target_time;
		},
		
		// Method to get the id of the func
		get_id: function()
		{
			return self.func_id
		},
    };
}


// <-------------------------------------------> UTILTITES <------------------------------------------->


// Special type of delayed function runner that uses the already built struct
function run_func_after_delay_struct(_timed_func) 
{
	// Make sure scheduler timer object exists
	if (global.scheduler_timer_obj == undefined)
	{
		global.scheduler_timer_obj = instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}
	
	// Make sure that the object is active and not disabled
	instance_activate_object(global.scheduler_timer_obj);
	
	// Create it and add it to list
    ds_list_add(global.timed_func_list, _timed_func);
}

// Cancel a timed function by its 30 digit integer ID, wont execute its final function
function cancel_delayed_function(_target_id)
{
	// iterate through lists
	for (var i = ds_list_size(global.timed_func_list) - 1; i >= 0; i--) 
	{
        var timer = global.timed_func_list[| i];
        if (timer.get_id() == _target_id) 
		{
            // Remove the matching entry
            ds_list_delete(global.timed_func_list, i);
        }
    }
}

// Force finish a delayed function by its 30 digit integer ID, in this case force finish will make it
// execute its finishing code
function force_finish_delayed_function(_target_id)
{
	// iterate through lists
	for (var i = ds_list_size(global.timed_func_list) - 1; i >= 0; i--) 
	{
        var timer = global.timed_func_list[| i];
        if (timer.get_id() == _target_id) 
		{
            // Force finish the matching entry then remove
			timer.func();
            ds_list_delete(global.timed_func_list, i);
        }
    }
}