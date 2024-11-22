/// @description Set up reciever

reciever = new Receiver();

reciever.add(RESULT_SCREEN.DISABLE_VICTORY_SHIELD, function() 
{
    instance_destroy();
});