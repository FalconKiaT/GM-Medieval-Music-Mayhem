// Some functions to bridge knowledge gaps between game maker and unity

function get_delta_time() {
    // room_speed is the target frames per second
    return 1 / game_get_speed(gamespeed_fps);
}