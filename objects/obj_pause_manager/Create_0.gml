/// @description Declare Variables
// Feather disable GM2017

// Pause Current state
current_pause_state = false

// Broadcast System
receiver = new Receiver();

receiver.add(MESSAGES.COUNTDOWN_FINISHED, function() 
{
    global.current_game_state = GAME_STATES.PLAY;
	audio_resume_all()
	instance_activate_object(obj_music_controller_generic)
	show_debug_message("Called COUNTDOWN FINISHED")
	instance_activate_layer("Arrows");
});

receiver.add(PAUSE_MENU.RESTART_BTN_CLICKED, function() 
{
    //global.current_game_state = _pervious_game_state;
	audio_stop_all();
	score = 0;
	health = 100;
	show_debug_message("Called Restart Clicked")
	//room_restart();
});

receiver.add(PAUSE_MENU.RESUME_CLICKED, function() 
{
    show_debug_message("Called RESUME CLICKED")
	// Perform different behaviour depending on room
	switch(room)
	{
		// Dont do countdown on non-game rooms
		case rm_dialogue_level1_intro:
			toggle_pause();
			break;
	
		// Perform countdown if on level
		case rm_level1:
			//global.current_game_state = GAME_STATES.PAUSE_TIMER;
			toggle_pause();
			instance_create_layer(room_width/2,room_height/2,"Meta",obj_countdown)
			break;
	}
});

receiver.add(PAUSE_MENU.MAIN_MENU_CLICKED, function() 
{
    show_debug_message("Called MAIN_MENU_CLICKED")
	health = 100;
	score = 0;
	audio_stop_all();
	global.current_level = 1; // ?????
	global.current_game_state = GAME_STATES.MENU;
	room_goto(rm_mainMenu); //switch room
});



// Function that will toggle the pause
function toggle_pause()
{
	if (!current_pause_state)
	{
		make_pause_visible(true);
		// After finishing, broadcast pause
		on_game_paused();
		broadcast(MESSAGES.GAME_PAUSED)
		current_pause_state = true;
	}
	else
	{
		make_pause_visible(false);
		// After finishing, broadcast resumed
		on_game_resumed();
		broadcast(MESSAGES.GAME_RESUMED)
		current_pause_state = false
	}
}

// Functions to execute code depending if game was paused or resumed
function on_game_paused()
{
	// Perform different actions depending on room
	switch(room)
	{
		// De-activate music controller on level specific rooms
		case rm_level1:
			instance_deactivate_object(obj_music_controller_generic)
			instance_deactivate_layer("Arrows");
			audio_pause_all()
			break;
	}
}

function on_game_resumed()
{
	
}




// Function to make pause visible
function make_pause_visible(do_make_visible)
{
	// get all elements in the "Pause" layer
	var _pause_elements = layer_get_all_elements("Pause");
	// Go through all instances on the pause layer
	for (var i = 0; i < array_length(_pause_elements); i++)
	{
		// Check if the element is an instance
		if (layer_get_element_type(_pause_elements[i]) == layerelementtype_instance)
		{
			// Get the instance ID from the layer element
			var layerelement = _pause_elements[i];
			var inst = layer_instance_get_instance(layerelement);

			// Set the instance to not visible
			if (instance_exists(inst)) 
			{
				inst.visible = do_make_visible;
			}
		}
	}
}


