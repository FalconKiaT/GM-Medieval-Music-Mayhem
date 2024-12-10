/// @description Set up reciever

// Set up recievers
reciever = new Receiver();

reciever.add(TUTORIAL_SCREEN.SHIFT_LEFT, function() 
{
    TweenEasyMove(x, y, x + obj_tutorial_controller.move_distance, y, 0, obj_tutorial_controller.tutorial_switch_duration * 60, EaseInOutQuad)
});

reciever.add(TUTORIAL_SCREEN.SHIFT_RIGHT, function() 
{
	TweenEasyMove(x, y, x - obj_tutorial_controller.move_distance, y, 0, obj_tutorial_controller.tutorial_switch_duration * 60, EaseInOutQuad)
});