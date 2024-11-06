/// @description Check for out of bounds
// You can write your code in this editor
if (x > obj_left_arrow_slot.x + 0.4 * sprite_width) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}

if (image_alpha < 0.2) {	
	if(!ds_queue_empty(global.current_spawned_left_arrows)) {
		ds_queue_dequeue(global.current_spawned_left_arrows)
	}
	instance_create_layer(x, y, "Feedback", obj_feedback_miss)
	health -= 10
	instance_destroy()
}