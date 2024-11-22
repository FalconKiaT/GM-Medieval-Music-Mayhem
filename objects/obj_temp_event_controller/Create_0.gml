/// @description Runtime variable definitions
// this a temp solution and it does not work yet


alarm_set(0, 100) // Delay until start of the song

current_spawned_up_arrows = ds_queue_create()
current_spawned_left_arrows = ds_queue_create()
current_spawned_right_arrows = ds_queue_create()

// When will arrows spawn?
mapped_timestamps_up_bomb =[11, 12, 65]
mapped_timestamps_left_bomb =[25.5, 33, 53]
mapped_timestamps_right_bomb =[23, 30, 50]
// current song
global.song_playing = snd_mus_minstrel_guild;