/// @description Set GUI Elements

// Text Anchors

/*
score_text_offset = new vector(-20, -5)
healthbar_offset = new vector(-30,88)
healthbar_width_height = new vector(190,22);

score_text_anchor = new vector((room_width/2) + score_text_offset.x, room_height/2 + score_text_offset.y)
health_text_anchor = new vector(room_width/2 + healthbar_offset.x, room_height/2 + healthbar_offset.y)



// Play background music
//music_id = audio_play_sound(snd_menu_music, 1, true)
*/

// Boolean to only broadcast once
if(global.current_game_state == GAME_STATES.WIN){
	global.max_level+=1;
	show_debug_message(global.max_level)
}
did_broadcast = false