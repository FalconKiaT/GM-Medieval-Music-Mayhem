// Feather disable GM2017
// Compilation of functions to help in doing things in the game

/// @desc Play a sound only if it isn't already playing
/// @param sound_id - The sound to play
/// @param do_loop - Loop the sound?
function play_sound_only_if_not_playing(sound_id, do_loop) {
    if (!audio_is_playing(sound_id)) 
	{
        audio_play_sound(sound_id, 1, do_loop, get_volume_scaled());
    }
}