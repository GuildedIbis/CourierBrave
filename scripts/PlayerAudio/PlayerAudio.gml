//Player Sounds
//
//
//
//
//
//Create Enemy Sounds
function scr_audio_player_create(){
sound_player_array = array_create(26,-1)

sound_player_array[0] = snd_regaliare_goldArcs;
sound_player_array[1] = snd_regaliare_goldBullet;
sound_player_array[2] = snd_regaliare_hit;
sound_player_array[3] = snd_regaliare_regalBlade;
sound_player_array[4] = snd_halofire_firespit;
sound_player_array[5] = snd_halofire_flamecore;
sound_player_array[6] = snd_halofire_flamecore_shield;
sound_player_array[7] = snd_halofire_flamecore_spark;
sound_player_array[8] = snd_halofire_hamaxe_slash;
sound_player_array[9] = snd_halofire_hit;
sound_player_array[10] = snd_halofire_meteor;
sound_player_array[11] = snd_adavio_hit;
sound_player_array[12] = snd_adavio_hookThrust;
sound_player_array[13] = snd_adavio_riftCrush;
sound_player_array[14] = snd_adavio_voidBits;
sound_player_array[15] = snd_adavio_voidCycle;
sound_player_array[16] = snd_ceriver_boomerang;
sound_player_array[17] = snd_ceriver_drainDart;
sound_player_array[18] = snd_ceriver_dynorb;
sound_player_array[19] = snd_ceriver_hit;
sound_player_array[20] = snd_ceriver_orbDash;
sound_player_array[21] = snd_ceriver_steelorb;
sound_player_array[22] = snd_evarel_bristlerod;
sound_player_array[23] = snd_evarel_hit;
sound_player_array[24] = snd_evarel_reflexthorn;
sound_player_array[25] = snd_evarel_thornrise;
//sound_player_array[26] = snd_;
//sound_player_array[27] = snd_;
//sound_player_array[28] = snd_;
//sound_player_array[29] = snd_;
//sound_player_array[0] = snd_;
//sound_player_array[1] = snd_;
//sound_player_array[2] = snd_;
//sound_player_array[3] = snd_;
//sound_player_array[4] = snd_;
//sound_player_array[5] = snd_;
//sound_player_array[6] = snd_;
//sound_player_array[7] = snd_;
//sound_player_array[8] = snd_;
//sound_player_array[9] = snd_;
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
//
//
//
//
//
//
function scr_audio_resume_player(){
with (obj_game)
{
	var _size = array_length(sound_player_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_resume_sound(sound_player_array[i]);
	}
}
}
//
//
//
//
//
//Stop Player Audio
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