// Add an animation to the animation array. Animations are indexed starting at 0.
// Here you can specify an animation to be played next or and a script to play after an animation.
// To be used in create event.
// Ex: animation_walk = animation_system_add_animation(spr_walk, -1, -1)
function animation_system_add_animation(sprite, nextanimation, endscript){
	
    var aniSprite = argument0;
    var aniNextanimation = argument1;
    var aniEndscript = argument2;
 
    //add animation
    var height;
    if (!is_array(SpriteArray))
    {
        //begin new array
        height = 0;
    }
    else
    {
        //add to existing array
        height = array_length(SpriteArray);
    }

    SpriteArray[height, 0] = aniSprite;
    SpriteArray[height, 1] = aniNextanimation;
    SpriteArray[height, 2] = aniEndscript;

    //return animation number (for use to set to this animation)
    return height;
}