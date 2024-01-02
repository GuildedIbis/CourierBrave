//Player Sounds
//
//
//
//
//
//Create Enemy Sounds
function scr_audio_player_create(){
sound_player_array = array_create(62,-1)

//sound_player_array[0] = snd_player_;
//sound_player_array[1] = snd_player_;
//sound_player_array[2] = snd_player_;
//sound_player_array[3] = snd_player_;
//sound_player_array[4] = snd_player_;
//sound_player_array[5] = snd_player_;
//sound_player_array[6] = snd_player_;
//sound_player_array[7] = snd_player_;
//sound_player_array[8] = snd_player_;
//sound_player_array[9] = snd_player_;

}
//
//
//
//
//
//
function scr_audio_pause_player(){
with (obj_game)
{
	var _size = array_length(sound_player_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_pause_sound(sound_player_array[i]);
	}
}
}
function scr_audio_stop_player(){
with (obj_game)
{
	var _size = array_length(sound_player_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_stop_sound(sound_player_array[i]);
	}
}
}