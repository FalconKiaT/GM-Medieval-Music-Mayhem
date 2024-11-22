/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_left))
{
	AnimationSet("LEFT");
}
else if(keyboard_check(vk_right))
{
	AnimationSet("RIGHT");
}
else if(keyboard_check(vk_up))
{
	AnimationSet("UP");
}
else
{
	AnimationSet("IDLE");
}

//Run set animations
AnimationStep();