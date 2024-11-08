//Checks level
if (room_exists(rm_dialogue_level1_)){
	
	global.current_game_state = GAME_STATES.DIALOGUE
	if (instance_exists(obj_dialogue_controller)){obj_dialogue_controller.public_trigger_dialogue("LEVEL1")}
	
}