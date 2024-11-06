
// Pause system
// This system is made so that we do not have to load a new room and only work with the one we are in

// remove Alpha blending
gpu_set_blendenable(false);

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
	surface_set_target(application_surface);
		if (surface_exists(pause_sur)){
			draw_surface(pause_sur, 0,0);	
		}
		else{
			pause_sur = surface_create(global.res_width,global.res_height);
			
			
		}
	surface_reset_target();
	
	
	
	// This stops all instances in the room
	audio_pause_all();
	instance_deactivate_all(true);
	
	// NOTE: only intances stop here everything else such as animations don't
	
	// caputures this game moment 
	pause_sur = surface_create(global.res_width,global.res_height);
	surface_set_target(pause_sur);
		draw_surface(application_surface,0,0);
	surface_reset_target();
	
	//buffer in case we lose the pause surface
	if (buffer_exists(pause_sur_buffer)){
		buffer_delete(pause_sur_buffer);
		
	}
	pause_sur_buffer = buffer_create(global.res_width* global.res_height*4,buffer_fixed,1);
	buffer_get_surface(pause_sur_buffer,pause_sur,0);
	

	
	
}
else
{
	// This brings back all instances as they were in the room
	audio_resume_all()
	instance_activate_all();
	
	// stops the surface drawing and clears it from memory which I also added to clean up
	if (surface_exists(pause_sur)){
		surface_free(pause_sur);
	}
	if (buffer_exists(pause_sur_buffer)){
		buffer_delete(pause_sur_buffer);
	}
	
}

//brings it back
gpu_set_blendenable(true);