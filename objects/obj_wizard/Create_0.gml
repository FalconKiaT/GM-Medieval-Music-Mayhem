// Feather disable GM2017
/// @description Initialize Animation System
// <------------------------> ANIMATION SYSTEM <------------------------>
AnimationInit(); //set up animation
anim_Spd = 0.4; //30fps * 0.4 = 12fps

//Define an idle animation using only the first frame of the sprite
AnimationAdd("IDLE",noone,noone,anim_Spd,1,5);
AnimationAddChained("BOMB",noone,noone,anim_Spd,6,23,1,"IDLE");
AnimationAddChained("SWITCH",noone,noone,anim_Spd,24,41,1,"IDLE");
AnimationAddChained("LIGHTNING",noone,noone,anim_Spd,42,59,1,"IDLE");

AnimationSet("IDLE");

//set up broadcast system for special arrows
reciever = new Receiver();
reciever.add(ANIM_MESSAGES.WIZARD_BOMB, function() {
	AnimationSet("BOMB");
});
reciever.add(ANIM_MESSAGES.WIZARD_SWITCH, function() {
	AnimationSet("SWITCH");
});
reciever.add(ANIM_MESSAGES.WIZARD_LIGHTNING, function() {
	AnimationSet("LIGHTNING");
});