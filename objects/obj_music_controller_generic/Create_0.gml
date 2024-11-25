/// @description Runtime variable definitions
// You can write your code in this editor
global.music_timestamp = 0
global.music_timestamp_max = 185.81;
global.music_progress = 0;

alarm_set(0, 100) // Delay until start of the song

enum ARROW_DIRECTIONS {
	UP,
	LEFT,
	RIGHT
}

global.current_spawned_up_arrows = ds_queue_create()
global.current_spawned_left_arrows = ds_queue_create()
global.current_spawned_right_arrows = ds_queue_create()

// When will arrows spawn? --- Debug array, you should be overwritting them in the level-specific music controllers
mapped_timestamps_up = [5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6] 
mapped_timestamps_left = [5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6]
mapped_timestamps_right = [5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6]

// current song --- Debug, please overwrite on level specific music controllers
global.song_playing = snd_mus_mongrel_dance;