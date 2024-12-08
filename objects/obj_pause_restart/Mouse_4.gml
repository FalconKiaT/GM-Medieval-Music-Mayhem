/// @description Restart Game

// Dont do anything if not visible
if (!visible)
{
	return;
}

show_debug_message("Broadcaster Restart Clicked from object")
broadcast(PAUSE_MENU.RESTART_BTN_CLICKED)