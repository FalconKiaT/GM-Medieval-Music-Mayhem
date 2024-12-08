// Feather disable GM2017
// Reciever
receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
	//global.current_game_state = GAME_STATES.PLAY;
	room_goto(rm_level1)
});