/// @description Insert description here
// You can write your code in this editor

AnimationInit(); //set up animation
anim_Spd = 1.1; //30fps * 1.1 = 10fps

AnimationAdd("OPENED",noone,noone,0,0,1);
AnimationAdd("CLOSED",noone,noone,0,69,70);
AnimationAddFinite("OPEN_CURTAINS",noone,noone,anim_Spd,71,141, 1);
AnimationAddFinite("CLOSE_CURTAINS",noone,noone,anim_Spd,0,70, 1);

AnimationSet("CLOSED");
AnimationSet("OPEN_CURTAINS");