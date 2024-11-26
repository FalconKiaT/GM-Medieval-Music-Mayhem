// Feather disable GM2017
/// @description Set up variables

/* IAN NOTE:
 * All the functions and variables meant to be accessed by outsiders are
 * pre-appended with the word "public."
 * Please dont trigger or modify anything that isnt labeled with public :(
 */
 
// <------------------------> NOTIFICATION SYSTEM <------------------------>
receiver = new Receiver();

receiver.add(MESSAGES.GAME_PAUSED, function() {
    public_pause_dialogue();
});

receiver.add(MESSAGES.GAME_RESUMED, function() {
    public_resume_dialogue();
});


// <------------------------> CONSTANTS <------------------------>

// Dialogue Space Settings
const_dialogue_box_height = 200;
const_inbetween_space = 30; // The space between the portrait square and the text box

// Outer Margains
const_left_margain = 40;
const_bottom_margain = 40;
const_right_margain = 40;

// Text box inner margains and values
const_inner_text_box_margain = 20;

// Portrait inner margains
const_inner_portrait_margain = 10;

// Text Box Constants
const_inner_text_box_height = const_dialogue_box_height - 2 * const_inner_text_box_margain;
const_next_arrow_offset = new vector(sprite_get_width(spr_next_arrow) + 12, sprite_get_height(spr_next_arrow) + 10)
const_next_arrow_sprite_width = sprite_get_width(spr_next_arrow);
const_next_arrow_sprite_height = sprite_get_height(spr_next_arrow);
const_speaker_name_shift_amount = 32

// Portrait box constants
const_portrait_box_width = const_dialogue_box_height;
const_inner_portrait_width = const_dialogue_box_height - 2 * const_inner_portrait_margain;
const_inner_portrait_height = const_dialogue_box_height - 2 * const_inner_portrait_margain;

// Dialogue Box Sprite Constants
const_dialogue_box_sprite_width = sprite_get_width(spr_dialogue_box);
const_dialogue_box_sprite_height = sprite_get_height(spr_dialogue_box);

// Typewritter variables
const_skip_cooldown = 0.4; // In seconds
const_player_speaker_name = "Player"
const_king_speaker_name = "King"
const_player_speaker_color = "#ADD8E6"
const_king_speaker_color = "#90EE90"

// Opening animation variables
const_opening_anim_duration = 0.2; // In seconds

// <------------------------> MUTATING VARIABLES <------------------------>

// <------------------------> STATES <------------------------>
dialogue_current_state = DIALOGUE_STATE.INACTIVE;
is_dialogue_paused = false;
dialogue_current_type = DIALOGUE_TYPE.ONLY_TEXT; 
text_printing_state = PRINTING_STATE.FINISHED; // State of the typewritter
is_checking_for_input = false; // bool to block user skip while false
did_skip_cooldown_time_trigger_this_page = false;
is_skip_advance_on_cooldown = false;
is_skip_locked_by_event = false;
should_dialogue_display_name = false;
is_dialogue_visible = false;
is_timeline_running = false;

// <------------------------> ANCHORS <------------------------>

// Screen Anchors
bottom_left_anchor = new vector(0,0);
bottom_right_anchor = new vector(0,0);

// Dialogue Zone Anchors
diagzone_top_left = new vector(0,0);
diagzone_top_right = new vector(0,0);
diagzone_bottom_left = new vector(0,0);
diagzone_bottom_right = new vector(0,0);

// <------------------------> TEXT BOX COORDS AND VALUES <------------------------>

// Text Box Coordinates and values
outer_text_box_top_left = new vector(0,0);
outer_text_box_top_right = new vector(0,0);
inner_text_box_top_left = new vector(0,0);

next_arrow_top_left = new vector(0,0);
inner_text_box_width = 0;
outer_text_box_width = 0;

// <------------------------> PORTRAIT BOX COORDS AND VALUES <------------------------>

// Portrait Box coordinates and values
outer_portrait_top_left = new vector(0,0);
outer_portrait_top_right = new vector(0,0);
inner_portrait_top_left = new vector(0,0);

// Current speaker name and color strings
current_speaker_str = "NULL!"
current_speaker_color_str = "NULL!"

// <------------------------> SPRITE VALUES <------------------------>

// Current sprite to draw from
current_potrait_sprite = spr_wiz_neutral;
// Is current sprite flipped
is_sprite_flipped = false;
// Base animation speed
base_anim_speed = 0.2





// <------------------------> STRING TO SPRITE DICTIONARY <------------------------>

// This dictionary is needed because the scribble library can only handle parameters with strings
sprite_string_dict = ds_map_create();

// King
sprite_string_dict[? "spr_king_happy"] = spr_king_happy;
sprite_string_dict[? "spr_king_neutral"] = spr_king_neutral;
sprite_string_dict[? "spr_king_upset_angry"] = spr_king_upset_angry;

// Player
sprite_string_dict[? "spr_wiz_angry"] = spr_wiz_angry;
sprite_string_dict[? "spr_wiz_neutral"] = spr_wiz_neutral;
sprite_string_dict[? "spr_wiz_shocked"] = spr_wiz_shocked;


