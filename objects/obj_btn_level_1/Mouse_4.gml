/// @description Insert description here
// You can write your code in this editor

if(global.max_level >= 1)
{
	// Play button clicked sound
	audio_play_sound(snd_button_clicked, 1, false, get_volume_scaled(), 0, 2);
	// Stop main menu music
	audio_stop_sound(snd_menu_music)
	// Go to level
	room_goto(rm_dialogue_level1_intro);
}