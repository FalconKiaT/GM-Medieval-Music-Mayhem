/// @description Set up reciever

// Set up recievers
reciever = new Receiver();

reciever.add(TUTORIAL_SCREEN.DISABLE_LEFT_ARROW, function() 
{
    visible = false
});

reciever.add(TUTORIAL_SCREEN.ENABLE_LEFT_ARROW, function() 
{
    visible = true
});

// Since we start on page 1 in the tutorial, this arrow starts as disabled
visible = false