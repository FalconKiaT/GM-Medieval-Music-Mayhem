// Some functions to bridge knowledge gaps between game maker and unity

function get_delta_time() 
{
    // delta_time gives the time in microseconds since the last frame
    // Divide by 1,000,000 to convert microseconds to seconds
    return delta_time / 1000000;
}