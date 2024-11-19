// level score and health
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text(room_width/2-150,room_height/2,"Score: " + string(score))// replace score with level high score if we are doing high scores
if(global.current_game_state == GAME_STATES.WIN){
	//only shows this if its a win
	draw_text(room_width/2,200,"WIN!")
	draw_text(room_width/2-150,room_height/2+100,"Health:")
	draw_healthbar(room_width/2-200,room_height/2+150,room_width/2+200,room_height/2+150+12,health,c_black,c_red,c_green,0,false,false)
}
else{
	draw_text(room_width/2+50,200,"FAILED WIZARDY!")
}
