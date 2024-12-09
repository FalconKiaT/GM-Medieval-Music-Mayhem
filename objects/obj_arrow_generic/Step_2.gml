/// @description Check if transparent and destroy
// You can write your code in this editor

if (image_alpha < 0.2) {
	if(!ds_queue_empty(current_queue)) {
		ds_queue_dequeue(current_queue)
	}
	instance_create_layer(x, y, "Feedback", feedback_object)
	broadcast(broadcast_message)
	health += health_effect
	instance_destroy()
}