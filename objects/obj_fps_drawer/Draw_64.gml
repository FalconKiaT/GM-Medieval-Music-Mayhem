/// @description Draw FPS Counter

if (!global.do_draw_fps)
{
	// Dont draw FPS
	return;
}

// Else compute top right points
var _x_offset = 10;
var _y_offset = 10
var _x_val = camera_get_view_x(view_camera[0]) + _x_offset;
var _y_val = camera_get_view_y(view_camera[0]) + _y_offset;

// Smooth out an average of the FPS
var _fps_str = string(round(average_fps));

// Draw
scribble("[#000000]FPS: " + _fps_str).draw(_x_val + 1, _y_val + 1);
scribble("[#FFFF00]FPS: " + _fps_str).draw(_x_val, _y_val);

