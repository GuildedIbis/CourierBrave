/// @description Insert description here
if (room_song != -1)
{
	if (global.aggroCounter = 0) and (song_on = false)
	{
		song_timer = song_timer - 1;
		if (song_timer <= 0)
		{
			song_timer = 900;
			song_on = true;
			audio_sound_gain(room_song,global.volumeMusic,1);
			audio_play_sound(room_song,0,true);
		}
	}
	if (global.aggroCounter != 0)
	{
		song_timer = 900;
		song_on = false;
		audio_stop_sound(room_song)
	}
}