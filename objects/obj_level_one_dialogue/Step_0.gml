// checks for dialogue being finsihed
if (!obj_dialogue_controller.public_is_dialogue_visible()){
		instance_deactivate_all(true)
		room_goto(rm_mock_level1_prototype)
		global.current_game_state = GAME_STATES.PLAY;
	
	
	
}


