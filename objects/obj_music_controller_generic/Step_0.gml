/// @description Handle input and destroy arrows
// You can write your code in this editor

// Lightning timer
if (cur_lightning_streak > 0) {
	cur_lightning_delay += delta_time / 1000000	
}
if (cur_lightning_delay > lightning_streak_maximum_time) {
	cur_lightning_delay = 0
	cur_lightning_streak = 0
}

function spawn_feedback(_x, _y, _delay) {
	var _accuracy_score = 0
	var _feedback_obj = obj_feedback_generic
	
	// In what percentage of the range was the arrow clicked? (Range 0-1)
	var _range_percent = abs( _delay * arrow_velocity) / valid_arrow_range
	
	if (_range_percent > 2) { // Too soon! Nothing happens here
		_feedback_obj = obj_feedback_empty
		_accuracy_score = -1
	}
	else if (_range_percent < 0.15) {
		_feedback_obj = obj_feedback_huzzah	
		_accuracy_score = 100
	}
	else if (_range_percent < 0.3) {
		_feedback_obj = obj_feedback_great
		_accuracy_score = 70
	}
	else if (_range_percent < 0.7) {
		_feedback_obj = obj_feedback_good
		_accuracy_score = 30
	}
	else if (_range_percent < 1) {
		_feedback_obj = obj_feedback_bad
		_accuracy_score = 10
	}
	else { // This is in-between bad and too soon. You lose health and this counts as a miss
		_feedback_obj = obj_feedback_miss
		_accuracy_score = 0
	}
	
	instance_create_layer(_x, _y, "Feedback", _feedback_obj)	// Spawn feedback object
	return _accuracy_score
}

function click_last_arrow(_arrow_queue) {
	if (!ds_queue_empty(_arrow_queue)) { // Make sure there are arrows in the channel
		var _current_arrow = ds_queue_head(_arrow_queue)
		var _note_delay = abs(global.music_timestamp - _current_arrow.desired_timestamp)
		switch(_current_arrow.broadcast_message) {
			case ANIM_MESSAGES.CHANNEL_SWITCH:
			case ANIM_MESSAGES.LIGHTNING:
			case ANIM_MESSAGES.NOTE_MISSED: // If it's a normal arrow
				var _accuracy_score = spawn_feedback(_current_arrow.x, _current_arrow.y, _note_delay)
				health += _accuracy_score / 100 * health_recover_multiplier
				if (health > 100) {health = 100}
				if (_accuracy_score == 0) {
					health -= 10	
				}
				if (_current_arrow.broadcast_message == ANIM_MESSAGES.LIGHTNING) {
					if (cur_lightning_streak == 0 and cur_lightning_delay == 0) {
						cur_lightning_streak += 1
					}
					else if (_accuracy_score > 0) {
						cur_lightning_streak += 1
						if (cur_lightning_streak == 3) {
							// FINISHED THE LIGHTNING COMBO SUCCESSFULLY
							cur_lightning_streak = 0
							score += 2000
							health = 100
						}
					}
				}
				score += _accuracy_score
				ds_queue_dequeue(_arrow_queue)
				instance_destroy(_current_arrow)
				
				break
			case ANIM_MESSAGES.BOMB_AVOIDED:
				var _range_percent = abs(_note_delay * arrow_velocity) / valid_arrow_range
				if (_range_percent < 2) {
					ds_queue_dequeue(_arrow_queue)
					instance_destroy(_current_arrow)
					health -= 20
				}
				break
		}
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



