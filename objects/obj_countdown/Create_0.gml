/// @description Play countdown audio + recievier

receiver = new Receiver();

receiver.add(MESSAGES.GAME_PAUSED, function() 
{
    // Interrupt countdown
	instance_destroy();
});

//global.current_game_state = GAME_STATES.TIMER
audio_play_sound(snd_countdown_one, 1, false, get_volume_scaled(), 0);