// Script to change the character currently being drawn to the dialogue
// Format: [change_character, sprite_name]
function change_character_script(_element, _parameter_array, _character_index)
{
	var _target_sprite = _parameter_array[0];
	obj_dialogue_controller.change_character_portrait(_target_sprite);
}