/// @description Handle input and destroy arrows
// You can write your code in this editor

function spawn_feedback(_x, _y, _score) {
	if(_score == 100){
		_feedback_obj = obj_bomb_sfx
	}
	
	instance_create_layer(_x, _y, "Feedback", _feedback_obj)	// Spawn feedback object
}

function click_last_arrow(_arrow_queue) {
	if (!ds_queue_empty(_arrow_queue)) { // Make sure there are arrows in the channel
		var _current_arrow = ds_queue_dequeue(_arrow_queue)
		var _note_delay = abs(global.music_timestamp - _current_arrow.desired_timestamp)
		
		_accuracy_score = 100
		audio_play_sound(snd_bomb_sfx,2,false)
		health -= 50
		if (health > 100) {health = 100}
		spawn_feedback(_current_arrow.x, _current_arrow.y, _accuracy_score)
		
		
		instance_destroy(_current_arrow)
	}
}

if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) { // Should destroy next up arrow
	click_last_arrow(current_spawned_up_arrows)
}

if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) { // Destroy left arrow
	click_last_arrow(current_spawned_left_arrows)
}

 if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) { // Destroy right arrow
 	click_last_arrow(current_spawned_right_arrows)
}



