AnimationInit(); //set up animation

//Define an idle animation using only the first frame of the sprite
AnimationAdd("IDLE",noone,noone,1,0,0);
AnimationAdd("RUN_LEFT",-image_xscale,image_yscale,0.4,1,8);
AnimationAdd("RUN_RIGHT",image_xscale,image_yscale,0.4,1,8);