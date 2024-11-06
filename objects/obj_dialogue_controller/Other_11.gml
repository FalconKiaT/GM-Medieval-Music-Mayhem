/// @description Set up Dialogue Target Functions

// Function to set up the demo dialogue
function set_up_demo()
{
	// Example of the configuration being done through the typewritter
	add_page("[set_portrait_right][change_character, spr_wiz_neutral][skip_to_next_page]"); 

	// Showcase skip
	add_page("Hello! And welocome to the dialogue system showcase!");
	add_page("The first feature of note is of course the skip button!");
	add_page("If the player ever clicks left mouse, enter or space, they will be able to advance the typewritter effect to completion if they wish to do so");
	add_page("[set_portrait_left]There's also an induced delay between skips to make sure the player doesnt accidentally skip the next dialogue should they wish not to do so");
	
	// Showcase shake animation and dramatic delay effect
	add_page("[lock_skip]How[delay, 500] about[delay, 500] some [delay, 500][shake_dialogue_box, 3, 4]SHAKING!!!![delay, 5000][unlock_skip]");
	add_page("Pretty intense huh?");
	add_page("Did you also notice you couldnt skip ahead while it was happening?");
	
	// Showcase portrait switch
	add_page("You might be wondering, is that all this system can do? What about other characters?");
	add_page("AHA! We DO have support for such a thing, for example...");
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]"); 
	add_page("Ohohohoho! Hello dear citizens, it is I, the King!");
	add_page("[set_portrait_left]Did you also notice that we are switching portraits from left to right?");
	add_page("This system really does it all huh! Hohohoho!");
	
	// Showcase font size change
	add_page("[set_portrait_right][change_character, spr_wiz_neutral][skip_to_next_page]"); 
	add_page("EHEM![delay, 1000] Well, now you have met the king, you really are lucky huh");
	add_page("[set_portrait_right][scale,2]AND I MEAN REALLY LUCKY![/scale][delay,2000] oh my bad...");
	add_page("Sorry, didnt mean to shout...");
	add_page("oh well, the text size can change too!");
	
	// Showcase sprite within dialogue
	add_page("[set_only_text]Onto the next topic, we will probably use this section for tutorials in-game, so how will that look?");
	add_page("Well, Im glad you asked!");
	add_page("See, this system is also capable of placing sprites within the text!");
	add_page("Remember that jolly looking fellow from before? [spr_king_happy_icon,0]");
	add_page("Well, he was king watchumacallit![delay,1000] We dont have a name for him yet...");
	add_page("We will make use of this sytem to introduce arrows! Like these: [spr_left_arrow,0]  [spr_right_arrow,0]  [spr_up_arrow,0]");
	
	// Showcase dynamic speed typing
	add_page("We can also change the speed of the text on the fly!");
	add_page("[speed,3]You better read fast boi or im going to go away! you will forever live with the regret of not having spent enough time training your reading speed in those english classes muahahah![skip_to_next_page][/speed]");
	add_page("Hopefully you managed to capture some of that...");
	
	// Showcase sound effects on text
	add_page("Well what was I talking about...[snd_coin_falling_test]");
	add_page("NOO MY LUCKY COIN! WHERE DID IT GO???");
	add_page("[scale,0.9][wobble]Noooo please where is it???[/wobble][/scale]");
	add_page("[lock_skip]Here?[delay,1000] No...[delay,1000] Here?[delay,2000] [snd_coin_found_test]YES I FOUND IT![delay,500] Never loosing sight of you again![unlock_skip]");
	add_page("Oh did you get that? We can also play sounds while printing text!");
	
	// Showcase special text effects
	add_page("You saw one of the effects just now, but this system has a bunch of other cool animations!");
	add_page("How about some [shake]really shaky text???[/shake]. We can also stop the animations midway");
	add_page("[pulse]Now pulsating text![/pulse]");
	add_page("[wave]Here comes the wave! Weeeee![/wave]");
	add_page("[wheel]This text goes round and round, round and round, round and round[/wheel]");
	add_page("[jitter]Jittery text waaaaaaa[/jitter]");
	add_page("[blink]Now blinking text![/blink]");
	add_page("[#0000FF]Now we are blue![/color]");
	add_page("[#FF0000]Now we are red![/color]");
	add_page("[#00FF00]Now we are green![/color]");
	add_page("[rainbow]Now rainbow text![/rainbow]");
	add_page("[rainbow][wave][wheel]We can even stack these effects![/wave][/rainbow][/wheel]");
	add_page("All thanks to the wonderful and open source [rainbow]Scribble library by JujuAdams![/rainbow]");
	add_page("[set_portrait_right][change_character, spr_wiz_neutral][skip_to_next_page]"); 
	add_page("Well, thats it folks! I hope you enjoyed the Demo!");
	add_page("Bye Bye!"); 
}

// Function to reset the page array
function reset_page_array()
{
	array_resize(page_list, 0);
}

// Function to add pages without having to worry about tracking the index
function add_page(str_page)
{
	var curr_size = array_length(page_list);
	page_list[curr_size] = str_page
}

// Function called only locally to set up the target page
function set_up_dialogue_id(target)
{
	// Reset the page array and current page before loading
	reset_page_array();
	current_page = 0;
	// Load the respective dialogue id
	switch (target)
	{
		case DIALOGUE_ID.DEMO:
			set_up_demo();
			break;
		
		default:
			show_error("ERROR! THIS DIALOGUE ID HASNT BEEN CONFIGURED YET!", false)
			return;
	}
	
	// After setting up, compute the page amount and set the global field
	page_amount = array_length(page_list);
}