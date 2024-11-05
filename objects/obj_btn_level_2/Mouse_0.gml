//play the second level if unlocked, else flash red

if(global.max_level >= 2)
{
	room_goto(rm_prototype); //replace with lvl 2
}
else
{
	//make button red and then white again
	image_blend = make_colour_rgb(255, 0, 0);
	alarm[0] = game_get_speed(gamespeed_fps) * 0.2;
}