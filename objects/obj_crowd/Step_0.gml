
if(score >= old_score +2000){
	old_score = score;
	audio_play_sound(snd_crowd_audio, 2, false, get_volume_scaled())
	AnimationSet("YAY");
	//Run set animations
	AnimationStep();
}
