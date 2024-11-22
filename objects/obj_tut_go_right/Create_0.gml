/// @description Insert description here
// You can write your code in this editor

// Set up recievers
reciever = new Receiver();

reciever.add(TUTORIAL_SCREEN.DISABLE_RIGHT_ARROW, function() 
{
    visible = false
});

reciever.add(TUTORIAL_SCREEN.ENABLE_RIGHT_ARROW, function() 
{
    visible = true
});