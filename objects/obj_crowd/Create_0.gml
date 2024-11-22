/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 1.1; 

old_score = 0;

// The crowd jumps or stops
AnimationAddFinite("YAY",image_xscale,image_yscale,anim_Spd,1,47,1);
AnimationAdd("STOP",noone,noone,0,1,1)

