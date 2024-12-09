/// @description Move and check for out of bounds
// You can write your code in this editor

// <-------------------> IAN ADDED <------------------->

if (!global.do_run_music_system)
{
	return;
}

// <-------------------> END ADDED <------------------->

event_inherited()

x += arrow_velocity * dt

if (x > obj_left_arrow_slot.x + 0.4 * sprite_width) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}