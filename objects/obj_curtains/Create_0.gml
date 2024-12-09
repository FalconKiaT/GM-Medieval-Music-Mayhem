/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 1.1; //30fps * 1.1 = 10fps

AnimationAdd("OPENED",noone,noone,0,1,1);
AnimationAdd("CLOSED",noone,noone,0,70,70);
AnimationAddFinite("OPEN_CURTAINS",noone,noone,anim_Spd,71,139, 1);
AnimationAddFinite("CLOSE_CURTAINS",noone,noone,anim_Spd,1,70, 1);

AnimationSet("CLOSED");
global.current_game_state = GAME_STATES.PAUSE_TIMER;
AnimationSet("OPEN_CURTAINS");

