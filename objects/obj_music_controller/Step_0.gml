/// @description Check if should spawn arrow
// You can write your code in this editor

var _dt = delta_time / 1000000 // delta time in seconds

// Check mapping array boundary
if (cur_arrow_index_up >= array_length(mapped_timestamps_up)) {
	cur_arrow_index_up = -1
}

// Calculate how much earlier the arrow should be spawned
var _timestamp_offset = arrow_distance / arrow_velocity
show_debug_message(string(_timestamp_offset))

// Make sure not to check out of mapped bounds
var _cur_timestamp_offsetted
if (cur_arrow_index_up == -1) {
	_cur_timestamp_offsetted = global.music_timestamp	
}
else {
	_cur_timestamp_offsetted = mapped_timestamps_up[cur_arrow_index_up] - _timestamp_offset	
}

var _timestamp_delta = _cur_timestamp_offsetted - global.music_timestamp

if (sign(_timestamp_delta) == -1) { // If the arrow is "late" to be spawned
	cur_arrow_index_up += 1 // Check for next mapping next loop
	var _x_position = obj_up_arrow_slot.x
	var _y_position = obj_up_arrow_slot.y - arrow_distance
	// Intantiate a random arrow for visualization purposes
	instance_create_layer(_x_position, _y_position, "Instances", obj_up_arrow, {
		arrow_velocity: arrow_velocity,
		desired_timestamp: })
}