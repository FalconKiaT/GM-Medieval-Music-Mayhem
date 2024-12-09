// Feather disable GM2017
/// @description Set up Custom Typewritter Events

// <------------------------> EVENTS <------------------------>

// Function to lock the skip
function lock_skip()
{
	is_skip_locked_by_event = true;
}

// Typist-required definition. DO NOT USE
function lock_skip_typist(_element, _parameter_array, _character_index)
{
	lock_skip();
}


// Add lock skip event
// Format: [lock_skip]
scribble_typists_add_event("lock_skip", lock_skip_typist);









// Function to unlock the skip
function unlock_skip()
{
	is_skip_locked_by_event = false;
}

// Typist-required definition. DO NOT USE
function unlock_skip_typist(_element, _parameter_array, _character_index)
{
	unlock_skip();
}

// Add unlock skip event
// Format: [unlock_skip]
scribble_typists_add_event("unlock_skip", unlock_skip_typist);








// Function to shake the dialogue box with varying amounts of intensity, 0 is none and the higher, the number the more intense
function shake_dialog_box(_intensity, _duration)
{
	// Check if its not already shaking
	if (is_dialogue_shaking)
	{
		// Oops, already shaking, dont do anything
		show_debug_message("ERROR! Dialogue is already shaking, ignoring... Thrown in shake_dialog_box() -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Start Shaking
	dialogue_shake_intensity = _intensity;
	is_dialogue_shaking = true;
	
	// Create timed function
	var _timed_func = delayed_func_seconds_constructor(_duration, 
	function()
	{
		// Stop shaking
		current_shake_func = undefined;
		is_dialogue_shaking = false;
		dialogue_shake_intensity = 0;
	},
	function()
	{
		// Only run timer if dialogue is not paused
		return !is_dialogue_paused;
	});
	
	// Set the object field
	current_shake_func = _timed_func.get_id();
	
	// Run timed function
	run_func_after_delay_struct(_timed_func);
}

// Typist-required definition. DO NOT USE
function shake_dialog_box_typist(_element, _parameter_array, _character_index)
{
	var _intensity = real(_parameter_array[0]);
	var _duration = real(_parameter_array[1]);
	shake_dialog_box(_intensity, _duration);
}

// Add shake dialogue box event
// Format: [shake_dialogue_box, intensity, duration]
scribble_typists_add_event("shake_dialogue_box", shake_dialog_box_typist);









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
	should_dialogue_display_name = true;
}

// Typist-required definition. DO NOT USE
function portrait_set_left_typist(_element, _parameter_array, _character_index)
{
	portrait_set_left();
}

// Add event
// Format: [set_portrait_left]
scribble_typists_add_event("set_portrait_left",  portrait_set_left_typist);









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
	should_dialogue_display_name = true;
}

// Typist-required definition. DO NOT USE
function portrait_set_right_typist(_element, _parameter_array, _character_index)
{
	portrait_set_right();
}

// Add event
// Format: [set_portrait_right]
scribble_typists_add_event("set_portrait_right", portrait_set_right_typist);








// Function to set the dialogue box to only display text
function set_only_text()
{
	dialogue_general_typist.sound(snd_general_dialogue, main_typist_overlap, main_typist_min_pitch, main_typist_max_pitch, main_typist_gain);
	dialogue_current_type = DIALOGUE_TYPE.ONLY_TEXT;
	should_dialogue_display_name = false;
}

// Typist-required definition. DO NOT USE
function set_only_text_typist(_element, _parameter_array, _character_index)
{
	set_only_text();
}

// Add event
// Format: [set_only_text]
scribble_typists_add_event("set_only_text", set_only_text_typist);






// Function to set the dialogue to only text and no background
function set_only_text_no_background()
{
	dialogue_general_typist.sound(snd_general_dialogue, main_typist_overlap, main_typist_min_pitch, main_typist_max_pitch, main_typist_gain);
	dialogue_current_type = DIALOGUE_TYPE.NO_BACKGROUND_ONLY_TEXT;
	should_dialogue_display_name = false;
}

// Typist-required definition. DO NOT USE
function set_only_text_no_background_typist(_element, _parameter_array, _character_index)
{
	set_only_text_no_background();
}

// Add event
// Format: [set_only_text_no_bg]
scribble_typists_add_event("set_only_text_no_bg", set_only_text_no_background_typist);








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

// Typist-required definition. DO NOT USE
function skip_to_next_page_typist(_element, _parameter_array, _character_index)
{
	skip_to_next_page();
}

