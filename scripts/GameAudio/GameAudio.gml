//Audio Scripts
//
//
//
//
//
//Audio Transition Between Levels
function scr_audio_transition(){
with (obj_song)
{
	//song_timer = 600;
	script_execute(song_list_array[obj_game.level_num + 1]);
}
}
//
//
//
//
//
//Create Songs
function scr_audio_songs_create(){
song_array = array_create(6,-1);
song_list_array = array_create(26,0);

song_array[0] = snd_theme_main;
song_array[1] = snd_song_farway_theme;
song_array[2] = snd_song_yakflower_theme;
song_array[3] = snd_song_habraf_theme;
song_array[4] = snd_song_beaowire_theme;
song_array[5] = snd_song_beetraCity_theme;

song_list_array[0] = scr_game_song_list_main;
song_list_array[1] = scr_game_song_list_lenko;
song_list_array[2] = scr_game_song_list_lenko;
song_list_array[3] = scr_game_song_list_lenko;
song_list_array[4] = scr_game_song_list_lenko;
song_list_array[5] = scr_game_song_list_lenko;
song_list_array[6] = scr_game_song_list_beetrap;
song_list_array[7] = scr_game_song_list_beetrap;
song_list_array[8] = scr_game_song_list_beetrap;
song_list_array[9] = scr_game_song_list_beetrap;
song_list_array[10] = scr_game_song_list_beetrap;

}
//
//
//
//
//
//
function scr_audio_stop_song(){
with (obj_song)
{
	var _size = array_length(song_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_stop_sound(song_array[i]);
	}
}
}
//
//
//
//
//
//Song List: Main
function scr_game_song_list_main(){
room_song = snd_theme_main;

}
//
//
//
//
//
//Song List: Lenko
function scr_game_song_list_lenko(){
var _song = irandom_range(0,3)
{
	switch (_song)
	{
		case 0:
			room_song = snd_song_farway_theme;
		break;
		
		case 1:
			room_song = snd_song_yakflower_theme;
		break;
		
		case 2:
			room_song = snd_song_habraf_theme;
		break;
		
		case 3:
			room_song = snd_song_beaowire_theme;
		break;
	}
}
}
//
//
//
//
//
//Song List: Beetrap
function scr_game_song_list_beetrap(){
var _song = irandom_range(0,3)
{
	switch (_song)
	{
		case 0:
			room_song = snd_song_beetraCity_theme;
		break;
		
		case 1:
			room_song = snd_song_beetraCity_theme;
		break;
		
		case 2:
			room_song = snd_song_beetraCity_theme;
		break;
		
		case 3:
			room_song = snd_song_beetraCity_theme;
		break;
	}
}
}
