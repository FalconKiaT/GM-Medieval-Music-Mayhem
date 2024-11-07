/// @description Check for out of bounds
// You can write your code in this editor

if (y > obj_up_arrow_slot.y + 0.4 * sprite_height) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}

if (image_alpha < 0.2) {
	if(!ds_queue_empty(global.current_spawned_up_arrows)) {
		ds_queue_dequeue(global.current_spawned_up_arrows)
	}
	instance_create_layer(x, y, "Feedback", obj_feedback_miss)
	health -= 10
	instance_destroy()
}