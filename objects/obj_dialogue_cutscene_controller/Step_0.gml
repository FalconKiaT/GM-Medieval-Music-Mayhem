// Feather disable GM2017
/// @description Compute + User Input


// TODO: Check if the user clicks to skip typewritter effect

// Dont execute anything in step if the dialogue box is not active
if (dialogue_current_state == DIALOGUE_STATE.INACTIVE) 
{
	return;
}

// Compute points
event_user(0);

// NOTE: Made this a switch in case there are more states
switch (dialogue_current_state)
{
	case DIALOGUE_STATE.OPENING:
		// Dont run animation if paused
		if (is_dialogue_paused)
		{
			break;
		}
		// Animate the dialogue box opening
		var scale_speed = 1 / (game_get_speed(gamespeed_fps) * const_opening_anim_duration);
		opening_anim_scaler += scale_speed;
		// Check if we finished
		if (opening_anim_scaler >= 1)
		{
			// Finished
			opening_anim_scaler = 1;
			dialogue_current_state = DIALOGUE_STATE.ACTIVE;
			// TODO: TRIGGER TEXT
		}
		break;
		
	case DIALOGUE_STATE.CLOSING:
		// Dont run animation if paused
		if (is_dialogue_paused)
		{
			break;
		}
		// Animate the dialogue box closing
		var scale_speed = 1 / (game_get_speed(gamespeed_fps) * const_opening_anim_duration);
		opening_anim_scaler -= scale_speed;

		// Check if we've finished closing
		if (opening_anim_scaler <= 0)
		{
			// Fully closed
			opening_anim_scaler = 0;
			dialogue_current_state = DIALOGUE_STATE.INACTIVE;
			is_dialogue_visible = false;
			// Broadcast that dialogue ended
			broadcast(MESSAGES.DIALOGUE_FINISHED);
		}
		break;
}

// Set the typist state
var _state = dialogue_general_typist.get_state();
if (0 < _state && _state < 1)
{
	// Still typing
	text_printing_state = PRINTING_STATE.PRINTING;
}
else if (_state >= 1)
{
	// Typing finished
	text_printing_state = PRINTING_STATE.FINISHED;

	// Trigger the skip next page cooldown once printing is finished
	if (!did_skip_cooldown_time_trigger_this_page)
	{
		// Start Skip cooldown timer 
		is_skip_advance_on_cooldown = true;
		run_func_after_delay_seconds_condition(const_skip_cooldown,
		function()
		{
			// Finished cooldown
			is_skip_advance_on_cooldown = false;
		},
		function()
		{
			// Only count when the dialogue is not paused
			return !is_dialogue_paused;
		});
	
		did_skip_cooldown_time_trigger_this_page = true;
	}
}

// Function to check if the player performed the skip text / advance input
if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
{
	// check for skip advance
	try_text_skip_advance();
}

// Check if the timeline has run this frame
if (is_timeline_running)
{
	// It did, stop it
	timeline_running = false;
	// null the timeline index
	timeline_index = undefined;
	// Reset position
	timeline_position = 0;
	// Set the state bool
	is_timeline_running = false;
}

// DEBUGGING
if (enable_debug_tools)
{
	if (keyboard_check_pressed(ord("P"))) 
	{
		public_pause_dialogue();
	}
	if (keyboard_check_pressed(ord("O"))) 
	{
		public_resume_dialogue();
	}
}

