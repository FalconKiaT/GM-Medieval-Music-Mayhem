/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!queued) {
	if (x - obj_right_arrow_slot.x < arrow_switching_distance) {
		image_index = 1
		image_alpha -= arrow_switching_speed
	}
}
else {
	if (x - obj_right_arrow_slot.x < arrow_switching_distance and !appeared) {
		image_index = 1
		image_alpha += arrow_switching_speed
	}	
}

if (image_alpha >= 1) {
	appeared = true
	image_alpha = 1
	image_index = 0
}

