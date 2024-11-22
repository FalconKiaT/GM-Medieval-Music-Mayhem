/// @description Run Timers

// This event is meant to run the different timers associated with the dialogue system
// Im not using the whole "alarm[x] = frames * seconds" because I cant pause that midway through

// Dont run timers if the dialogue is paused
if (is_dialogue_paused)
{
	return;
}

// Skip time cooldown timer, to stop the player from accidentally skipping the next
// dialogue due to clicking left too fast
if (is_skip_advance_timer_running)
{
	// Count up
	skip_advance_timer += 1 / game_get_speed(gamespeed_fps);
	if (skip_advance_timer >= const_skip_cooldown)
	{
		// Finished
		is_skip_advance_on_cooldown = false;
		is_skip_advance_timer_running = false;
		skip_advance_timer = 0;
	}
}

