/// @description Declare Variables

// STATES
are_screens_moving = false
num_of_tutorial_screens = 3;
current_screen = 1;

// TIMER
is_timer_running = false;
timer_count = 0;

// RECIEVER

reciever = new Receiver();

reciever.add(TUTORIAL_SCREEN.PLAYER_CLICKED_LEFT, function() 
{
    // Only do a move if the current tutorial is not the leftmost one
	if (current_screen > 1 && !are_screens_moving)
	{
		// Execute animation
		broadcast(TUTORIAL_SCREEN.SHIFT_LEFT)
		
		// Disable arrows in the meanwhile
		broadcast(TUTORIAL_SCREEN.DISABLE_LEFT_ARROW)
		broadcast(TUTORIAL_SCREEN.DISABLE_RIGHT_ARROW)
		
		// Decrease screen index
		current_screen -= 1
		
		// Run timer
		are_screens_moving = true;
		is_timer_running = true;
		timer_count = 0;
	}
});

reciever.add(TUTORIAL_SCREEN.PLAYER_CLICKED_RIGHT, function() 
{
	show_debug_message("Hello")
	// Only do a move if the current tutorial is not the rightmost one
	if (current_screen < num_of_tutorial_screens && !are_screens_moving)
	{
		// Execute animation
		broadcast(TUTORIAL_SCREEN.SHIFT_RIGHT)
		
		// Disable arrows in the meanwhile
		broadcast(TUTORIAL_SCREEN.DISABLE_LEFT_ARROW)
		broadcast(TUTORIAL_SCREEN.DISABLE_RIGHT_ARROW)
		
		// Increase screen index
		current_screen += 1
		
		// Run timer
		are_screens_moving = true;
		is_timer_running = true;
		timer_count = 0;
	}
});