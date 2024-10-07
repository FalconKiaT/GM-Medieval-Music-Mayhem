/// @description Insert description here
// You can write your code in this editor

// Check mapping array boundary
if (cur_arrow_index >= array_length(mapped_timestamps)) {
	cur_arrow_index = 0
}

// Tolerance for rounding errors in ms -> s conversion
var _timestamp_delta = abs(mapped_timestamps[cur_arrow_index] - music_timestamp)

if (_timestamp_delta < mapping_tolerance) { // If interval is under the tolerance
	cur_arrow_index += 1 // Check for next mapping next loop
	var _random_x_position = irandom_range(0, room_width)
	var _random_y_position = irandom_range(0, room_height)
	// Intantiate a random arrow for visualization purposes
	instance_create_layer(_random_x_position, _random_y_position, "Instances", obj_up_arrow)
}