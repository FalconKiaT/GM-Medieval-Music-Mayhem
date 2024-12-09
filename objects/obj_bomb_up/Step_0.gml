/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (image_alpha < 1 and queued) {
	queued = false
	ds_queue_dequeue(global.current_spawned_left_arrows)
}