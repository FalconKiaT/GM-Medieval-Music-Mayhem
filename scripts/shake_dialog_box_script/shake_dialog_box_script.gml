// Script defined for event in the typewritter, will shake the dialogue screen
// Tag on text follows the format: [shake_dialogue_box, intensity, duration]
function shake_dialog_box_script(_element, _parameter_array, _character_index)
{
	var _intensity = real(_parameter_array[0]);
	var _duration = real(_parameter_array[1]);
	obj_dialogue_controller.shake_dialog_box(_intensity, _duration);
}