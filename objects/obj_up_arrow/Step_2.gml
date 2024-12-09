/// @description Move and check for out of bounds
// You can write your code in this editor

// <-------------------> IAN ADDED <------------------->

if (!global.do_run_music_system)
{
	return;
}

// <-------------------> END ADDED <------------------->

event_inherited()

y += arrow_velocity * dt

if (y > obj_up_arrow_slot.y + 0.4 * sprite_height) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}

