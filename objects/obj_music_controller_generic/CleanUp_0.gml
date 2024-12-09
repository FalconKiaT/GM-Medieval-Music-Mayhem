/// @description Prevent memory leaks

// Free the memory used by the queues 
ds_queue_destroy(global.current_spawned_up_arrows)
ds_queue_destroy(global.current_spawned_left_arrows)
ds_queue_destroy(global.current_spawned_right_arrows)
