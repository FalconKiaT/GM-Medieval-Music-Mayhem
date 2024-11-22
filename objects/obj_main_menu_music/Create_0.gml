/// @description Play music

global.main_menu_music = 1;
if (!audio_is_playing(global.main_menu_music))
{
	global.main_menu_music = audio_play_sound(snd_main_menu, 1, true);
}