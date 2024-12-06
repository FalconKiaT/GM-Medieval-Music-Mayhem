/// @description Handle input and destroy arrows
// You can write your code in this editor

function spawn_feedback(_x, _y, _score) {
	var _feedback_obj = obj_feedback_generic
	
	if (_score == 0) {
		_feedback_obj = obj_feedback_miss
	}
	else if (_score < 30) {
		_feedback_obj = obj_feedback_bad	
	}
	else if (_score < 60) {
		_feedback_obj = obj_feedback_good	
	}
	else if (_score < 80) {
		_feedback_obj = obj_feedback_great	
	}
	else {
		_feedback_obj = obj_feedback_huzzah
	}
	
	instance_create_layer(_x, _y, "Feedback", _feedback_obj)	// Spawn feedback object
}

function click_last_arrow(_arrow_queue) {
	if (!ds_queue_empty(_arrow_queue)) { // Make sure there are arrows in the channel
		var _current_arrow = ds_queue_dequeue(_arrow_queue)
		var _note_delay = abs(global.music_timestamp - _current_arrow.desired_timestamp)
		
		_accuracy_score = 100 * sqr(clamp(1 - _note_delay, 0, 1))
		score += _accuracy_score
		health += ceil(10 * score / 100)
		if (health > 100) {health = 100}
		spawn_feedback(_current_arrow.x, _current_arrow.y, _accuracy_score)
		
		instance_destroy(_current_arrow)
	}
}

if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) { // Should destroy next up arrow
	click_last_arrow(global.current_spawned_up_arrows)
}

if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) { // Destroy left arrow
	click_last_arrow(global.current_spawned_left_arrows)
}

 if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) { // Destroy right arrow
 	click_last_arrow(global.current_spawned_right_arrows)
}



