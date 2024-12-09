/// @description Insert description here
// You can write your code in this editor

// Literally its only purpose is to switch the room when the dialogue finishes xd

receiver = new Receiver();

receiver.add(MESSAGES.DIALOGUE_FINISHED, function() 
{
    room_goto(rm_mainMenu)
});