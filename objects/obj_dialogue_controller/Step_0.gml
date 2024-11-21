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

// Run timers
event_user(3);

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
}

// Function to check if the player performed the skip text / advance input
if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
{
	// check for skip advance
	try_text_skip_advance();
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




