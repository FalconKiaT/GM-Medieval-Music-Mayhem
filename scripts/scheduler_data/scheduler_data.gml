// Define the scheduled functions lists

// Create a list of functions created on timers
global.timed_func_list = ds_list_create();

// Create a list of functions set to run on a condition
global.conditioned_func_list = ds_list_create();

// Store a reference to the timer obj
global.global_scheduler_timer_exists = undefined;

// Global seed counter
global.current_seed_val = 1;

// Function to create a random 30 digit id for the scheduler to use to find scheduled functions
function scheduler_generate_random_30_digit_number() {
    
	// Get previous seed
	var _previous_seed = random_get_seed();
	
	// Set seed to current scheduler
	random_set_seed(global.current_seed_val)
    
    // Initialize an empty string to hold the 30-digit number
    var number_str = "";
    
    // Generate 30 random digits
    for (var i = 0; i < 30; i++) {
        // Generate a random digit between 0 and 9
        var digit = irandom_range(0, 9);
        // Append the digit to the number string
        number_str += string(digit);
    }
	
	// Increment scheduler seed
	global.current_seed_val += 1;
	
	// Reset the seed
	random_set_seed(_previous_seed)
    
    // Return the 30-digit number as an integer
    return int64(number_str);
}