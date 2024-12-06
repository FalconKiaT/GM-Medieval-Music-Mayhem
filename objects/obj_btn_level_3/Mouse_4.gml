//play the third level if unlocked

if(global.max_level >= 2)
{
	audio_play_sound(snd_button_clicked, 1, false, 1, 0, 2);
	room_goto(rm_prototype); //replace with lvl 3
}