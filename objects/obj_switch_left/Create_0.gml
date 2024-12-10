/// @description Insert description here
// You can write your code in this editor
event_inherited()
if (!queued) {
	broadcast_message = ANIM_MESSAGES.CHANNEL_SWITCH
}
appeared = false
image_speed = 0
image_index = 0
if (queued) {
	image_index = 1
	image_alpha = 0
} else {
	health_effect = 0
	feedback_object = obj_feedback_empty
}