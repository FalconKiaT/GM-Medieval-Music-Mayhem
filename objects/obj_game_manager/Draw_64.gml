// Feather disable GM2017
function score_health_gui(){
	
	if (global.current_game_state == GAME_STATES.PLAY || global.current_game_state == GAME_STATES.PAUSE ){
	
		draw_set_halign(fa_center)
		draw_text((room_width)-50,54,"Score: \n" + string(score))
		// add detection for levels for now
		
	
		draw_healthbar(room_width/2-200,room_height/2+170,room_width/2+200,room_height/2+170+12,health,c_black,c_red,c_green,0,false,false)
	}
}

score_health_gui()

// Pause system
// This system is made so that we do not have to load a new room and only work with the one we are in


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
		
		for(var i = 0; i < text_array_length; i++){
			text_color = c_white;
			if (pos_pause == i){
				text_color = c_yellow;
			}
			draw_text_color(room_width/2 + text_border, room_height/2-100 +text_border + text_dist*i, option[i], text_color,text_color,text_color,text_color,1);
			
		}
		
			
	}

	
	
	// NOTE: only intances stop here everything else such as animations don't
	
	

	
	
}
else  if (global.current_game_state == GAME_STATES.PAUSE_TIMER){
	
	instance_activate_all();
	instance_create_layer(room_width/2,room_height/2,"Meta",obj_countdown)
	audio_pause_all();

	surface_free(pause_sur);
	pause_sur = -1;


	instance_deactivate_layer("Arrows");
	instance_deactivate_object(obj_music_controller);
	
	global.current_game_state = GAME_STATES.TIMER
}
else  if (global.current_game_state == GAME_STATES.TIMER){
	audio_pause_all();

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

