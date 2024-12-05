// Feather disable GM2017
sprite_index = spr_btn_main_menu
health = 100;
score = 0;
global.current_level = 1;
instance_deactivate_object(obj_global_manager)
room_goto(rm_mainMenu); //switch room