// Feather disable GM2017
/// @description Initialize Animation System
// <------------------------> ANIMATION SYSTEM <------------------------>
AnimationInit() //set up animation
anim_Spd = 0.5 //30fps * 0.5 = 15fps

//Define an idle animation using only the first frame of the sprite
AnimationAdd("IDLE",noone,noone,anim_Spd,1,4);
AnimationAddChained("BOMB_LEFT",noone,noone,anim_Spd,5,25,1,"IDLE")
AnimationAddChained("BOMB_RIGHT",noone,noone,anim_Spd,26,45,1,"IDLE")
AnimationAddChained("BOMB_UP",noone,noone,anim_Spd,46,66,1,"IDLE")

AnimationSet("IDLE")

//set up broadcast system for special arrows
reciever = new Receiver();
reciever.add(ANIM_MESSAGES.KING_BOMB_LEFT, function() {
	AnimationSet("BOMB_LEFT");
});
reciever.add(ANIM_MESSAGES.KING_BOMB_RIGHT, function() {
	AnimationSet("BOMB_RIGHT");
});
reciever.add(ANIM_MESSAGES.KING_BOMB_UP, function() {
	AnimationSet("BOMB_UP");
});