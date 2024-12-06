// Feather disable GM2017
audio_play_sound(snd_button_clicked, 1, false, 1, 0, 2);
global.max_level = 1; //unlock level 1
audio_play_sound(snd_button_clicked, 1, false, get_volume_scaled(), 0, 2);
room_goto(rm_levelSelect); //switch room