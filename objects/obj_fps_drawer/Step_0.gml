/// @description Compute FPS Average

// Add the current FPS to the sample array
array_push(fps_samples, fps_real);

// Ensure the array length does not exceed fps_sample_count
if (array_length(fps_samples) > fps_sample_count) 
{
    array_delete(fps_samples, 0, 1); // Pop oldest
}

// Compute the average FPS
var total_fps = 0;
for (var i = 0; i < array_length(fps_samples); i++) 
{
    total_fps += fps_samples[i];
}
average_fps = total_fps / array_length(fps_samples);