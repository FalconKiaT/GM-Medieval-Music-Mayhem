/// @description Insert description here
// You can write your code in this editor

glow_speed = 0.05

function fade() {
	if (image_alpha > 0) {
		image_alpha -= glow_speed
		if (image_alpha < 0) {image_alpha = 0}
	}
}