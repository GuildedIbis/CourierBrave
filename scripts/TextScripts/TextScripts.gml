// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_text_end(){
text_gui = 0;
text_string = ""
string_counter = 0;
audio_sound_gain(snd_menu,global.volumeMenu,1);
audio_play_sound(snd_menu,0,false);
obj_game.gamePaused = false;
obj_game.textPaused = false;
with (all)
{
	image_speed = game_paused_image_speed;
}

//Reset Buy/Sell Menu
page = 0;
slot = -1;
item_id = -1;
item_name = -1;
sell_price = 0;
buy_price = 0;
}