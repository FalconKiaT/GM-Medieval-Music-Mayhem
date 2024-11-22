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
mapped_timestamps_up =[5.010416666666667, 5.993229166666667, 11.003645833333334, 17.979166666666668, 23.480729166666666, 28.0, 28.982291666666665]
mapped_timestamps_left = [3.9791666666666665, 8.006770833333333, 10.020833333333334, 11.9859375, 13.017708333333333, 14.982291666666667, 19.993229166666666, 21.024479166666666, 22.989583333333332, 25.9859375] 
mapped_timestamps_right = [7.024479166666667, 8.4984375, 8.989583333333334, 14.0, 14.491145833333333, 16.0140625, 24.020833333333332]

// current song
global.song_playing = snd_mus_minstrel_guild;