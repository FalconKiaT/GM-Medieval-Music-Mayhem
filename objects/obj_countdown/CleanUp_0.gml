/// @description Stop audio if playing
if (audio_is_playing(snd_countdown_one))
{
	audio_stop_sound(snd_countdown_one)
}

// clean up events
unsubscribe()
