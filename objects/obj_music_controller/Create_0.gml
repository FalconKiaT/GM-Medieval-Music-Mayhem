/// @description Runtime variable definitions
// You can write your code in this editor
global.music_timestamp = 0

alarm_set(0, 100) // Delay until start of the song

enum ARROW_DIRECTIONS {
	UP,
	LEFT,
	RIGHT
}

global.current_spawned_up_arrows = ds_queue_create()
global.current_spawned_left_arrows = ds_queue_create()
global.current_spawned_right_arrows = ds_queue_create()

// When will arrows spawn?
mapped_timestamps_up = [1, 5, 6, 10, 14, 17]
mapped_timestamps_left = [2.5, 3, 6, 7, 7.5, 8, 13] 
mapped_timestamps_right = [4, 5, 9, 11, 12, 12.5] 

// current song
global.song_playing = snd_mus_mongrel_dance;