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
mapped_timestamps_up =[2.7835670416666662, 3.329574422916666, 6.113141464583332, 9.988433916666665, 13.044859972916663, 15.555567999999997, 16.101286029166662]
mapped_timestamps_left =[2.210649916666666, 4.4482095770833325, 5.5671340833333325, 6.658859493749999, 7.232065970833332, 8.323502029166665, 11.107358422916665, 11.680275547916665, 12.772000958333331, 14.436643493749997] 
mapped_timestamps_right =[3.9024915479166657, 4.721357943749999, 4.9942169583333325, 7.777783999999999, 8.050643014583331, 8.896708506249999, 13.344918083333331]

// current song
global.song_playing = snd_mus_minstrel_guild;