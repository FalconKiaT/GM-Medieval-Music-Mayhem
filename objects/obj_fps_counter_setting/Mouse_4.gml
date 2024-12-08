/// @description Toggle the draw fps global to true
if (global.do_draw_fps)
{
	global.do_draw_fps = false
	sprite_index = spr_check_square_grey;
}
else
{
	global.do_draw_fps = true
	sprite_index = spr_check_square_grey_checkmark;
}