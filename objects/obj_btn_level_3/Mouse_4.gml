//play the third level if unlocked, else flash red

if(global.max_level >= 3)
{
	image_blend = make_colour_rgb(200, 200, 200); //black tint
}
else
{
	//make button red and then white again
	image_blend = make_colour_rgb(255, 0, 0);
	alarm[0] = game_get_speed(gamespeed_fps) * 0.2;
}