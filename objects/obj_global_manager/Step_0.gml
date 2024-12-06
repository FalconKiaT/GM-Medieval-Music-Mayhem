/// @description Insert description here
// You can write your code in this editor
if(global.current_game_state != GAME_STATES.MENU)
{
	audio_stop_sound(snd_menu_music)	
}
else
{
	// Make sure sound gets scaled
	audio_sound_gain(snd_menu_music, get_volume_scaled(), 0)
}

