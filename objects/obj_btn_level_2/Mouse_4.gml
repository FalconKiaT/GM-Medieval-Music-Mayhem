//play the second level if unlocked

if(global.max_level >= 2)
{
	global.current_level =2;
	audio_play_sound(snd_button_clicked, 1, false, 1, 0, 2);
	audio_stop_all()
	room_goto(rm_dialogue_level2_intro); //replace with lvl 2
}