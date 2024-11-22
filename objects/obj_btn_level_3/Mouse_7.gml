//play the third level
	
if(global.max_level >= 2)
{
	image_blend = make_colour_rgb(255, 255, 255); //make button white again
	audio_play_sound(snd_button_clicked, 1, false, 1, 0, 2);
	audio_stop_sound(global.main_menu_music);
	room_goto(rm_prototype); //replace with lvl 3
}