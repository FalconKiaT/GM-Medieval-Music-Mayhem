/// @description Compute Coordinates

// Separated into its own event to clean up step

// Dont compute anything if paused or inactive 
if (is_dialogue_paused)
{
	return;
}

// Compute Anchors
bottom_left_anchor.x = camera_get_view_x(view_camera[0]);
bottom_left_anchor.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

bottom_right_anchor.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
bottom_right_anchor.y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

// If the shake event is happening, push the anchors some random amount set by
// the intensity
if (is_dialogue_shaking)
{
	var x_shift = irandom_range(0, dialogue_shake_intensity);
	var y_shift = irandom_range(0, dialogue_shake_intensity);
	bottom_left_anchor.x += x_shift;
	bottom_left_anchor.y += y_shift;
	bottom_right_anchor.x += x_shift;
	bottom_right_anchor.y += y_shift;
}

// Compute Dialogue Zone coordinates
diagzone_top_left.x = bottom_left_anchor.x + const_left_margain;
diagzone_top_left.y = bottom_left_anchor.y - const_dialogue_box_height - const_bottom_margain;

diagzone_top_right.x = bottom_right_anchor.x - const_right_margain;
diagzone_top_right.y = bottom_right_anchor.y - const_dialogue_box_height - const_bottom_margain;

diagzone_bottom_left.x = bottom_left_anchor.x + const_left_margain;
diagzone_bottom_left.y = bottom_left_anchor.y - const_bottom_margain;

diagzone_bottom_right.x = bottom_right_anchor.x - const_right_margain;
diagzone_bottom_right.y = bottom_right_anchor.y - const_bottom_margain;

// Since im animating using a scaling function, all constants must be scaled as well for it to look nice
var scaled_const_portrait_box_width = const_portrait_box_width * opening_anim_scaler;
var scaled_const_inner_text_box_margain = const_inner_text_box_margain * opening_anim_scaler;
var scaled_const_inner_portrait_margain = const_inner_portrait_margain * opening_anim_scaler
var scaled_const_inbetween_space = const_inbetween_space * opening_anim_scaler;

