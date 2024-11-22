/// @description HACK FIGURE OUT BETTER WAY LATER

// Disable GUI Elements depending on how well the user performed


if (!did_broadcast)
{
	if(global.current_game_state == GAME_STATES.WIN)
	{
		//only shows this if its a win
		broadcast(RESULT_SCREEN.DISABLE_TRY_AGAIN_SHIELD)
	
		// Calculate score for stars
	
		// TODO: How to check max score of level?
		if (score <= 10000)
		{
			// One star
			broadcast(RESULT_SCREEN.DISABLE_TWO_STARS);
			broadcast(RESULT_SCREEN.DISABLE_THREE_STARS);
		}
		else if (score <= 20000)
		{
			// Two stars
			broadcast(RESULT_SCREEN.DISABLE_ONE_STARS);
			broadcast(RESULT_SCREEN.DISABLE_THREE_STARS);
		}
		else
		{
			// Three Stars
			broadcast(RESULT_SCREEN.DISABLE_ONE_STARS);
			broadcast(RESULT_SCREEN.DISABLE_TWO_STARS);
		}
	}
	else
	{
		// The player lost...
		broadcast(RESULT_SCREEN.DISABLE_VICTORY_SHIELD);
		broadcast(RESULT_SCREEN.DISABLE_ONE_STARS);
		broadcast(RESULT_SCREEN.DISABLE_TWO_STARS);
		broadcast(RESULT_SCREEN.DISABLE_THREE_STARS);
	}
	// Made a broadcast, dont do it again
	did_broadcast = true;
}


