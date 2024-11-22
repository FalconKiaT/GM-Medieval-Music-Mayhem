// Feather disable GM2017
// Animation Script

enum AnimationType
{
	LOOPED,  //loop the animation
	CHAINED, //play another animation after
	FINITE   //loop a set number of times
}

enum AnimationKey
{
	ANIMATION_TYPE = 0,
	ANIMATION_TAG_NAME = 1,
	SCALE_X = 2,
	SCALE_Y = 3,
	MAX_ANIMATION_SPEED = 4,
	START_FRAME = 5,
	END_FRAME = 6,
	REPEATS = 7,
	NEXT_ANIMATION_TAG = 8
}


// call this in an object's create event
function AnimationInit(){
	animation_map = ds_map_create(); //store animation arrays
	current_animation_tag = "none";  //the current animation
	animation_iterations = 0;        //how many time to loop
	image_speed = 0;				 //don't play at start
}

// call in object's destroy event
function AnimationDestroy(){
	if(ds_exists(animation_map,ds_type_map)){
		ds_map_destroy(animation_map)
	}
}

#region animation adders
// add a looping animation
function AnimationAdd(animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame){
	animation_map[? animationTagName] = [AnimationType.LOOPED, animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame, noone, noone];
		//show_debug_message("MAX anim speed " + string(maxAnimationSpeed));
}

// add an animation that plays x times before playing another
function AnimationAddChained(animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame, repeats, nextAnimationTag){
	animation_map[? animationTagName] = [AnimationType.CHAINED, animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame, repeats, nextAnimationTag];
}

// add an animation that plays x times
function AnimationAddFinite(animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame, repeats){
	animation_map[? animationTagName] = [AnimationType.FINITE, animationTagName, scaleX, scaleY, maxAnimationSpeed, startFrame, endFrame, repeats, noone];
}
#endregion


#region helper functions
//Sets the current animation using the Tag name
function AnimationSet(animationTag)
{
	if(current_animation_tag != animationTag)
	{
		current_animation_tag = animationTag;
		animation_iterations = 0;
	}
}

//Gets the current animation using the Tag name
function AnimationGet()
{
	return current_animation_tag;
}
#endregion


function AnimationStep()
{
	AnimationStepExtended(animation_map[? current_animation_tag][AnimationKey.NEXT_ANIMATION_TAG])
}

//Call animation step event
function AnimationStepExtended(animationSpeed)
{
	//check if current animation tag is valid
	if(ds_map_exists(animation_map, current_animation_tag))
	{
		var checkScaleX = animation_map[? current_animation_tag][AnimationKey.SCALE_X];
		var checkScaleY = animation_map[? current_animation_tag][AnimationKey.SCALE_Y];
		
		if(checkScaleX != noone) image_xscale = checkScaleX;
		if(checkScaleY != noone) image_yscale = checkScaleY;
		
		if(is_undefined(animationSpeed))
		{
			//speeds between 0 and 1
			//image_speed = max(min(animation_map[? current_animation_tag][AnimationKey.MAX_ANIMATION_SPEED], 1), 0);
			image_speed = animation_map[? current_animation_tag][AnimationKey.MAX_ANIMATION_SPEED];
		}
		else
		{
			image_speed = animation_map[? current_animation_tag][AnimationKey.MAX_ANIMATION_SPEED];
			//show_debug_message("MaxAnim Speed " + string(animation_map[? current_animation_tag][AnimationKey.MAX_ANIMATION_SPEED]) + ", image speed " + string(image_speed));
		}
		
		//access parameters for current animation
		var startFrame = animation_map[? current_animation_tag][AnimationKey.START_FRAME] - 1;
		var endFrame = animation_map[? current_animation_tag][AnimationKey.END_FRAME];
		var repeats = animation_map[? current_animation_tag][AnimationKey.REPEATS];
		var nextAnimationTag = animation_map[? current_animation_tag][AnimationKey.NEXT_ANIMATION_TAG];
		
		show_debug_message(string(floor(image_index)) + " " + string(startFrame) + " " + string(endFrame))
		//checks for controlling frames
		if(floor(image_index) < startFrame) //animation hasn't started
		{
			image_index = startFrame;
		}
		else if(floor(image_index) > endFrame) //past animation end
		{
			image_index = startFrame;
		}
		else if(floor(image_index) == endFrame) //animation finished
		{
			animation_iterations++;
			switch(animation_map[? current_animation_tag][AnimationKey.ANIMATION_TYPE])
			{
				case AnimationType.LOOPED:
					image_index = startFrame;
					break;
				case AnimationType.FINITE:
					if(animation_iterations >= repeats)
					{
						image_speed = 0;
					}
					break;
				case AnimationType.CHAINED:
					{
						image_speed = 0;
						AnimationSet(nextAnimationTag);
					}
					break;
			}
		}
	}
}