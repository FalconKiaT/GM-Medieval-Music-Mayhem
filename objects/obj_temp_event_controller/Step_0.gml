/// @description Check if should spawn arrow
// You can write your code in this editor

var _dt = delta_time / 1000000 // delta time in seconds

// Arrow creator function. Takes an array of mapped arrows, the array index to check, a queue, and arrow direction
function spawn_arrow_on_time(_mapping_array, _cur_arrow_index, _arrow_queue, _arrow_object, _arrow_direction) {
	// Check mapping array boundary
	if (_cur_arrow_index >= array_length(_mapping_array)) {
		return false // Arrow was not spawned
	}
	// Calculate how much earlier the arrow should be spawned
	var _timestamp_offset = arrow_distance / arrow_velocity

	_cur_arrow_timestamp = _mapping_array[_cur_arrow_index]
	_cur_timestamp_offsetted = _cur_arrow_timestamp - _timestamp_offset
	var _timestamp_delta = _cur_timestamp_offsetted - global.music_timestamp
	// show_debug_message("The timestamp offset is " + string(_timestamp_delta))


	if (sign(_timestamp_delta) == -1) { // If the arrow is "late" to be spawned
		var _x_position = 0
		var _y_position = 0
		
		switch(_arrow_direction) {
			case ARROW_DIRECTIONS.UP:
				_x_position = obj_up_arrow_slot.x
				_y_position = obj_up_arrow_slot.y - arrow_distance
				break
			case ARROW_DIRECTIONS.LEFT:
				_x_position = obj_left_arrow_slot.x - arrow_distance
				_y_position = obj_left_arrow_slot.y
				break
			case ARROW_DIRECTIONS.RIGHT:
				_x_position = obj_right_arrow_slot.x + arrow_distance
				_y_position = obj_right_arrow_slot.y
		}
		show_debug_message("This is it!! I'm being spawned at " + string(_x_position) + " " + string(_y_position))
		// Intantiate the chosen arrow and add to queue
		ds_queue_enqueue(_arrow_queue,
			instance_create_layer(_x_position, _y_position, "Arrows", _arrow_object, {
				arrow_velocity: arrow_velocity,
				desired_timestamp: _cur_arrow_timestamp}))
		
		return true // Arrow was spawned
	}
	
	return false
}

if (spawn_arrow_on_time(mapped_timestamps_up_bomb, cur_arrow_index_up, current_spawned_up_arrows,
	obj_bomb_up, ARROW_DIRECTIONS.UP)) {cur_arrow_index_up += 1} // Only check for next arrow once
																  // the current one is spawned												  
if (spawn_arrow_on_time(mapped_timestamps_left_bomb, cur_arrow_index_left, current_spawned_left_arrows,
	obj_bomb_left, ARROW_DIRECTIONS.LEFT)) {cur_arrow_index_left += 1}
																  
if (spawn_arrow_on_time(mapped_timestamps_right_bomb, cur_arrow_index_right, current_spawned_right_arrows,
	obj_bomb_right, ARROW_DIRECTIONS.RIGHT)) {cur_arrow_index_right += 1}