// <------------------------> PORTRAIT SPRITE DIRECTIOND DICTIONARY <------------------------>

// Dictionary of sprite and booleans to know which way they face and check if we need to flip them
sprite_directions_dict = ds_map_create();

// Add sprites and their respective directions (true for looking left, false for looking right)

// King
sprite_directions_dict[? spr_king_happy] = true;
sprite_directions_dict[? spr_king_neutral] = true;
sprite_directions_dict[? spr_king_upset_angry] = true;

// Player
sprite_directions_dict[? spr_wiz_angry] = false;
sprite_directions_dict[? spr_wiz_neutral] = false;
sprite_directions_dict[? spr_wiz_shocked] = false;

// <------------------------> PORTRAIT SPRITE SOUNDS DICTIONARY <------------------------>

// Dictionary to set the typewritter sound when we switch characters they play different sounds when they speak
character_sound_dict = ds_map_create();

// King
character_sound_dict[? spr_king_happy] = snd_king_dialogue;
character_sound_dict[? spr_king_neutral] = snd_king_dialogue;
character_sound_dict[? spr_king_upset_angry] = snd_king_dialogue;

// Player
character_sound_dict[? spr_wiz_angry] = snd_player_dialogue;
character_sound_dict[? spr_wiz_neutral] = snd_player_dialogue;
character_sound_dict[? spr_wiz_shocked] = snd_player_dialogue;

// <------------------------> SPRITE TO SPEAKER NAME DICTIONARY <------------------------>

// This dictionary is needed because the scribble library can only handle parameters with strings
speaker_name_dict = ds_map_create();
speaker_color_dict = ds_map_create();

// King
speaker_name_dict[? spr_king_happy] = const_king_speaker_name;
speaker_name_dict[? spr_king_neutral] = const_king_speaker_name;
speaker_name_dict[? spr_king_upset_angry] = const_king_speaker_name;
speaker_color_dict[? const_king_speaker_name] = const_king_speaker_color;

// Player
speaker_name_dict[? spr_wiz_angry] = const_player_speaker_name;
speaker_name_dict[? spr_wiz_neutral] = const_player_speaker_name;
speaker_name_dict[? spr_wiz_shocked] = const_player_speaker_name;
speaker_color_dict[? const_player_speaker_name] = const_player_speaker_color;

// <------------------------> STRING TO TIMELINE DICTIONARY <------------------------>

// This dictionary is needed because the scribble library can only handle parameters with strings
timeline_string_dict = ds_map_create();

timeline_string_dict[? "tl_test"] = tl_test;









// <------------------------> OPENING ANIMATION VALUES <------------------------>

// Opening animation variables
opening_anim_scaler = 0; // Mutating value

// <------------------------> TYPIST SETTINGS <------------------------> 

// Typist variables for the text typewritter
text_speed = 1;
text_smooth = 0; // from [0 to 1]. On 0 character appears instantly, on 1 it slowly fades in
main_typist_min_pitch = 1;
main_typist_max_pitch = 2;
main_typist_overlap = 0;
main_typist_gain = 1;
dialogue_general_typist = scribble_typist();
dialogue_general_typist.in(text_speed, text_smooth);

// TYPEWRITTER EVENTS SET UP FURTHER BELOW

// <------------------------> DIALOGUE PAGES SETUP <------------------------> 

// We must set up the dialogue functions first
event_user(1);

// Page Variables
current_page_idx = 0;
page_list[0] = "TEMP TEXT PLACEHOLDER, SHOULD BE OVERWRITTEN"
page_amount = 0;

// Dialogue Events variables
is_dialogue_shaking = false;
current_shake_func = 1;
dialogue_shake_intensity = 0;



// ****************************************************************** DEBUGGING
if (enable_debug_tools)
{
	// Test run
	dialogue_current_state = DIALOGUE_STATE.OPENING;
	is_skip_advance_on_cooldown = false;
	set_up_dialogue_id(DIALOGUE_ID.ONE_LINE);
}

// ******************************************************************

// <------------------------> OBJECT WIDE FUNCTIONS <------------------------>

// Function to open the dialog box from the game 
// TODO: Test if this works
function public_trigger_dialogue(target)
{
	// Set the dialogue ID
	switch (target)
	{
		case "DEMO":
			set_up_dialogue_id(DIALOGUE_ID.DEMO);
		break;
		
		case "ONE_LINE":
			set_up_dialogue_id(DIALOGUE_ID.ONE_LINE);
			break;
		case "LEVEL1":
			set_up_dialogue_id(DIALOGUE_ID.LEVEL1);
			break;
		
		default:
			show_debug_message("ERROR! Dialogue ID not recognized! Thrown at obj_dialogue_controller -> Create ->  public_trigger_dialogue(target)")
			return;
	}
	
	// Start opening the dialogue box
	dialogue_current_state = DIALOGUE_STATE.OPENING;
	is_dialogue_visible = true;
	// Broadcast that the dialogue started opening
	broadcast(MESSAGES.DIALOGUE_STARTED);
}

