//Make sure only one global manager objects exists at any given time
if ( !variable_global_exists("global_manager_exists") || global.global_manager_exists == undefined )
{
	// First time this object ever called create, set it up
	global.global_manager_exists = self;
}
else
{
	// Already exists, destroy this duplicate object
	instance_destroy();
	return;
}

//leaving this here just in case
if(room_exists(rm_mainMenu)){
	global.current_game_state = GAME_STATES.MENU
}
if(global.current_game_state == GAME_STATES.MENU){
	audio_play_sound(snd_menu_music,10,true)
}

//settings
global.volume = 100; //a value 0-100 denoting game volume
global.note_timing_offset = 0.5;

//menus
global.max_level = 1; //controls what levels player can access


// Game state
global.current_game_state = GAME_STATES.MENU;

// Some deafult resolutions 
global.res_width = 1600;
global.res_height = 900;

// The current level
global.current_level= 0;


// level scoring
global.level_one_high_score =0;
