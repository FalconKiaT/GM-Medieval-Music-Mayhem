/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (!queued) {
	if (obj_left_arrow_slot.x - x < arrow_switching_distance) {
		image_index = 1
		image_alpha -= arrow_switching_speed
	}
}
else {
	if (obj_left_arrow_slot.x - x < arrow_switching_distance and !appeared) {
		image_index = 1
		image_alpha += arrow_switching_speed
	}	
}

if (image_alpha >= 1) {
	image_alpha = 1
	image_index = 0
	appeared = true
}
