// Script defining the lock skip tag so the player doesnt skip this dialogue
// Format: [lock_skip]
function lock_skip_script(_element, _parameter_array, _character_index)
{
	obj_dialogue_controller.lock_skip();
}