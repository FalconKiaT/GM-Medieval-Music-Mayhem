//play the third level if unlocked

if(global.max_level >= 3)
{
	// Play button clicked sound
	audio_play_sound(snd_button_clicked, 1, false, get_volume_scaled(), 0, 2);
	// Stop main menu music
	audio_stop_sound(snd_menu_music)
	// Go to level
	global.current_level = 3;
	room_goto(rm_prototype); //replace with lvl 3
}