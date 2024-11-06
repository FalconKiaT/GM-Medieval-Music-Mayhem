function score_health_gui(){
	
	if (global.current_game_state == GAME_STATES.PLAY || global.current_game_state == GAME_STATES.PAUSE ){
	
		draw_set_halign(fa_center)
		draw_text((room_width),54,"Score: \n" + string(score))
	
		draw_healthbar(room_width/2-100,room_height/2+350,room_width/2+200,room_height/2+350+12,health,c_black,c_red,c_green,0,false,false)
	}
}
score_health_gui()