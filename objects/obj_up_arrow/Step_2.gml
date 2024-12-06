/// @description Move and check for out of bounds
// You can write your code in this editor

var _dt = delta_time / 1000000 // delta time in seconds

y += arrow_velocity * _dt

if (y > obj_up_arrow_slot.y + 0.4 * sprite_height) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}

if (image_alpha < 0.2) {
	if(!ds_queue_empty(global.current_spawned_up_arrows)) {
		ds_queue_dequeue(global.current_spawned_up_arrows)
	}
	instance_create_layer(x, y, "Feedback", obj_feedback_miss)
	broadcast(ANIM_MESSAGES.NOTE_MISSED)
	health -= 10
	instance_destroy()
}