/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!queued) {
	if (obj_up_arrow_slot.y - y < arrow_switching_distance) {
		image_index = 1
		image_alpha -= arrow_switching_speed
	}
}
else {
	if (obj_up_arrow_slot.y - y < arrow_switching_distance and !appeared) {
		image_index = 1
		image_alpha += arrow_switching_speed
	}	
}

if (image_alpha >= 1) {
	appeared = true
	image_alpha = 1
	image_index = 0
}
