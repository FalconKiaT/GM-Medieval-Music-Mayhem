// Feather disable GM2017
image_blend = make_colour_rgb(255, 255, 255); //make button white again
// determines which room to go to

switch global.current_level{
	case 1:
	
	health = 100;
	score = 0;
	global.current_level = 2;
	global.max_level = 2;
	room_goto(rm_dialogue_level1_outro)// placeholder change after implementing levels
	break;
	
	case 2:
	global.current_level = 3;
	health = 100;
	score = 0;
	global.max_level = 3;
	room_goto(rm_dialogue_level2_outro)// placeholder change after implementing levels
	break;
	
	case 3:
	global.current_level = 0;
	health = 100;
	score = 0;
	room_goto(rm_dialogue_level3_outro)// placeholder change after implementing levels
	break;
	
	
	
	//so on 
	
}