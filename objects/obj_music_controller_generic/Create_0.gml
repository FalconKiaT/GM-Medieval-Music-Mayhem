/// @description Runtime variable definitions
// You can write your code in this editor



// <-------------------> IAN ADDED <------------------->

receiver = new Receiver();

receiver.add(MESSAGES.GAME_PAUSED, function() 
{
    global.do_run_music_system = false
});

receiver.add(MESSAGES.COUNTDOWN_FINISHED, function() 
{
    global.do_run_music_system = true
});


// <-------------------> END ADDED <------------------->


global.music_timestamp = 0
global.music_timestamp_max = 185.81;
global.music_progress = 0;

alarm_set(0, 100) // Delay until start of the song

// What is the maximum valid pixel distance between the arrow and the slot?
// Points will only be counted if the player clicks the arrow when it's inside the range
valid_arrow_range = 100
health_recover_multiplier = 4

enum ARROW_DIRECTIONS {
	UP,
	LEFT,
	RIGHT
}

global.current_spawned_up_arrows = ds_queue_create()
global.current_spawned_left_arrows = ds_queue_create()
global.current_spawned_right_arrows = ds_queue_create()

// When will arrows spawn? --- Debug array, you should be overwritting them in the level-specific music controllers
mapped_timestamps_up = [] 
mapped_timestamps_left = []
mapped_timestamps_right = []
mapped_timestamps_bombs = [5, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6]

// current song --- Debug, please overwrite on level specific music controllers
global.song_playing = snd_mus_mongrel_dance;