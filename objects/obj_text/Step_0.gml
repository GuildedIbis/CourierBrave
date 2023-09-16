//Step

//Text Box Mechanics
//E to continue/skip
//Next character added every 5 frames
if (obj_game.gamePaused) and (obj_game.textPaused)
{
	if (keyboard_check_pressed(ord("E"))) and (e_page = true)
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		string_counter = string_counter + 1;
		letter_counter = 0;
	}

	if (letter_counter < string_length(text_string))
	{
		sound_timer = sound_timer - 1;
		letter_timer = letter_timer - 1;
		if (letter_timer <= 0)
		{
			letter_timer = 7;
			
		}
		letter_counter = letter_counter + 1;
		if (sound_timer <= 0)
		{
			sound_timer = 5;
			audio_sound_gain(snd_text_type,global.volumeEffects,1);
			audio_play_sound(snd_text_type,0,false);
		}
	}
}