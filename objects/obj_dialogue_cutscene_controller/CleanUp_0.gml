/// @description Clean Up

// Make sure timeline stops
timeline_running = false;

// Clean up the broadcasting system
unsubscribe();

// Clean up maps
ds_map_destroy(sprite_string_dict);
ds_map_destroy(sprite_directions_dict);
ds_map_destroy(character_sound_dict);
ds_map_destroy(speaker_name_dict);
ds_map_destroy(speaker_color_dict);
ds_map_destroy(timeline_string_dict);


