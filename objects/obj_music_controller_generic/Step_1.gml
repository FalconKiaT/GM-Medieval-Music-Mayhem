/// @description Should we spawn an arrow on this frame?

// Arrow creator function. Takes an array of mapped arrows, the array index to check, a queue, and arrow direction
function spawn_arrow_if_on_time(_mapping_array, _cur_arrow_index, _arrow_queue, _arrow_object, _arrow_direction) {
	// Check mapping array boundary
	if (_cur_arrow_index >= array_length(_mapping_array)) {
		return false // Arrow was not spawned
	}
	// Else
	//   Calculate how much earlier the arrow should be spawned
	//   (distance is velocity*time, so we can rearrange to solve for time in the line below)
	var _timestamp_offset = arrow_distance / arrow_velocity
	// This is the desired timestamp for the arrow to be clicked
	_cur_arrow_timestamp = _mapping_array[_cur_arrow_index]
	_cur_timestamp_offsetted = _cur_arrow_timestamp - _timestamp_offset // This is when it should be spawned
	// How long will it be until the arrows should be spawned?
	var _timestamp_delta = _cur_timestamp_offsetted - global.music_timestamp


	if (sign(_timestamp_delta) == -1) { // If the arrow is "late" to be spawned, spawn them!
		var _x_position = 0
		var _y_position = 0
		
		// Place them differently depending on which type of arrow should be spawned
		switch(_arrow_direction) {
			case ARROW_DIRECTIONS.UP:
				_x_position = obj_up_arrow_slot.x
				_y_position = obj_up_arrow_slot.y - arrow_distance
				cur_arrow_index_up += 1
				break
			case ARROW_DIRECTIONS.LEFT:
				_x_position = obj_left_arrow_slot.x - arrow_distance
				_y_position = obj_left_arrow_slot.y
				cur_arrow_index_left += 1
				break
			case ARROW_DIRECTIONS.RIGHT:
				_x_position = obj_right_arrow_slot.x + arrow_distance
				_y_position = obj_right_arrow_slot.y
				cur_arrow_index_right += 1
				break
			// ========================================
			// < SPECIAL ARROWS GO TO RANDOM CHANNELS >
			// ========================================
			case ARROW_DIRECTIONS.BOMB:
				cur_arrow_index_bombs += 1
				var _random_value = random(1) // Random float from 0 to 1. Determines which channel
											  // the arrow will be spawned at.
				if (_random_value > 0.66) { // CASE RIGHT CHANNEL
					_x_position = obj_right_arrow_slot.x + arrow_distance
					_y_position = obj_right_arrow_slot.y
					_arrow_object = obj_bomb_right
					_arrow_queue = global.current_spawned_right_arrows
				}
				else if (_random_value > 0.33) { // CASE UP CHANNEL
					_x_position = obj_up_arrow_slot.x
					_y_position = obj_up_arrow_slot.y - arrow_distance
					_arrow_object = obj_bomb_up
					_arrow_queue = global.current_spawned_up_arrows
				}
				else { // CASE LEFT CHANNEL
					_x_position = obj_left_arrow_slot.x - arrow_distance
					_y_position = obj_left_arrow_slot.y
					_arrow_object = obj_bomb_left
					_arrow_queue = global.current_spawned_left_arrows
				}
				break
			case ARROW_DIRECTIONS.LIGHTNING:
				cur_arrow_index_lightning += 1
				var _random_value = random(1) // Random float from 0 to 1. Determines which channel
											  // the arrow will be spawned at.
				if (_random_value > 0.66) { // CASE RIGHT CHANNEL
					_x_position = obj_right_arrow_slot.x + arrow_distance
					_y_position = obj_right_arrow_slot.y
					_arrow_object = obj_lightning_right
					_arrow_queue = global.current_spawned_right_arrows
				}
				else if (_random_value > 0.33) { // CASE UP CHANNEL
					_x_position = obj_up_arrow_slot.x
					_y_position = obj_up_arrow_slot.y - arrow_distance
					_arrow_object = obj_lightning_up
					_arrow_queue = global.current_spawned_up_arrows
				}
				else { // CASE LEFT CHANNEL
					_x_position = obj_left_arrow_slot.x - arrow_distance
					_y_position = obj_left_arrow_slot.y
					_arrow_object = obj_lightning_left
					_arrow_queue = global.current_spawned_left_arrows
				}
				break
			case ARROW_DIRECTIONS.SWITCH:
				cur_arrow_index_switch += 1
				var _random_value = random(1) // Random float from 0 to 1. Determines which channel
											  // the arrow will be spawned at.
				if (_random_value > 0.66) { // CASE RIGHT CHANNEL
					_x_position = obj_right_arrow_slot.x + arrow_distance
					_y_position = obj_right_arrow_slot.y
					_arrow_object = obj_switch_right
					_arrow_queue = global.current_spawned_right_arrows
					if (_random_value < 0.83) { // Spawn fake arrow on LEFT
						instance_create_layer(obj_left_arrow_slot.x - arrow_distance, obj_left_arrow_slot.y,
							"Arrows", obj_switch_left, {queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
					else { // Spawn fake arrow on UP
						instance_create_layer(obj_up_arrow_slot.x, obj_up_arrow_slot.y - arrow_distance,
							"Arrows", obj_switch_up, {queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
				}
				else if (_random_value > 0.33) { // CASE UP CHANNEL
					_x_position = obj_up_arrow_slot.x
					_y_position = obj_up_arrow_slot.y - arrow_distance
					_arrow_object = obj_switch_up
					_arrow_queue = global.current_spawned_up_arrows
					if (_random_value < 0.5) { // Spawn fake arrow on LEFT
						instance_create_layer(obj_left_arrow_slot.x - arrow_distance, obj_left_arrow_slot.y,
							"Arrows", obj_switch_left, {queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
					else { // Spawn fake arrow on RIGHT
						instance_create_layer(obj_right_arrow_slot.x + arrow_distance, obj_right_arrow_slot.y,
							"Arrows", obj_switch_right, {queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
				}
				else { // CASE LEFT CHANNEL
					_x_position = obj_left_arrow_slot.x - arrow_distance
					_y_position = obj_left_arrow_slot.y
					_arrow_object = obj_switch_left
					_arrow_queue = global.current_spawned_left_arrows
					if (_random_value < 0.16) { // Spawn fake arrow on UP
						instance_create_layer(obj_up_arrow_slot.x, obj_up_arrow_slot.y - arrow_distance,
							"Arrows", obj_switch_up, {queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
					else { // Spawn fake arrow on RIGHT
						instance_create_layer(obj_right_arrow_slot.x + arrow_distance, obj_right_arrow_slot.y,
							"Arrows", obj_switch_right, {
								queued: false,
								arrow_velocity: arrow_velocity,
								desired_timestamp: _cur_arrow_timestamp})
					}
				}
				break
		}
		show_debug_message("This is it!! I'm being spawned at " + string(_x_position) + " " + string(_y_position))
		// Intantiate the chosen arrow and add to queue
		ds_queue_enqueue(_arrow_queue,
			instance_create_layer(_x_position, _y_position, "Arrows", _arrow_object, {
				arrow_velocity: arrow_velocity,
				desired_timestamp: _cur_arrow_timestamp,
				queued: true}))
		
		return true // Arrow was spawned
	}
	
	return false
}

var _dt = delta_time / 1000000 // how many seconds have passed since the last frame?

// Update the current timestamp. How far along is the song?
if (is_music_playing) {
	global.music_timestamp += _dt // Stored in seconds
}

// Check if a arrow should be spawned in the up channel (and spawn it if it's time)
spawn_arrow_if_on_time(mapped_timestamps_up, cur_arrow_index_up, global.current_spawned_up_arrows,
	obj_up_arrow, ARROW_DIRECTIONS.UP)

// Check if a arrow should be spawned in the left channel (and spawn it if it's time)  
if (spawn_arrow_if_on_time(mapped_timestamps_left, cur_arrow_index_left, global.current_spawned_left_arrows,
	obj_left_arrow, ARROW_DIRECTIONS.LEFT)) {cur_arrow_index_left += 1}
							
// Check if a arrow should be spawned in the right channel (and spawn it if it's time)
if (spawn_arrow_if_on_time(mapped_timestamps_right, cur_arrow_index_right, global.current_spawned_right_arrows,
	obj_right_arrow, ARROW_DIRECTIONS.RIGHT)) {cur_arrow_index_right += 1}

// Check if a bomb arrow should be spawned (spawn it if it's time and choose a random channel)
spawn_arrow_if_on_time(mapped_timestamps_bombs, cur_arrow_index_bombs, global.current_spawned_right_arrows,
	obj_bomb_up, ARROW_DIRECTIONS.BOMB)
	
// Check if a lightning arrow should be spawned (spawn it if it's time and choose a random channel)
spawn_arrow_if_on_time(mapped_timestamps_lightning, cur_arrow_index_lightning, global.current_spawned_right_arrows,
	obj_lightning_up, ARROW_DIRECTIONS.LIGHTNING)
	
// Check if a channel switch arrow should be spawned (spawn it if it's time and choose a random channel)
spawn_arrow_if_on_time(mapped_timestamps_switch, cur_arrow_index_switch, global.current_spawned_right_arrows,
	obj_switch_up, ARROW_DIRECTIONS.SWITCH)

// FIXME: This might be unneccessary (OR EVEN BREAK OTHER LEVELS)
// Music timestamp has ended
// number one
if(global.song_playing == snd_mus_minstrel_guild){
	if (global.music_timestamp >= global.music_timestamp_max){
		is_music_playing = false; 
	}
}

// progress bar (ranges from 0 to 100)
global.music_progress = (global.music_timestamp/global.music_timestamp_max)*100

