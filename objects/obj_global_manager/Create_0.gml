

//leaving this here just in case
if(room_exists(rm_mainMenu)){
	global.current_game_state = GAME_STATES.MENU
}
if(global.current_game_state == GAME_STATES.MENU){
	audio_play_sound(snd_menu_music,10,true)
}