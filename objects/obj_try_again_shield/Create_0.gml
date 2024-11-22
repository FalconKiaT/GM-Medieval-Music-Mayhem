/// @description Set up reciever

reciever = new Receiver();

reciever.add(RESULT_SCREEN.DISABLE_TRY_AGAIN_SHIELD, function() 
{
    instance_destroy();
});
