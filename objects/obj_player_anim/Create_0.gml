// Feather disable GM2017
/// @description Insert description here
// You can write your code in this editor
// <------------------------> ANIMATION SYSTEM <------------------------>
AnimationInit(); //set up animation
anim_Spd = 0.3333; //30fps * 0.333 = 10fps

//Define an idle animation using only the first frame of the sprite
AnimationAdd("LEFT",image_xscale,image_yscale,anim_Spd,1,2);
AnimationAdd("RIGHT",image_xscale,image_yscale,anim_Spd,11,12);
AnimationAdd("UP",noone,noone,anim_Spd,3,4);
AnimationAdd("MISS",noone,noone,anim_Spd,5,6);
AnimationAdd("IDLE", noone, noone, anim_Spd,7,10);

AnimationSet("IDLE");

//set up broadcast system for missing notes
reciever = new Receiver();
reciever.add(ANIM_MESSAGES.NOTE_MISSED, function() {
	AnimationSet("MISS");
});