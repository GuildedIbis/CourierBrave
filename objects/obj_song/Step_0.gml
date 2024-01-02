//Song Object Step
if (room_song != -1)
{
	if (global.aggroCounter = 0)// and (song_on = false)
	{
		song_timer = song_timer - 1;
		if (song_timer <= 0)
		{
			song_on = true;
			//song_timer = 540;
			var _length = audio_sound_length(room_song);
			song_timer = (_length * 60) + 300;
			audio_sound_gain(room_song,global.volumeMusic,1);
			audio_play_sound(room_song,0,false);
		}
	}
	if (global.aggroCounter != 0) //and (song_on = true)
	{
		song_timer = 600;
		scr_audio_stop_song();
		//song_on = false;
		//audio_stop_sound(room_song);
	}
}