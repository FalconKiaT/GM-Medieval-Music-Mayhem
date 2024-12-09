// Feather disable GM2017

/// @description Set up Dialogue Target Functions

// IAN HACK: I dont know if we reallu should go all out and incorporate a file reader...
// so im just going to do this undertale style for now xd

// <--------------------------------> MANAGEMENT FUNCS <-------------------------------->

// Function to reset the page array
function reset_page_array()
{
	array_resize(page_list, 0);
}

/**
 * Adds a page to the page list without needing to track the index manually.
 * @param {string} str_page - The page to be added to the list.
 */
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
			
		case DIALOGUE_ID.ONE_LINE:
			 set_up_one_line();
			break;
			
		case DIALOGUE_ID.MAIN_INTRO
:
			set_up_main_intro();
			break;
			
		case DIALOGUE_ID.LEVEL_ONE_INTRO:
			set_up_level_one_intro();
			break;
			
		case DIALOGUE_ID.LEVEL_ONE_OUTRO:
			set_up_level_one_outro();
			break;
			
		case DIALOGUE_ID.LEVEL_TWO_INTRO:
			set_up_level_two_intro();
			break;
			
		case DIALOGUE_ID.LEVEL_TWO_OUTRO:
			set_up_level_two_outro();
			break;
			
		case DIALOGUE_ID.LEVEL_THREE_INTRO:
			set_up_level_three_intro();
			break;
			
		case DIALOGUE_ID.LEVEL_THREE_OUTRO:
			set_up_level_three_outro();
			break;
		
		case DIALOGUE_ID.EPILOGUE:
			set_up_epilogue();
			break;
		
		default:
			show_error("ERROR! THIS DIALOGUE ID HASNT BEEN CONFIGURED YET!", false)
			return;
	}
	
	// After setting up, compute the page amount and set the global field
	page_amount = array_length(page_list);
}

// <-----------------------------------> DIALOGUE/CUTSCENE SET UP <----------------------------------->

// Function to set up the demo dialogue
function set_up_demo()
{
	// The first dialogue box layout must be set through code
	dialogue_current_type = DIALOGUE_TYPE.PORTRAIT_LEFT
	
	// Example of the configuration being done through the typewritter
	add_page("[change_character, spr_player_neutral][skip_to_next_page]"); 

	// Showcase skip
	add_page("Hello! And welocome to the dialogue system showcase!");
	add_page("The first feature of note is of course the skip button!");
	add_page("If the player ever clicks left mouse, enter or space, they will be able to advance the typewritter effect to completion if they wish to do so");
	add_page("[set_portrait_left]There's also an induced delay between skips to make sure the player doesnt accidentally skip the next dialogue should they wish not to do so");
	
	// Showcase shake animation and dramatic delay effect
	add_page("[lock_skip]How[delay, 500] about[delay, 500] some [delay, 500][shake_dialogue_box, 3, 4]SHAKING!!!![delay, 4000][unlock_skip]");
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
	add_page("[set_portrait_right][change_character, spr_player_neutral][skip_to_next_page]"); 
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
	add_page("[set_portrait_right][change_character, spr_player_neutral][skip_to_next_page]"); 
	add_page("Well, thats it folks! I hope you enjoyed the Demo!");
	add_page("Bye Bye!"); 
}


// Set up one dialogue line test
function set_up_one_line()
{
	// Print only one line to dialogue
	dialogue_current_type = DIALOGUE_TYPE.PORTRAIT_LEFT
	add_page("[change_character, spr_player_neutral][skip_to_next_page]"); 
	add_page("Wassgood Im only one line long dayum. Now im goneeeeeeee....");
}


