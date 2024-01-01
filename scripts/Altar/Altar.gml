//Altar
//Where the player levels their character stats
//
//
//
//
//
//Altar Create
function scr_altar_create(){
entity_step = scr_altar;
reset = false;
shadow = true;
shadow_size = 2;
sound = snd_text01;
altar = true;
interact = 32;
}
//
//
//
//
//
//Altar Step
function scr_altar(){
sprite_index = spr_altar;
scr_npc_interact(12);
}
//
//
//
//
//
//Altar Text
function scr_text_altar_main(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);

var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Health and charges restored.\nEnemies restored.\nYou will return here on death." 
	_SubString = string_copy(text_string,1,letter_counter);
	altar = true;
}

if (string_counter >= 1)
{

	scr_game_room_enemy_reset();
	scr_player_reset();
	text_gui = 0;
	text_string = ""
	_SubString = string_copy(text_string,1,letter_counter);
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;

	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(69,141,_SubString,.6,.6,0);
draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);


}
