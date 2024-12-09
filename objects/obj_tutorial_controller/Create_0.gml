/// @description Declare Variables

// STATES
are_screens_moving = false
num_of_tutorial_screens = 4;
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
		start_timer();
	}
});

reciever.add(TUTORIAL_SCREEN.PLAYER_CLICKED_RIGHT, function() 
{
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
		start_timer();
	}
});

// Helper function to initiatie the timer
function start_timer()
{
	run_func_after_delay_seconds(tutorial_switch_duration + 0.01,
	function()
	{
		// Movement finished
		are_screens_moving = false;
		
		// re-enable arrows depending on index
		if (current_screen <= 1)
		{
			// No left screens left, only enable right
			broadcast(TUTORIAL_SCREEN.ENABLE_RIGHT_ARROW)
		}
		else if (current_screen >= num_of_tutorial_screens)
		{
			// No more right screens, only enable left
			broadcast(TUTORIAL_SCREEN.ENABLE_LEFT_ARROW)
		}
		else
		{
			// We have screens to both sides
			broadcast(TUTORIAL_SCREEN.ENABLE_RIGHT_ARROW)
			broadcast(TUTORIAL_SCREEN.ENABLE_LEFT_ARROW)
		}
	})
}