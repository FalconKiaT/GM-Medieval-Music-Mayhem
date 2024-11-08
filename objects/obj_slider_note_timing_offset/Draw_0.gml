/// @description Draw the silder
draw_self();
//draw colored bar up until slider button position
draw_sprite_part(sprite_index, 1, 0, 0, sprite_width * progress, 
				 sprite_height, x, y - sprite_get_yoffset(sprite_index));
				 
//draw slider button
draw_sprite(spr_slider_button, 0, x+sprite_width*progress, y);