// Set up the dialogue/cutscene for the main intro
function set_up_main_intro()
{
	// Set up the dialogue to have no background, undertale style
	dialogue_current_type =  DIALOGUE_TYPE.NO_BACKGROUND_ONLY_TEXT;
	
	// Helper variables
	var _col_end = "[/color]"
	var _tl_short = "[execute_timeline_moment, tl_main_intro, " // Missing: integer_moment]
	
	// Cutscene settings
	var _melodia_col = "[" + const_kingdom_text_color + "]"
	var _beathalzar_col = "[" + const_wizard_speaker_color + "]"
	var _king_color = "[" + const_king_speaker_color + "]"
	var _player_col = "[" + const_player_speaker_color + "]"
	var _murder_col = "[#FF0000]"
	
	// Add pages
	var _line_one = "[set_only_text_no_bg]" + _tl_short + "1]" + "Once upon a time, the " + _melodia_col + "Kingdom of Melodia" + _col_end + " was a prosperous city. "
	_line_one += "The people would smile and sing. Bands would play in the town square and villagers would dance in the street. "
	_line_one += "Love and song abounded as it gave the people a power of their own."
	add_page(_line_one);
	
	var _line_two = _tl_short + "2]" + "All of this merriment was seen over by the just and handsome [wave]" + _king_color + "King Al Cappella[/wave] " + _col_end
	_line_two += "The kingdom had lived in this harmony for many years under his rule. Until..."
	add_page(_line_two)
	
	var _line_three = _tl_short + "3]" + _beathalzar_col + "[shake]" +  + "Beathalzar[/shake]" + _col_end + ", the court wizard and the closest advisor to "
	_line_three += _king_color + "King Cappella" + _col_end + ", " + _murder_col + "murdered" + _col_end + " the king and usurped the throne. "
	_line_three += "He sent the kingdom into a dark age as he banned all music, leaving him and his royal guard as the sole ones to use this power."
	add_page(_line_three)
	
	add_page(_tl_short + "4]" + "Now, a kingdom hangs in balance, soon to collapse from despair.")
	add_page(_tl_short + "5]" + "However, " + _player_col + "one lone wizard" + _col_end + " will stand against this tyranny in this tale. This is that little wizard's story.")
	add_page(_tl_short + "6]" + "There will be failure, there will be triumph, and there will be dancing. However, the ending of this story will be solely determined by you. So sit back and enjoy the show.")
}


// Level One Intro Dialogue
function set_up_level_one_intro(){
	
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;
	
	// Macro variables
	var _king_col = "[" + const_king_speaker_color + "]"
	var _kingdom_col = "[" + const_kingdom_text_color + "]"
	var _wizard_col = "[" + const_wizard_speaker_color + "]"
	var _end_col = "[/color]"


	// Add pages
	add_page("[set_only_text][skip_to_next_page]")
	add_page("A lone wizard finds himself in a mysterious cave, called by the strange noises coming from within...");
	
	add_page("[change_character, spr_player_neutral][set_portrait_left][skip_to_next_page]")
	add_page("This place gives me the creeps...")
	
	add_page("[set_only_text][skip_to_next_page]")
	add_page("SNAP!")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("Who's there?")
	
	add_page("[set_only_text][skip_to_next_page]")
	add_page("[speed,0.02][scale,1.5]...[/scale][/speed]")
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]")
	add_page("[shake_dialogue_box, 2, 1]ha HA!")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("!")
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]")
	add_page("Do not be afraid, child! It is me!")
	
	add_page("[set_portrait_left][change_character, spr_player_angry][skip_to_next_page]")
	add_page("I'm like 30...")
	add_page("[change_character, spr_player_shocked]Wait, are you " + _king_col + "King Cappella!?" + _end_col)
	
	add_page("[set_portrait_right][change_character, spr_king_neutral][skip_to_next_page]")
	add_page("I'm sure you are heartbroken to see your glorious ruler in such a sorry state, but yes it is I! King Al Cappella, the King of Melodia!")
	add_page("Or, at least I was...")
	add_page("However, boy, I have called you here for a reason. My " + _kingdom_col + "Kingdom" + _end_col + " is in ruin and I can do nothing to stop it while I'm banished in this lonely cave.")
	add_page("[change_character, spr_king_happy]I need a great wizard to avenge my death and save my kingdom, and that's [scale,1.5]YOU[/scale], my boy!")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("You want me to save the kingdom? I'm not sure what you want me to do, sir.")
	
	add_page("[set_portrait_right][change_character, spr_king_upset][skip_to_next_page]")
	add_page("When that dastardly [shake]" + _wizard_col + "Beathalzar" + _end_col + "[/shake] killed and banished me, he failed to get rid of my true power!")
	add_page("[change_character, spr_king_happy]And, now, I shall bestow it upon you.")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("What power are you talking about?")
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]")
	add_page("The power of [scale,1.5][rainbow][wave]DANCE![/wave][/rainbow][/scale]")
	add_page("That evil wizard uses the magic of music to suppress the voice of the people, but I can teach you to use it to lift spirits and fight against those tyrants!")
	add_page("Let me show you how it's done!")
}


