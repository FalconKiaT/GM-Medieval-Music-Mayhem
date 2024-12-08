// Feather disable GM2017
// Reciever
receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
    instance_deactivate_all(true)
	instance_deactivate_object(obj_game_manager);
	global.current_game_state = GAME_STATES.PLAY;
	room_goto(rm_level1)
	
});

//Checks level
if (room_exists(rm_dialogue_level1_)){
	
	global.current_game_state = GAME_STATES.DIALOGUE
	if (instance_exists(obj_dialogue_cutscene_controller)){obj_dialogue_cutscene_controller.public_trigger_dialogue("LEVEL1")}
	instance_activate_all()
	
}