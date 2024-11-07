/// @description Insert description here
// You can write your code in this editor

image_xscale += 1.2 * power(0.8 - image_xscale, 2)
image_yscale += 1.2 * power(0.8 - image_yscale, 2)

if (image_xscale > 0.5) {
	image_alpha -= 0.18 * (1.03 - image_alpha)
}

if (image_alpha < 0.05) {
	instance_destroy()	
}