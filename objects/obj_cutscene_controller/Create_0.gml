/// @description Set up variables

/* IAN NOTE:
 * All the functions and variables meant to be accessed by outsiders are
 * pre-appended with the word "public."
 * Please dont trigger or modify anything that isnt labeled with public :(
 */

// <------------------------> CONSTANTS <------------------------>

// Cutscene Space Settings
const_cutscene_box_height = 200;

// Outer Margains
const_left_margin = 40;
const_bottom_margin = 40;
const_right_margin = 40;

// TODO: Do a debug draw of lines to show text box

// Cutscene Box Constants
const_inner_cutscene_box_height = const_cutscene_box_height - 2 * const_inner_cutscene_box_margin;
const_next_arrow_offset = new vector(sprite_get_width(spr_next_arrow) + 12, sprite_get_height(spr_next_arrow) + 10)
const_next_arrow_sprite_width = sprite_get_width(spr_next_arrow);
const_next_arrow_sprite_height = sprite_get_height(spr_next_arrow);

// Typewriter variables
const_skip_cooldown = 0.4; // In seconds

// Opening animation variables
const_opening_anim_duration = 0.2; // In seconds

// <------------------------> MUTATING VARIABLES <------------------------>

// <------------------------> STATES <------------------------>
cutscene_current_state = CUTSCENE_STATE.INACTIVE;
is_cutscene_paused = false;
text_printing_state = PRINTING_STATE.FINISHED; // State of the typewriter
is_checking_for_input = false; // bool to block user skip while false
is_skip_advance_on_cooldown = false;
is_skip_locked_by_event = false;
is_cutscene_playing = false;

// <------------------------> TIMERS <------------------------>

is_skip_advance_timer_running = false;
is_screen_shake_timer_running = false;

// Mutating timers
skip_advance_timer = 0;

// <------------------------> ANCHORS <------------------------>

// Screen Anchors
bottom_left_anchor = new vector(0,0);
bottom_right_anchor = new vector(0,0);

// Cutscene Text Anchors
text_anchor_top_left = new vector(0,0);

// <------------------------> CUTSCENE BOX COORDS AND VALUES <------------------------>

// Cutscene Box Coordinates and values
outer_cutscene_box_top_left = new vector(0,0);
outer_cutscene_box_top_right = new vector(0,0);
inner_cutscene_box_top_left = new vector(0,0);

next_arrow_top_left = new vector(0,0);
inner_cutscene_box_width = 0;
outer_cutscene_box_width = 0;

// <------------------------> TYPIST SETTINGS <------------------------> 

// Typist variables for the text typewriter
text_speed = 1;
text_smooth = 0; // from [0 to 1]. On 0 character appears instantly, on 1 it slowly fades in
main_typist_min_pitch = 1;
main_typist_max_pitch = 2;
main_typist_overlap = 0;
main_typist_gain = 1;
cutscene_general_typist = scribble_typist();
cutscene_general_typist.in(text_speed, text_smooth);

// <------------------------> CUTSCENE PAGES SETUP <------------------------> 

// We must set up the cutscene functions first
event_user(1);

// Page Variables
current_page_idx = 0;
page_list[0] = "TEMP TEXT PLACEHOLDER, SHOULD BE OVERWRITTEN"
page_amount = 0;

// ****************************************************************** DEBUGGING DELETE ME
// Test run
//cutscene_current_state = CUTSCENE_STATE.OPENING;
//is_skip_advance_on_cooldown = false;
//set_up_cutscene_id(CUTSCENE_ID.ONE_LINE);
// ******************************************************************

// <------------------------> OBJECT WIDE FUNCTIONS <------------------------>

// Function to open the cutscene box from the game 
// TODO: Test if this works
function public_trigger_cutscene(target)
{
	// Set the cutscene ID
	switch (target)
	{
		case "DEMO":
			set_up_cutscene_id(CUTSCENE_ID.DEMO);
		break;
		
		default:
			show_debug_message("ERROR! Cutscene ID not recognized! Thrown at obj_cutscene_controller -> Create ->  public_trigger_cutscene(target)")
			return;
	}
	// Start playing the cutscene box
	cutscene_current_state = CUTSCENE_STATE.PLAYING;
	is_cutscene_playing = true;
}

// Function to get the cutscene state as to not access the state variable directly
function public_get_cutscene_state()
{
	return cutscene_current_state
}

function public_is_cutscene_visible()
{
	return is_cutscene_playing;
}

// TODO: Consider adding buttons for later in the game

// Function to be called when the game is paused
function public_pause_cutscene()
{
	// Only execute if the cutscene wasn't already paused before
	if (is_cutscene_paused)
		return;
	
	// Do other pausing stuff here
	cutscene_current_state = CUTSCENE_STATE.PAUSED;
	is_cutscene_paused = true;
}

// Function for unpausing a cutscene
function public_unpause_cutscene()
{
	// Check to see if cutscene is paused
	if (!is_cutscene_paused)
	{
		return;
	}
	
	// Do other unpausing stuff here
	is_cutscene_paused = false;
}

// <------------------------> PRIVATE AND PRIVATE EXECUTIONS <------------------------>


