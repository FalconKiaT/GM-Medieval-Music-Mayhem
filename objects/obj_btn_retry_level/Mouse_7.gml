// Feather disable GM2017
//returns the button back to black again
image_blend = make_color_rgb(200, 200, 200);
// determines which room to go to

switch global.current_level{
	case 1:
	health = 100;
	score = 0;
	room_goto(rm_level1)
	break;
	case 2:
	health = 100;
	score = 0;
	room_goto(rm_prototype)
	break;
	//so on 
	
}