// Check if we should compute the portrait coords
switch (dialogue_current_type)
{
	case DIALOGUE_TYPE.PORTRAIT_RIGHT:
		// Compute the outer text box coordinates and values
		outer_text_box_top_left.x = diagzone_top_left.x;
		outer_text_box_top_left.y = diagzone_top_left.y;
		outer_text_box_width = diagzone_top_right.x - const_portrait_box_width - const_inbetween_space - outer_text_box_top_left.x;
		outer_text_box_top_right.x = outer_text_box_top_left.x + outer_text_box_width * opening_anim_scaler;
		outer_text_box_top_right.y = outer_text_box_top_left.y;
		
		// Compute the inner text box coordinates and values
		inner_text_box_top_left.x = outer_text_box_top_left.x + scaled_const_inner_text_box_margain;
		inner_text_box_top_left.y = outer_text_box_top_left.y + scaled_const_inner_text_box_margain;
		inner_text_box_width = (outer_text_box_width * opening_anim_scaler) - 2 * scaled_const_inner_text_box_margain;
		
		// Compute the coordinates with a portrait on the right
		outer_portrait_top_left.x = outer_text_box_top_right.x + scaled_const_inbetween_space;
		outer_portrait_top_left.y = outer_text_box_top_right.y;
		outer_portrait_top_right.x = outer_portrait_top_left.x + scaled_const_portrait_box_width;
		outer_portrait_top_right.y = outer_portrait_top_left.y;
	
		// Compute inner portrait coordinates and values for drawing character sprite
		inner_portrait_top_left.x = outer_portrait_top_left.x + scaled_const_inner_portrait_margain;
		inner_portrait_top_left.y = outer_portrait_top_left.y + scaled_const_inner_portrait_margain;
		
		// FIXME: Also compute outer_portrait_top_right anchor
		
		// Compute next arrow coordinates
		next_arrow_top_left.x = outer_text_box_top_right.x - const_next_arrow_offset.x;
		next_arrow_top_left.y = outer_text_box_top_right.y + const_dialogue_box_height - const_next_arrow_offset.y;
		
		// in case the sprite was flipped, now we need to offset the portrait anchor
		if (is_sprite_flipped)
		{
			inner_portrait_top_left.x += const_inner_portrait_width; 
		}
		break;
		
	case DIALOGUE_TYPE.PORTRAIT_LEFT:
		// Compute the coordinates with a portrait on the left
		outer_portrait_top_left.x = diagzone_top_left.x;
		outer_portrait_top_left.y = diagzone_top_left.y;
		outer_portrait_top_right.x = outer_portrait_top_left.x + scaled_const_portrait_box_width;
		outer_portrait_top_right.y = outer_portrait_top_left.y;
	
		// Compute inner portrait coordinates and values for drawing character sprite
		inner_portrait_top_left.x = outer_portrait_top_left.x + scaled_const_inner_portrait_margain;
		inner_portrait_top_left.y = outer_portrait_top_left.y + scaled_const_inner_portrait_margain;
	
		// Compute the outer text box coordinates and values
		outer_text_box_top_left.x = outer_portrait_top_right.x + scaled_const_inbetween_space;
		outer_text_box_top_left.y = outer_portrait_top_left.y;
		outer_text_box_width = diagzone_top_right.x - outer_portrait_top_left.x - const_portrait_box_width - const_inbetween_space;
		outer_text_box_top_right.x = outer_text_box_top_left.x + outer_text_box_width;
		outer_text_box_top_right.y = outer_text_box_top_left.y;
	
		// Compute the inner text box coordinates and values
		inner_text_box_top_left.x = outer_text_box_top_left.x + scaled_const_inner_text_box_margain;
		inner_text_box_top_left.y = outer_text_box_top_left.y + scaled_const_inner_text_box_margain;
		inner_text_box_width = (outer_text_box_width * opening_anim_scaler) - 2 * scaled_const_inner_text_box_margain;
		
		// Compute next arrow coordinates
		// HACK: Should probably use better anchors in case we need to animate the 
		// skip arrow onto a scaling dialogue box but it works :p
		next_arrow_top_left.x = diagzone_bottom_right.x - const_next_arrow_offset.x;
		next_arrow_top_left.y = diagzone_bottom_right.y - const_next_arrow_offset.y;
		
		// in case the sprite was flipped, now we need to offset the portrait anchor
		if (is_sprite_flipped)
		{
			inner_portrait_top_left.x += const_inner_portrait_width; 
		}
		break;
		
	case DIALOGUE_TYPE.ONLY_TEXT:
		// Its only the text box, so compute its coordinates
		outer_text_box_top_left.x = diagzone_top_left.x;
		outer_text_box_top_left.y = diagzone_top_left.y;
		outer_text_box_width = diagzone_top_right.x - diagzone_top_left.x;
		outer_text_box_top_right.x = outer_text_box_top_left.x + outer_text_box_width * opening_anim_scaler;
		outer_text_box_top_right.y = outer_text_box_top_left.y;
		
		// Compute the inner text box coordinates and values
		inner_text_box_top_left.x = outer_text_box_top_left.x + scaled_const_inner_text_box_margain;
		inner_text_box_top_left.y = outer_text_box_top_left.y + scaled_const_inner_text_box_margain;
		inner_text_box_width =  outer_text_box_width - 2 * scaled_const_inner_text_box_margain;
		
		// Compute next arrow coordinates
		// HACK: Should probably use better anchors in case we need to animate the 
		// skip arrow onto a scaling dialogue box but it works :p
		next_arrow_top_left.x = diagzone_bottom_right.x - const_next_arrow_offset.x;
		next_arrow_top_left.y = diagzone_bottom_right.y - const_next_arrow_offset.y;
		break;
		
	default:
		show_debug_message("ERROR! Dialogue type not defined in User event at Dialogue Controller");
		break;
}












