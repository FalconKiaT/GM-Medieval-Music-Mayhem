
if(score >= old_score +2000){
	old_score = score;
	audio_play_sound(snd_crowd_audio, 2, false)
	AnimationSet("YAY");
	//Run set animations
}
AnimationStep();