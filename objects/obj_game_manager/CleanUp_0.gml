/// @description Insert description here
// You can write your code in this editor

// Debugging, block all actions on this object
if (1 == 1)
{
	return;
}

if (surface_exists(pause_sur)){
		surface_free(pause_sur);
	}
if (buffer_exists(pause_sur_buffer)){
	buffer_delete(pause_sur_buffer);
}
