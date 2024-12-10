// Feather disable GM2017
/// @description Initialize Animation System
// <------------------------> ANIMATION SYSTEM <------------------------>
AnimationInit(); //set up animation
anim_Spd = 0.5; //30fps * 0.5 = 15fps

//Define an idle animation using only the first frame of the sprite
AnimationAdd("IDLE",noone,noone,anim_Spd,1,7);
AnimationAddChained("BOMB",noone,noone,anim_Spd,8,18,1,"IDLE");
AnimationAddChained("SWITCH",noone,noone,anim_Spd,19,29,1,"IDLE");

AnimationSet("IDLE");

//set up broadcast system for special arrows
reciever = new Receiver();
reciever.add(ANIM_MESSAGES.GUARD_BOMB, function() {
	AnimationSet("BOMB");
});
reciever.add(ANIM_MESSAGES.GUARD_SWITCH, function() {
	AnimationSet("SWITCH");
});