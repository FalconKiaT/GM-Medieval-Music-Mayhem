/// @description Insert description here
// You can write your code in this editor

if(global.max_level >= 1)
{
	audio_play_sound(snd_button_clicked, 1, false, get_volume_scaled(), 0, 2);
	room_goto(rm_dialogue_level1_);
}