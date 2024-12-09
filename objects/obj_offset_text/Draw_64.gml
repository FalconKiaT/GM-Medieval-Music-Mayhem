/// @description Insert description here
// You can write your code in this editor

// Draw offset
draw_set_halign(fa_left)
draw_set_color(c_white)
draw_text(x, y, string_format(global.note_timing_offset, 1, 0) + " ms")