// Function to close the dialogue box even if its writting
function public_force_close_dialogue_box()
{
	// FIXME: Edge cases will definitly be present here, not finished
	dialogue_current_state = DIALOGUE_STATE.CLOSING;
	text_printing_state = PRINTING_STATE.FINISHED;
	is_dialogue_shaking = false;
	is_skip_locked_by_event = false;
}

// Function to get the dialogue state as to not access the state variable directly
function public_get_dialogue_state()
{
	return dialogue_current_state
}

function public_is_dialogue_visible()
{
	return is_dialogue_visible;
}

// TODO: Consider adding buttons for later in the game

// Function to be called when the game is paused
function public_pause_dialogue()
{
	// Only execute if the dialogue wasnt already paused before
	if (is_dialogue_paused)
	{
		return;
	}
	
	dialogue_general_typist.pause();
	previous_state_before_pause = dialogue_current_state;
	is_dialogue_paused = true;
}

// Function to be called when the game is resumed
function public_resume_dialogue()
{
	// Only execute if the dialogue was already paused before
	if (!is_dialogue_paused)
	{
		return;
	}
	
	dialogue_general_typist.unpause();
	is_dialogue_paused = false;
}

// Function used internally to close the dialogue window when the pages are exhausted
function close_dialogue_box()
{
	dialogue_current_state = DIALOGUE_STATE.CLOSING;
}

// Function to check if the target sprite must be flipped for the current dialogue layout
function check_and_perform_sprite_flip()
{
	var _is_looking_left = sprite_directions_dict[? current_potrait_sprite];
	// Perform the flip check based on the layout
	switch (dialogue_current_type)
	{
		case DIALOGUE_TYPE.PORTRAIT_LEFT:
			// Check if we need to flip it left
			if (_is_looking_left)
			{
				// The sprite is looking left, flip it to look right
				is_sprite_flipped = true;
			}
			else
			{
				// It was already looking at the right, dont flip
				is_sprite_flipped = false;
			}
			break
		
		case DIALOGUE_TYPE.PORTRAIT_RIGHT:
			// Check if we need to flip it right
			if (_is_looking_left)
			{
				// It was already looking at the left, dont flip
				is_sprite_flipped = false;
			}
			else
			{
				// The sprite is looking right, flip it to look left
				is_sprite_flipped = true;
			}
			break;
		
		default:
			show_debug_message("ERROR! Dialogue layout not defined. Thrown in check_and_perform_sprite_flip() -> Create -> obj_dialogue_controller");
			break;
	}
}

// function used to go to the next page of the dialogue
function dialogue_go_to_next_page()
{
	// Re-new the skip cooldown
	did_skip_cooldown_time_trigger_this_page = false;
	// Check if there's a next Page
	current_page_idx += 1
	if (current_page_idx >= page_amount)
	{
		// No next page, close dialogue box
		array_resize(page_list, 0);
		current_page_idx = 0;
		page_amount = 0;
		close_dialogue_box();
	}
	// Else, Go to next page
}

// <------------------------> UPDATE FUNCTION DECLARATIONS <------------------------>

// Function to stop shaking
function stop_dialogue_shake()
{
	if (is_dialogue_shaking) 
	{
		// Variable handling is managed by the typer event at User Event 2
		current_shake_func.override_timer(0);
	}
}

// Function to execute to either skip or advance text
function try_text_skip_advance()
{
	// Check if we can read input from player
	if (is_skip_advance_on_cooldown || is_skip_locked_by_event || is_dialogue_paused)
	{
		// We cant
		return;
	}
	
	// Check for user input
	var _do_advance = false;
	_do_advance = mouse_check_button_pressed(mb_left); // Check for left mouse click
	_do_advance = _do_advance || keyboard_check_pressed(vk_space); // Check for space bar
	_do_advance = _do_advance ||keyboard_check_pressed(vk_enter); // Check for enter
	
	// Dont do anything if no valid input was made
	if (!_do_advance)
	{
		return
	}

	// Player clicked, do something depending on the state
	switch (text_printing_state)
	{
		case PRINTING_STATE.PRINTING:
			// Skip to text printing complete
			dialogue_general_typist.skip();
			// Stop shaking if its happening
			stop_dialogue_shake();
			
			break;
		
		case PRINTING_STATE.FINISHED:
			// Stop dialogue shaking if its happening
			stop_dialogue_shake();
			// Go to next page
			dialogue_go_to_next_page();
			break;
		
		default:
			show_debug_message("ERROR! Printing state case not defined! Thrown in try_text_skip_advance() -> Create -> obj_dialogue_controller")
			return;
	}
	// Play dialogue page switch sound
	audio_play_sound(snd_dialogue_next_page, 1, false, 1, 0, 2);
}

// <------------------------> CUSTOM TYPEWRITTER EVENTS <------------------------>

// Set up the custom typewritter events
event_user(2)




