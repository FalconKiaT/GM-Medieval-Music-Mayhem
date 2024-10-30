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
        if (array_length(SpriteArray) >= (aniSprite+1))
        {
            if (!is_string(aniSprite)) Animation = aniSprite;
            if (!is_string(aniImage)) AniImage = aniImage;
            if (!is_string(aniSpeed)) AniSpeed = aniSpeed;
        }
	}
}