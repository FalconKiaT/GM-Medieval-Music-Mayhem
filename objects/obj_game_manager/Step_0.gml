


if((health <= 0) && global.current_game_state == GAME_STATES.PLAY)
{
	global.current_game_state = GAME_STATES.OVER;//game over
	alarm[0] = room_speed * 10;// change room_speed forgot the other one
}
