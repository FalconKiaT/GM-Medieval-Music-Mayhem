/// @description Restart Game

// Dont do anything if not visible
if (!visible)
{
	return;
}

//global.current_game_state = _pervious_game_state;
audio_stop_all();
score = 0;
health = 100;
room_restart();