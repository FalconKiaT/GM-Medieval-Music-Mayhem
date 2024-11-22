/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_left))
{
	AnimationSet("LEFT");
	last_player_animation = "LEFT"
}
else if(keyboard_check_pressed(vk_right))
{
	AnimationSet("RIGHT");
	last_player_animation = "RIGHT"
}
else if(keyboard_check_pressed(vk_up))
{
	AnimationSet("UP");
	last_player_animation = "UP"
}
else {
	AnimationSet(last_player_animation);	
}

//Run set animations
AnimationStep();