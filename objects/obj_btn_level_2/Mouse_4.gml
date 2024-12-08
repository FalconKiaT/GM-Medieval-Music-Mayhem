//play the second level if unlocked

if(global.max_level >= 2)
{
	// Play button clicked sound
	audio_play_sound(snd_button_clicked, 1, false, get_volume_scaled(), 0, 2);
	// Stop main menu music
	audio_stop_sound(snd_menu_music)
	// Go to level
	room_goto(rm_prototype); //replace with lvl 2
}