// Updates current animation and perform tasks when the animation ends
// To be called in step events
function animation_system_update(){
	AniEnd = 0;
	
	//increase frame by the speed
	AniImage += AniSpeed;
	
	//check for animations
	if(is_array(SpriteArray))
	{
		//get the end of the animation
		var last;
		last = sprite_get_number(SpriteArray[Animation, 0]);
		
		//playing forward
		if(AniSpeed >= 0 && AniImage >= last)
		{
			//animation is over
			AniEnd = 1;
			
			//reset animation
			AniImage = 0;
		}
		
		//playing backwards
		if(AniSpeed < 0 && AniImage <= 0)
		{
			//animation is over
			AniEnd = 1;
			
			//reset animation
			var ani, num;
			ani = SpriteArray[Animation, 1];
			num = last;
			if(last != -1)
			{
				num = sprite_get_number(SpriteArray[ani, 0]);
			}
			AniImage = num;
		}
	}
	
	//animation ending handling
	if(AniEnd)
	{
		//execute script
		var script;
		script = SpriteArray[Animation, 2];	
		if (script != -1) script_execute(script, -1);
  
        //move on to next animation if necessary
        var ani;
        ani = SpriteArray[Animation, 1];
        if (ani != -1) animation_set(ani, -1, -1);
	}
	
}