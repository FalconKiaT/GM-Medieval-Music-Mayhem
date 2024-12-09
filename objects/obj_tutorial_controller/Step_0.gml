/// @description Timer

if (is_timer_running)
{
	timer_count += get_delta_time();
	// Check if we finished, plus an offset to make sure
	if (timer_count >= tutorial_switch_duration + 0.01)
	{
		// Movement finished
		is_timer_running = false
		timer_count = 0;
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
	}
}