// Set up the level 1 outro
function set_up_level_one_outro()
{
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;
	
	// Macro variables
	var _wizard_col = "[" + const_wizard_speaker_color + "]"
	var _end_col = "[/color]"

	// Add pages
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]")
	add_page("[wave][rainbow]Fantastic[/rainbow][/wave], my boy! With moves like that, " + _wizard_col + "[shake]Beathalzar[/shake]" + _end_col + " and his goons won't stand a chance!")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("Wow, that was really cool...")
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]")
	add_page("Chill, indeed! Now, you must embark on a quest to stop that wizard. Make your way to the castle and please stop " + _wizard_col + "[shake]Beathalzar![/shake]" + _end_col)
}


// Set up the level 2 intro
function set_up_level_two_intro()
{
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;

	// Add pages
	add_page("[set_portrait_left][change_character, spr_player_angry][skip_to_next_page]");
	add_page("I must avenge the King, and order to do that, I must get to the castle!");
	
	add_page("[set_portrait_right][change_character, spr_guard_angry][skip_to_next_page]");
	add_page("[scale,2]You there! Halt![/scale]");
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]");
	add_page("Huh?");
	
	add_page("[set_portrait_right][change_character, spr_guard_angry][skip_to_next_page]");
	add_page("Yes, you there! Thou right there with the big hat and ugly sandals!");
	
	add_page("[set_portrait_left][change_character, spr_player_angry][skip_to_next_page]");
	add_page("[scale,0.8]Rude...[/scale]");
	add_page("[change_character, spr_player_neutral]Yes?");
	
	add_page("[set_portrait_right][change_character, spr_guard_neurtal][skip_to_next_page]");
	add_page("State thine business! What brings you to our beautiful capital?");
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]");
	add_page("Uhh... I'm a visitor for... the king. Beathalzar?");
	
	add_page("[set_portrait_right][change_character, spr_guard_neurtal][skip_to_next_page]");
	add_page("Visitor, eh? From the badlands?");
	add_page("[change_character, spr_guard_angry]I don't think so! You've got wizard written all over you!");
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]");
	add_page("Yikes!");
	
	add_page("[set_portrait_right][change_character, spr_guard_angry][skip_to_next_page]");
	add_page("Thou know no Wizard or musician of any type are allowed in these hallowed halls!");
	add_page("If you have forgotten, then I shall knock some sense into you! [scale,1.5]En garde![/scale]");
}


// Set up the level 2 outro
function set_up_level_two_outro()
{
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;

	// Add pages
	add_page("[set_portrait_right][change_character, spr_guard_shocked][skip_to_next_page]")
	add_page("[shake]Ughn...[/shake]")
	add_page("[change_character, spr_guard_angry]I am head guard of the capital, how could I fail?")
	add_page("No... I must defend my city from this vagrant... I must continue to fight...")
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]")
	add_page("We really don't! We can just pretend this didn't happen.")
	
	add_page("[set_portrait_right][change_character, spr_guard_neurtal][skip_to_next_page]")
	add_page("Heh, you would like that, wouldn't you? Thou intends to erase this battle from history...")
	add_page("[change_character, spr_guard_angry][scale,1.5]I think not![/scale] I will never forget the day I fought you and lost, wizard!")
	
	add_page("[set_portrait_left][change_character, spr_player_neutral][skip_to_next_page]")
	add_page("Wait, so we are done?")
	
	add_page("[set_portrait_right][change_character, spr_guard_angry][skip_to_next_page]")
	add_page("Thou may have won at these gates, but our rivalry has just begun!")
	add_page("You will see me again, O sandaled one! That is a promise!")
	
	add_page("[set_portrait_left][change_character, spr_player_neutral][skip_to_next_page]")
	add_page("Oh... I mean we can later...")
	add_page("I'm just going to scoot past you now...")
}


