// Used to set the animation.
// ani is the animation number returned when you created the animation, 
// image is the equivalent of image_index, and speed is the equivalent of image_speed. 
// "" can be used in any of these spaces to not change that specific attribute.
function animation_set(ani, image, speed){
	
    var aniSprite = argument0;
    var aniImage = argument1;
    var aniSpeed = argument2;
	
	//update animation
    if (is_array(SpriteArray))
    {
        if (array_length(SpriteArray) >= (ani_sprite+1))
        {
            if (!is_string(ani_sprite)) Animation = ani_sprite;
            if (!is_string(ani_image)) AniImage = ani_image;
            if (!is_string(ani_speed)) AniSpeed = ani_speed;
        }
	}
}