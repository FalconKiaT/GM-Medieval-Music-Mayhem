if (global.current_game_state == GAME_STATES.PLAY){
	
	draw_set_halign(fa_center)
	draw_text(100,74,"Score: \n" + string(score))

	
	
	
	
	
	draw_healthbar(192-10,100-52,192+10,100+52,health,c_black,c_red,c_green,3,false,false)
}
