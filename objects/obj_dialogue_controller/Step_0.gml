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
		
		// Animate the dialogue box opening
		var scale_speed = 1 / (game_get_speed(gamespeed_fps) * opening_anim_duration);
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
		// Animate the dialogue box closing
		var scale_speed = 1 / (game_get_speed(gamespeed_fps) * opening_anim_duration);
		opening_anim_scaler -= scale_speed;

		// Check if we've finished closing
		if (opening_anim_scaler <= 0)
		{
			// Fully closed
			opening_anim_scaler = 0;
			dialogue_current_state = DIALOGUE_STATE.INACTIVE;
			// Any additional actions when fully closed
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
}

// Check user input
// Player has clicked left on the mouse, check the state of the dialogue
// We dont need to check the text state since we do that through a 
// function in the typist defined in create
// Function to check if the player clicked the skip text / advance button
if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
{
	// check for skip advance
	try_text_skip_advance();
}