// Set up the level 3 intro
function set_up_level_three_intro()
{
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;
	
	// Macro variables
	var _king_col = "[" + const_king_speaker_color + "]"
	var _end_col = "[/color]"

	// Add pages
	add_page("[set_portrait_left][change_character, spr_player_neutral][skip_to_next_page]");
	add_page("[shake]Whew![/shake] I'm finally at the king's castle. Now where would he be?");
	
	add_page("[set_portrait_right][change_character, spr_wizard_neutral][skip_to_next_page]");
	add_page("Looking for someone?");
	
	add_page("[set_portrait_left][change_character, spr_player_shocked][skip_to_next_page]");
	add_page("Ah! Um, I mean yes![change_character, spr_player_angry] I am here to defeat you, Beathalzar!");
	add_page("[change_character, spr_player_neutral]You are Beathalzar, yes?");
	
	add_page("[set_portrait_right][change_character,spr_wizard_shocked][skip_to_next_page]");
	add_page("You are bold to challenge me directly to my face, boy! Why do you wish to challenge me so?");
	
	add_page("[set_portrait_left][change_character, spr_player_angry][skip_to_next_page]");
	add_page("The " + _king_col + "Old King" + _end_col + " has sent me to defeat you!");
	
	add_page("[set_portrait_right][change_character,spr_wizard_shocked][skip_to_next_page]");
	add_page("That geezer?! I thought he died!");
	add_page("[change_character,spr_wizard_angry]No matter! I'd never say no to a challenge, let's begin!");
}


// Set up the level 3 outro
function set_up_level_three_outro()
{
	// Set up layout
	dialogue_current_type =  DIALOGUE_TYPE.ONLY_TEXT;

	// Add pages
	add_page("[set_portrait_right][change_character, spr_wizard_shocked][skip_to_next_page]");
	add_page("[shake]You... I... have failed...[/shake]");
	add_page("[shake]All the music in the country... All that power for nothing...[/shake]");
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]");
	add_page("[rainbow][wave]Congratulations![/wave][/rainbow]");
	
	add_page("[set_portrait_left][change_character,spr_player_shocked][skip_to_next_page]");
	add_page("AH!");
	add_page("You were here the whole time?");
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]");
	add_page("Of course, boy! I wanted to see your quest come to fruition!");
	add_page("And now, the kingdom is yours and you bring music back into the hands of the people!");
	
	add_page("[set_portrait_left][change_character,spr_player_neutral][skip_to_next_page]");
	add_page("Wait, what do you mean it's mine?");
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]");
	add_page("I mean you have defeated the ruler of the kingdom which means you are now the king! That's the rule!");
	
	add_page("[set_portrait_left][change_character,spr_player_shocked][skip_to_next_page]");
	add_page("That's a really bad rule...");
	
	add_page("[set_portrait_right][change_character, spr_king_happy][skip_to_next_page]");
	add_page("You can worry about that later, for now, take your throne and give back the power of music to the people!");
}


// Set up the epilogue
function set_up_epilogue()
{
	// Set up the dialogue to have no background, undertale style
	dialogue_current_type =  DIALOGUE_TYPE.NO_BACKGROUND_ONLY_TEXT;
	
	// Macro variables
	var _tl_short = "[execute_timeline_moment, tl_epilogue, " // Missing: integer_moment]

	// Add pages
	add_page("[set_only_text_no_bg]" + _tl_short + "1][skip_to_next_page]")
	add_page("The little wizard had defeated the evil Beathalzar and became the new ruler of the kingdom.")
	
	add_page("[set_only_text_no_bg]" + _tl_short + "2][skip_to_next_page]")
	add_page("Under his rule, music returns to the land and people once again dance in the street")
	
	add_page("[set_only_text_no_bg]" + _tl_short + "3][skip_to_next_page]")
	add_page("And so, we close the chapter on our little wizard.")
}






