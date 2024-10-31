if(keyboard_check(vk_left))
{
	hspeed = -moveSpd;
	AnimationSet("RUN_LEFT");
}
else if(keyboard_check(vk_right))
{
	hspeed = moveSpd;
	AnimationSet("RUN_RIGHT");
}else
{
	hspeed = 0;
	AnimationSet("IDLE");
}

//Run set animations
AnimationStep();