/// @description Darken

// Dont do anything if not visible
if (!visible)
{
	return;
}

sprite_index = spr_button_restart_pressed
audio_play_sound(snd_button_clicked,1,false, get_volume_scaled());