/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")))
{
	AnimationSet("LEFT");
}
else if(keyboard_check_pressed(vk_right)|| keyboard_check_pressed(ord("D")))
{
	AnimationSet("RIGHT");
}
else if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
{
	AnimationSet("UP");
}
if(global.current_game_state == GAME_STATES.OVER){
	AnimationSet("DEATH");
}
//Run set animations
AnimationStep();