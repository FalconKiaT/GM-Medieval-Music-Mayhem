/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 1.1; 

old_score = 0;

// The crowd jumps or stops
AnimationAddChained("YAY",noone,noone,anim_Spd,1,46,1, "STOP");
AnimationAdd("STOP",noone,noone,0,1,1)
AnimationSet("STOP")
