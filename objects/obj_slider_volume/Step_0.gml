// Feather disable GM2017
//handle button interaction
if(mouse_check_button(mb_left))
{
	var buttonX = x + (sprite_width * progress);
	var buttonY = y;
	var buttonRadius = sprite_get_width(spr_slider_button) / 2;
	//check button is selected
	if (point_in_circle(mouse_x, mouse_y, buttonX, buttonY, buttonRadius)){
		selected = true;
	}
}

if(!mouse_check_button(mb_left))
{
	selected = false;
}

//adjust slider settings
if(selected)
{
	progress = clamp((mouse_x-x)/sprite_width, 0, max_value);
	global.volume = progress * global.max_volume_slider;
}

// Make sure main menu music gets scaled so the player can check the audio they just modified
audio_sound_gain(snd_menu_music, get_volume_scaled(), 0)