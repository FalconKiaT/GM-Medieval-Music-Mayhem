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

// Screen shake effect timer
// WARNING: DOES NOT HANDLE STACKING
if (is_screen_shake_timer_running)
{
	// count up
	screen_shake_timer += 1 / game_get_speed(gamespeed_fps);
	if (screen_shake_timer >= screen_shake_current_duration)
	{
		// Finished
		screen_shake_timer = 0;
		screen_shake_current_duration = 0;
		dialogue_shake_intensity = 0;
		is_dialogue_shaking = false;
		is_screen_shake_timer_running = false;
		unlock_skip();
	}
}

