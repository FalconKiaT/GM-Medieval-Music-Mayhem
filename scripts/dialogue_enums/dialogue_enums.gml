// Placed here on its own script file so all other objects can reference these enums

// <------------------------> ENUM DEFINITIONS <------------------------>

// This enum should be used by other objects to poll for the state of dialogue
enum DIALOGUE_STATE 
{
	OPENING,
	ACTIVE,
	CLOSING,
	INACTIVE,
	NULL,
}

// Enum to check what type of dialogue box is being shown
enum DIALOGUE_TYPE
{
	ONLY_TEXT,
	PORTRAIT_RIGHT,
	PORTRAIT_LEFT,
	NO_BACKGROUND_ONLY_TEXT,
}

// Variable user for the state of the typewritter
enum PRINTING_STATE
{
	PRINTING,
	FINISHED,
}

// Enum used to open the dialogue box of specific rooms
enum DIALOGUE_ID
{
	NULL,
	DEMO,
	ONE_LINE,
	LEVEL1,
}