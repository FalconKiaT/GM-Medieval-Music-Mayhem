
// Dont do anything if not visible
if (!visible)
{
	return;
}

// Set vars
health = 100;
score = 0;
audio_stop_all();
room_goto(rm_mainMenu); //switch room
