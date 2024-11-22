/// @description Prevent memory leaks
// You can write your code in this editor

ds_queue_destroy(global.current_spawned_up_arrows)
ds_queue_destroy(global.current_spawned_left_arrows)
ds_queue_destroy(global.current_spawned_right_arrows)

ds_queue_destroy(global.current_spawned_up_arrows_bombs)
ds_queue_destroy(global.current_spawned_left_arrows_bombs)
ds_queue_destroy(global.current_spawned_right_arrows_bombs)
