/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 0.3333; //30fps * 0.333 = 10fps

old_score = 0;

//Define an idle animation using only the first frame of the sprite
AnimationAdd("YAY",image_xscale,image_yscale,anim_Spd,1,47);

