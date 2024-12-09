/// @description Handles image index and color
// You can write your code in this editor
if(global.max_level >= 3 && position_meeting(mouse_x,mouse_y,self))
{
	image_index = 1; //pressed
}
else if(global.max_level >= 3){
	image_index = 0; //unpressed
}
else if(position_meeting(mouse_x,mouse_y,self)){
	image_blend = make_colour_rgb(200, 200, 200); //black tint
}
else{
	image_blend = make_colour_rgb(255, 255, 255); //make button white again
}