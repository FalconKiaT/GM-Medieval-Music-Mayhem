
// Dont do anything if not visible
if (!visible)
{
	return;
}

// Switch to darkened sprite when pressed
sprite_index = spr_button_main_menu_pressedUI_assets
audio_play_sound(snd_button_clicked,1,false, get_volume_scaled());