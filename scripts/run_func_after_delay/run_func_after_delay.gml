// A script holding the function to be used to execute a function after some time  has passed.

// NOTE 1: 
// All timer counting is handled on obj_global_manager,
// if its not present in the room, it wont work.

// NOTE 2: 
// The timed function wont continue to count or run if the room is switched.
// It will get removed from the list at obj_global_manager

// Function to call to execute a function on a delay. Pause aware
// Syntax: [_delay_seconds -> float] [_func -> function definition]
function run_func_after_delay(_delay_seconds, _func) 
{
	// Check if the delayed func list has been initialized
	if (!variable_global_exists("timed_func_list") || global.timed_func_list == undefined)
	{
		// Hasnt been defined
		show_debug_message("ERROR! Delayed func list hasnt been defined on global manager obj!")
		return;
	}
	// Else it was defined, create it and add it to list
	var _timed_func = delayed_func_constructor(_delay_seconds, _func);
    ds_list_add(global.timed_func_list, _timed_func);
}

// Delayed function struct for better data handling
function delayed_func_constructor(_delay_seconds, _func) 
{
    return 
	{
        delay_seconds: _delay_seconds,		// The delay in seconds
        func: _func,						// The function to execute after the delay
		room_id: room,						// Store a reference to the room it was called from
		
        // Method to update the timer
        execute_time_passed: function() 
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
        }
    };
}

