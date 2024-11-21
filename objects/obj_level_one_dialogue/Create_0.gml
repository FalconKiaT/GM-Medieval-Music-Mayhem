// Feather disable GM2017
// Reciever
receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
    instance_deactivate_all(true)
	room_goto(rm_mock_level1_prototype)
	global.current_game_state = GAME_STATES.PLAY;;
});

//Checks level
if (room_exists(rm_dialogue_level1_)){
	
	global.current_game_state = GAME_STATES.DIALOGUE
	if (instance_exists(obj_dialogue_controller)){obj_dialogue_controller.public_trigger_dialogue("LEVEL1")}
	
}