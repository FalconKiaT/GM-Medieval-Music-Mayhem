// Feather disable GM2017
/// @description Draw Dialogue Box

/* IAN NOTE:
 * I really dont like the amount of logic im handling here in the draw event,
 * given the warning the professor gave us during lecture about handling logic
 * in this event. I want to see just how bad of an impact it has on our game,
 * if its really really bad, ill migrate all logic checks into end step and just
 * use the results from there here. It does mean delcaring a crap ton of fields in
 * the create event, which is why the reason I avoided it up until now... 
 * (As a habit, I only use the variable definitions for values other objects should access)
 */

// if not active, dont draw
if (dialogue_current_state == DIALOGUE_STATE.INACTIVE)
{
	return;
}

// Animation speed
image_speed = is_skip_locked_by_event ? 0 : base_anim_speed; // Will stop any animations if paused
var _flip_float = is_sprite_flipped ? -1 : 1; // Will be -1 if is_sprite_flipped is set to true

// Check for animating the portrait moving and/or the arrow
var portrait_img_index = image_index;
var arrow_img_index = image_index;
if (is_dialogue_paused)
{
	// Pause both the potrait and the arrow animations
	portrait_img_index = 0;
	arrow_img_index = 0;
}
// Stop movement if the printing finished, its pausing due to a delay flag, or the game is paused
else if (text_printing_state == PRINTING_STATE.FINISHED || dialogue_general_typist.get_delay_paused())
{
	// Pause the portrait animation
	portrait_img_index = 0;
}

// Check what type of dialogue box to draw
switch (dialogue_current_type)
{
	case DIALOGUE_TYPE.ONLY_TEXT:
		// Only draw one dialogue box for the text
		draw_sprite_ext(spr_dialogue_box, image_index, outer_text_box_top_left.x, outer_text_box_top_left.y, outer_text_box_width / const_dialogue_box_sprite_width * opening_anim_scaler, const_dialogue_box_height / const_dialogue_box_sprite_height * opening_anim_scaler, 0, c_white, 1);
		// Check if the dialogue box has finished opening and check if the text has finished printing to show next arrow
		if (dialogue_current_state == DIALOGUE_STATE.ACTIVE && text_printing_state == PRINTING_STATE.FINISHED && !(is_skip_advance_on_cooldown || is_skip_locked_by_event))
		{
			// Draw next arrow
			draw_sprite_ext(spr_next_arrow, arrow_img_index, next_arrow_top_left.x, next_arrow_top_left.y, 1, 1, 0, c_white, 1);
		}
		break;
	
	case DIALOGUE_TYPE.PORTRAIT_LEFT:
		// Draw a portrait on the left and the text box on the right
		// Text Box
		draw_sprite_ext(spr_dialogue_box, image_index, outer_text_box_top_left.x, outer_text_box_top_left.y, outer_text_box_width / const_dialogue_box_sprite_width * opening_anim_scaler, const_dialogue_box_height / const_dialogue_box_sprite_height * opening_anim_scaler, 0, c_white, 1);
		// Portrait Box
		draw_sprite_ext(spr_dialogue_box, image_index, outer_portrait_top_left.x, outer_portrait_top_left.y, const_portrait_box_width / const_dialogue_box_sprite_width * opening_anim_scaler, const_dialogue_box_height / const_dialogue_box_sprite_height * opening_anim_scaler, 0, c_white, 1);
		// Check if the dialogue box has finished opening
		if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
		{
			// Character Sprite
			draw_sprite_ext(current_potrait_sprite, portrait_img_index, inner_portrait_top_left.x, inner_portrait_top_left.y, (const_inner_portrait_width / sprite_get_width(current_potrait_sprite)) * opening_anim_scaler * _flip_float, (const_inner_portrait_height / sprite_get_height(current_potrait_sprite)) * opening_anim_scaler, 0, c_white, 1);
			// Check if the text has finished printing to show next arrow
			if (text_printing_state == PRINTING_STATE.FINISHED && !(is_skip_advance_on_cooldown || is_skip_locked_by_event))
			{
				// Draw next arrow
				draw_sprite_ext(spr_next_arrow, arrow_img_index, next_arrow_top_left.x, next_arrow_top_left.y, 1, 1, 0, c_white, 1);
			}
		}
		
		break;
	
	case DIALOGUE_TYPE.PORTRAIT_RIGHT:
		// Draw a portrait on the right and the text box on the left
		// Text Box
		draw_sprite_ext(spr_dialogue_box, image_index, outer_text_box_top_left.x, outer_text_box_top_left.y, outer_text_box_width / const_dialogue_box_sprite_width * opening_anim_scaler, const_dialogue_box_height / const_dialogue_box_sprite_height * opening_anim_scaler, 0, c_white, 1);
		// Portrait
		draw_sprite_ext(spr_dialogue_box, image_index, outer_portrait_top_left.x, outer_portrait_top_left.y, const_portrait_box_width / const_dialogue_box_sprite_width * opening_anim_scaler, const_dialogue_box_height / const_dialogue_box_sprite_height * opening_anim_scaler, 0, c_white, 1);
		// Check if the dialogue box has finished opening
		if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
		{
			// Character Sprite
			draw_sprite_ext(current_potrait_sprite, portrait_img_index, inner_portrait_top_left.x, inner_portrait_top_left.y, (const_inner_portrait_width / sprite_get_width(current_potrait_sprite)) * opening_anim_scaler * _flip_float, (const_inner_portrait_height / sprite_get_height(current_potrait_sprite)) * opening_anim_scaler, 0, c_white, 1);
			// Check if the text has finished printing to show next arrow
			if (text_printing_state == PRINTING_STATE.FINISHED && !(is_skip_advance_on_cooldown || is_skip_locked_by_event))
			{
				// Draw next arrow
				draw_sprite_ext(spr_next_arrow, arrow_img_index, next_arrow_top_left.x, next_arrow_top_left.y, 1, 1, 0, c_white, 1);
			}
		}
		
		break;
		
	case DIALOGUE_TYPE.NO_BACKGROUND:
		// Check if the dialogue box has finished opening and check if the text has finished printing to show next arrow
		if (dialogue_current_state == DIALOGUE_STATE.ACTIVE && text_printing_state == PRINTING_STATE.FINISHED && !(is_skip_advance_on_cooldown || is_skip_locked_by_event))
		{
			// Draw next arrow
			draw_sprite_ext(spr_next_arrow, arrow_img_index, next_arrow_top_left.x, next_arrow_top_left.y, 1, 1, 0, c_white, 1);
		}
		break;
	
	default:
		show_debug_message("ERROR! Dialogue type not defined in Draw GUI of Dialogue Controller");
		break;
}

// Draw Text
if (dialogue_current_state == DIALOGUE_STATE.ACTIVE)
{
	scribble(page_list[current_page_idx])
	.starting_format("font_dialogue", c_white)
	.wrap(inner_text_box_width, const_inner_text_box_height, false)
	.draw(inner_text_box_top_left.x, inner_text_box_top_left.y, dialogue_general_typist) // Draw should always be the last one
}







