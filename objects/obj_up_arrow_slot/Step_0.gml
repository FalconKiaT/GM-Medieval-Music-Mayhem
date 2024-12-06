/// @description Handle tint
// You can write your code in this editor
if(keyboard_check(vk_up))
{
	image_blend = make_colour_rgb(200, 200, 200); //black tint
}
else
{
	image_blend = make_colour_rgb(255,255,255); //untint
}