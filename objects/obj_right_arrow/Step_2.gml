/// @description Move and check for out of bounds
// You can write your code in this editor

event_inherited()

x -= arrow_velocity * dt

if (x < obj_right_arrow_slot.x - 0.4 * sprite_width) {
	image_alpha -= 0.5 * (1.1 - image_alpha)
}