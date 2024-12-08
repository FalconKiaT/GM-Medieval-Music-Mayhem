// Feather disable GM2017

// Debugging, block all actions on this object
if (1 == 1)
{
	return;
}



function score_health_gui(){
	
	if (global.current_game_state == GAME_STATES.PLAY || global.current_game_state == GAME_STATES.PAUSE){
		draw_set_font(font_dialogue)
		draw_set_halign(fa_center)
		draw_set_color(c_white)
		draw_text(1257,240, string(score))
		draw_set_color(c_black)
		//heath bar
		draw_healthbar(1100,300,1300,323,health,c_black,c_red,c_green,0,false,false)
		draw_sprite(spr_level_health_barUI_assets,0,1180,310)
		// progress barr
		draw_healthbar(418,82,room_width/2+400,102,global.music_progress,c_yellow,c_red,c_aqua,0,false,false)
		draw_sprite(spr_level_progress_barUI_assets,0,room_width/2,92)
	
		
	}
}

score_health_gui()

// Pause system
// This system is made so that we do not have to load a new room and only work with the one we are in

/*
if (global.current_game_state == GAME_STATES.PAUSE ){
	// !! warining !!
	// This code is the part that will draw a surface
	// so that the game looks frozen in the background
	// please make sure that any part of the code that we use
	// with surface functions are stored because they are volatile and are only in draw events 
	// I say this but this is probably the only time it will be used
	// for more info: https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Drawing/Surfaces/Surfaces.htm
	// !! warning over !!
	
	
	
	// "frezzes the screen" creates a surfaces

	if (!surface_exists(pause_sur)){
		
		// This stops all instances in the room
		audio_pause_all();
		instance_deactivate_all(true);
		
		// caputures this game moment 
		pause_sur = surface_create(room_width,room_height);
		surface_set_target(pause_sur);
		draw_surface(application_surface,0,0);
		surface_reset_target();
		
		
	}
	else{

			
		draw_surface(pause_sur, 0,0);	
		score_health_gui()
		
		// Menu 
		draw_set_alpha(0.8);
		draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
		draw_set_alpha(1.0)
		
		// Menu GUI
		draw_sprite(spr_pause_scrollUI_assets,0,room_width/2, room_height/2)
		for(var i = 0; i < text_array_length; i++){
			sub_im = 0;
			if (pos_pause == i){
				sub_im = 1;
			}
			
			draw_sprite_ext(option[i],sub_im,room_width/2+text_border, room_height/2+text_border+text_dist*i,1,1,0,c_white,1)
			
		}
		
			
	}

	
	
	// NOTE: only intances stop here everything else such as animations don't
	
	

	
	
}
else  if (global.current_game_state == GAME_STATES.PAUSE_TIMER){
	
	instance_activate_all();
	instance_create_layer(room_width/2,room_height/2,"Meta",obj_countdown)
	surface_free(pause_sur);
	pause_sur = -1;
	
	audio_play_sound(snd_countdown_one, 1, false, get_volume_scaled(), 0);

	instance_deactivate_layer("Arrows");
	instance_deactivate_object(obj_music_controller_generic);
	
	global.current_game_state = GAME_STATES.TIMER
}
else  if (global.current_game_state == GAME_STATES.TIMER)
{
	//audio_pause_all();
	// Pause countdown audio if playing
	//audio_stop_sound(snd_countdown_one)
	surface_free(pause_sur);
	pause_sur = -1;


	instance_deactivate_layer("Arrows");
}
else if (global.current_game_state != GAME_STATES.PAUSE_TIMER || global.current_game_state != GAME_STATES.TIMER)
{
	
	
	// This brings back all instances as they were in the room
	if (pos_pause !=1){
		// check if the game restarted so the audio restarts too
		audio_resume_all()
	}
	instance_activate_all();
	
	// menu gone
	
	
	// clears the surface
	surface_free(pause_sur);
	pause_sur = -1;
	
	
	
}

*/