// Add event
// Format: [skip_to_next_page]
scribble_typists_add_event("skip_to_next_page", skip_to_next_page_typist);









// Function to switch the character sprite being displayer
// target_sprite = game maker sprite asset
function change_character_portrait(target_sprite)
{
	// Set it as the current sprite, then check for flip
	current_potrait_sprite = target_sprite;
	
	// Check if we need to flip the sprite
	var _is_looking_left = sprite_directions_dict[? target_sprite];
	// check if we found an entry on the dictionary
	if (is_undefined(_is_looking_left))
	{
		// Failed to find in dictionary
		show_debug_message("Sprite not found on the sprite_directions_dict dictionary: " + string(target_sprite) + "\nError thrown at change_character_portrait(target) -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Check if we need to flip the portrait sprite
	check_and_perform_sprite_flip();
	
	// Now set the typewritter sound to the one belonging to the new sprite
	var _sound_to_set = character_sound_dict[? target_sprite];
	// check if we found an entry on the dictionary
	if (is_undefined(_sound_to_set))
	{
		// Failed to find in dictionary
		show_debug_message("Sprite not found on the character_sound_dict dictionary: " + string(target_sprite) + "\nError thrown at change_character_portrait(target) -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Set dialogue sound
	dialogue_general_typist.sound(_sound_to_set, main_typist_overlap, main_typist_min_pitch, main_typist_max_pitch, main_typist_gain);
	
	// Get the speaker's name
	var _speaker_name_str = speaker_name_dict[? target_sprite];
	// check if we found an entry on the dictionary
	if (is_undefined(_speaker_name_str))
	{
		// Failed to find in dictionary
		show_debug_message("Speaker name not found on the speaker_name_dict dictionary: " + string(target_sprite) + "\nError thrown at change_character_portrait(target) -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Get the speakers color
	var _speaker_color_str = speaker_color_dict[? _speaker_name_str];
	// check if we found an entry on the dictionary
	if (is_undefined(_speaker_color_str))
	{
		// Failed to find in dictionary
		show_debug_message("Speaker color not found on the speaker_color_dict dictionary: " + string(target_sprite) + "\nError thrown at change_character_portrait(target) -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// All good, set the name and color
	current_speaker_str = _speaker_name_str
	current_speaker_color_str = _speaker_color_str
}

// Typist-required definition. DO NOT USE
function change_character_portrait_typist(_element, _parameter_array, _character_index)
{
	// Get the argument and trim it
	var _target_sprite_str = string_trim(_parameter_array[0]);
	
	var sprite_obj = sprite_string_dict[? _target_sprite_str];
	// check if we found a sprite object
	if (is_undefined(sprite_obj))
	{
		// Failed to find in dictionary
		show_debug_message("Sprite not found: " + string(_target_sprite_str) + "\nError thrown at change_character_portrait_typist -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Call the function
	change_character_portrait(sprite_obj);
}

// Add event
// Format: [change_character, sprite_name]
scribble_typists_add_event("change_character", change_character_portrait_typist);










// Function to execute code of a given moment of a timeline
function execute_timeline_moment(_timeline_target, _moment_integer)
{
	// Link the timeline asset to this object
	timeline_index = _timeline_target;
	// Set the moment
	timeline_position = _moment_integer;
	// Start it
	timeline_running = true;
	// Set the state bool
	is_timeline_running = true;
}


// Typist-required definition. DO NOT USE
function execute_timeline_moment_typist(_element, _parameter_array, _character_index)
{
	// Get parameters
	var _timeline_target_str = string_trim(_parameter_array[0]);
	var _integer_moment_str = string_trim(_parameter_array[1]);
	
	// Check if the timeline asset is defined on the dictionary
	var _timeline_asset = timeline_string_dict[? _timeline_target_str];
	// check if we found a spirte object
	if (is_undefined(_timeline_asset))
	{
		// Failed to find in dictionary
		show_debug_message("Timeline not found: " + string(_timeline_target_str) + "\nError thrown at execute_timeline_moment_typist() -> User Event 2 -> obj_dialogue_controller");
		return;
	}
	
	// Cast the integer moment string
	var _integer_moment = int64(_integer_moment_str);
	
	// Call function
	execute_timeline_moment(_timeline_asset, _integer_moment)
}

// Add event
// Format: [execute_timeline_moment, timeline_name, integer_moment]
scribble_typists_add_event("execute_timeline_moment", execute_timeline_moment_typist);



// Finished adding events
global.typewritter_events_defined = true;










