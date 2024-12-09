/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_left))
{
	AnimationSet("LEFT");
}
else if(keyboard_check_pressed(vk_right))
{
	AnimationSet("RIGHT");
}
else if(keyboard_check_pressed(vk_up))
{
	AnimationSet("UP");
}
if(global.current_game_state == GAME_STATES.OVER){
	AnimationSet("UP");
}
//Run set animations
AnimationStep();