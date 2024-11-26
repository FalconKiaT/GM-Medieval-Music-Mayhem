// A script holding the function to be used to execute a function only if some boolean check is passed

// NOTE 1: 
// All boolean checks are handled on obj_global_manager,
// if its not present in the room, it wont work.

// NOTE 2: 
// The conditioned function wont execute if the room is switched

// function to call to add a conditioned function into the game
// WARNING: THE FUNC CONDITION MUST BE DEFINED AS A FUNCTION THAT RETURNS A BOOLEAN
// Syntax: [_func_condition -> function definition WITH BOOL RETURN] [_func -> function definition]
function run_func_on_condition(_func_condition, _func_to_execute) 
{
	// Make sure scheduler timer object exists
	if (global.global_scheduler_timer_exists == undefined)
	{
		instance_create_layer(0,0,"Instances", obj_sheduler_timer)
	}

	// Create it and add it to list
	var _condition_func = conditioned_func_constructor(_func_condition, _func_to_execute);
    ds_list_add(global.conditioned_func_list, _condition_func);
}

// Delayed function struct for better data handling
function conditioned_func_constructor(_func_condition, _func_to_execute) 
{
    return 
	{
		func_condition: _func_condition,	// The condition to check, must return a boolean
        func_to_execute: _func_to_execute,				// The function to execute on condition met
		room_id: room,						// Store a reference to the room it was called from

		// Method to check if we have switched rooms
		is_room_correct: function()
		{
			return room == room_id;
		},
    };
}

