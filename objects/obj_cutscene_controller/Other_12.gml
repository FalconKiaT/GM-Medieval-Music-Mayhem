/// @description Set up Custom Typewritter Events

// <------------------------> EVENTS <------------------------>

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

// TODO: Add a function to flip to next BG Photo







