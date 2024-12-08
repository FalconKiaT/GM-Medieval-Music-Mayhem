/// @description Subscribe to event

// Literally its only purpose is to switch the room when the dialogue finishes xd

receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
    // Go to target room upon finishing
	room_goto(rm_mainMenu)
});