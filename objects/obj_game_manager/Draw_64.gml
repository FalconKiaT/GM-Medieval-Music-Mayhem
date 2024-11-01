if (global.current_game_state == GAME_STATES.PLAY){
	
	draw_set_halign(fa_center)
	draw_text(100,74,"Score: \n" + string(score))
	
	draw_healthbar(room_width/2-100,obj_player.y+200,room_width/2+100,obj_player.y+200+12,health,c_black,c_red,c_green,0,false,false)
}
