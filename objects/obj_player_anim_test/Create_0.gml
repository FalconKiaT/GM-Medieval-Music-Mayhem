/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 0.3333; //30fps * 0.333 = 10fps

last_player_animation = "IDLE"

//Define an idle animation using only the first frame of the sprite
AnimationAdd("IDLE",noone,noone,anim_Spd,4,5);
AnimationAdd("LEFT",image_xscale,image_yscale,anim_Spd,0,2);
AnimationAdd("RIGHT",-image_xscale,image_yscale,anim_Spd,0,2);
AnimationAdd("UP",noone,noone,anim_Spd,2,4);