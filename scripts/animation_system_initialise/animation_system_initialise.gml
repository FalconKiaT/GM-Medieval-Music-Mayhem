//Call script in object's create event to initialize its variables for animation
//Place in create of object you want to animate
function animation_system_initialise(){
	//controlling variables
	Animation = 0; //current animation sprite index starting from 0
	AniImage  = 0; //current animation image
	AniSpeed  = 0; //current animation speed
	AniEnd    = 0; //a flag that becomes 1 when an animation is finished playing
	
	SpriteArray = 0; //array containing each sprite
}

//draw an animation like this:
//draw_sprite_ext(SpriteArray[Animation, 0], floor(AniImage), x, y,
//	image_xscale, image_yscale, image_angle, image_blend, image_alpha);

//reference: https://forum.gamemaker.io/index.php?threads/simple-animation-system.25929/