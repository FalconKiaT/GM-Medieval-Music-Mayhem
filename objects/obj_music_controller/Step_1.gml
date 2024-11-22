/// @description Count music timer
// You can write your code in this editor

// Music timestamp for mapping
if (is_music_playing) {
	global.music_timestamp += delta_time / 1000000 // Stored in seconds
}
