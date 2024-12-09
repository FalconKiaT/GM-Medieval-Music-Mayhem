health = 100;
score = 0;
switch global.current_level{
	case 1:
	
	global.max_level = 2;
	
	break;
	case 2:
	global.max_level = 3;
	break;
	
}
global.current_level = 0;
instance_deactivate_object(obj_global_manager)
room_goto(rm_mainMenu); //switch room