// Feather disable GM2017
// Reciever
receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
    instance_deactivate_all(true)
	instance_deactivate_object(obj_game_manager);
	global.current_game_state = GAME_STATES.PLAY;
	room_goto(rm_dialogue_level3_intro)
});

//Checks level
if (room_exists(rm_dialogue_level1_intro)){
	
	global.current_game_state = GAME_STATES.DIALOGUE
	instance_activate_all()
	
}