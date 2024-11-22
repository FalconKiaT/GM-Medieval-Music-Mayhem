/// @description Set up reciever

reciever = new Receiver();

reciever.add(RESULT_SCREEN.DISABLE_ONE_STARS, function() 
{
    instance_destroy();
});