/// @description Variable Definitions

// ================================
// <       GLOBAL VARIABLES       >
// ================================
global.music_timestamp = 0 // How much time has passed from the start of the song?
global.music_timestamp_max = 185.81 // How long is the current song? (SHOULD BE CHANGED WHENEVER WE CHANGE LEVELS)
global.music_progress = 0 // What percentage of the song is done? (Ranges from 0 to 100)

// =================================
// <     LOCAL AUDIO VARIABLES     >
// =================================
is_music_playing = false

// ================================
// < MAPPING ADJUSTMENT VARIABLES >
// ================================
mapping_tolerance = 0.1 // In seconds, how off can the timestamp be when we spawn the arrows?
arrow_velocity = 300 // In pixels per second
arrow_distance = 500 // How far away from the slot does the arrow spawn?
valid_arrow_range = 100 // How far away can the arrow be and still be counted as a hit? (pixels)
health_recover_multiplier = 4 // How much health is recovered on hit?
lightning_streak_maximum_time = 2.5 // In seconds. Maximum time for a streak from first to last lightning 

// ---
// How many arrows of each type are currently spawned?
cur_arrow_index_up = 0
cur_arrow_index_left = 0
cur_arrow_index_right = 0
cur_arrow_index_bombs = 0
cur_arrow_index_switch = 0
cur_arrow_index_lightning = 0
cur_lightning_streak = 0
cur_lightning_delay = 0
// ---

alarm_set(0, 100) // Delay until start of the song

enum ARROW_DIRECTIONS {
	UP,
	LEFT,
	RIGHT,
	BOMB,
	SWITCH,
	LIGHTNING
}

// Create queues for each channel. Special arrows also go in these
global.current_spawned_up_arrows = ds_queue_create()
global.current_spawned_left_arrows = ds_queue_create()
global.current_spawned_right_arrows = ds_queue_create()

// When will arrows spawn? --- (Debug array, you should be overwritting them in the level-specific music controllers)
mapped_timestamps_up = [] 
mapped_timestamps_left = []
mapped_timestamps_right = []
mapped_timestamps_bombs = []
mapped_timestamps_switch = []
mapped_timestamps_lightning = []


// current song --- (Debug, please overwrite on level specific music controllers)
global.song_playing = snd_mus_mongrel_dance