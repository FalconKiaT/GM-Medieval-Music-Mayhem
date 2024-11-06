/// @description Set up Custom Typewritter Events

// <------------------------> EVENTS <------------------------>

// Function to shake the dialogue box with varying amounts of intensity, 0 is none and the higher, the number the more intense
function shake_dialog_box(_intensity, _duration)
{
	// Check if its not already shaking
	if (is_dialogue_shaking)
	{
		// Oops, already shaking, dont do anything
		show_debug_message("ERROR! Dialogue is already shakin, ignoring...");
		return;
	}
	
	// Shake
	is_dialogue_shaking = true;
	dialogue_shake_intensity = _intensity;
	// FIXME: Lock dialogue skip if running???
	alarm[1] = game_get_speed(gamespeed_fps) * _duration;
}

// Add shake dialogue box event
// Format: [shake_dialogue_box, intensity, duration]
scribble_typists_add_event("shake_dialogue_box", shake_dialog_box_script);

// Function to lock the skip
function lock_skip()
{
	is_skip_locked_by_event = true;
}

// Add lock skip event
// Format: [lock_skip]
scribble_typists_add_event("lock_skip", lock_skip_script);

// Function to unlock the skip
function unlock_skip()
{
	is_skip_locked_by_event = false;
}

// Add unlock skip event
// Format: [unlock_skip]
scribble_typists_add_event("unlock_skip", unlock_skip_script);


// Function to set the portait to the left
function portrait_set_left()
{
	// Check if we need to flip the current sprite
	if (dialogue_current_type != DIALOGUE_TYPE.PORTRAIT_LEFT)
	{
		// Set the dialogue type
		dialogue_current_type = DIALOGUE_TYPE.PORTRAIT_LEFT;
		// Check for flip
		check_and_perform_sprite_flip();
	}
}

// Add event
// Format: [set_portrait_left]
scribble_typists_add_event("set_portrait_left", portrait_set_left_script);


// Function to set the portait to the left
function portrait_set_right()
{
	// Check if we need to flip the current sprite
	if (dialogue_current_type != DIALOGUE_TYPE.PORTRAIT_RIGHT)
	{
		// Set the dialogue type
		dialogue_current_type = DIALOGUE_TYPE.PORTRAIT_RIGHT;
		// Check for flip
		check_and_perform_sprite_flip();
	}
}

// Add event
// Format: [set_portrait_right]
scribble_typists_add_event("set_portrait_right", portrait_set_right_script);


// Function to set the dialogue box to only display text
function set_only_text()
{
	dialogue_general_typist.sound(snd_general_dialogue, main_typist_overlap, main_typist_min_pitch, main_typist_max_pitch, main_typist_gain);
	dialogue_current_type = DIALOGUE_TYPE.ONLY_TEXT;
}

// Add event
// Format: [set_only_text]
scribble_typists_add_event("set_only_text", set_only_text_script);

// Function to go to next page in dialogue without prompting for click
function skip_to_next_page()
{
	// Check if there's a next Page
	current_page_idx += 1
	if (current_page_idx >= page_amount)
	{
		// Close
		array_resize(page_list, 0);
		current_page_idx = 0;
		page_amount = 0;
		close_dialogue_box();
	}
	// Else, Go to next page
}

// Add event
// Format: [skip_to_next_page]
scribble_typists_add_event("skip_to_next_page", skip_to_next_page_script);

// Function to switch the character sprite being displayer
function change_character_portrait(target)
{
	var trimmed_string = string_trim(target);
	var sprite_obj = sprite_string_dict[? trimmed_string];
	// check if we found a spirte object
	if (is_undefined(sprite_obj))
	{
		// Failed to find in dictionary
		show_debug_message("Sprite not found: " + string(trimmed_string) + "\nError thrown at User Event 2 In Dialogue Controller");
		return;
	}
	
	// Set it as the current sprite, then check for flip
	current_potrait_sprite = sprite_obj;
	check_and_perform_sprite_flip();
	
	// Now set the typewritter sound to the one belonging to the new sprite
	var _sound_to_set = character_sound_dict[? sprite_obj];
	dialogue_general_typist.sound(_sound_to_set, main_typist_overlap, main_typist_min_pitch, main_typist_max_pitch, main_typist_gain);
}

// Add event
// Format: [change_character, sprite_name]
scribble_typists_add_event("change_character", change_character_script);









