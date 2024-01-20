//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){
pdeck_array = array_create(5);
//0: Card ID #
//1: Name
//2: Draw Script
pdeck_array = 
[
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1]
]
}
//
//
//
//
//
//Card Main Engine
function scr_cards_main(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,0,0,320,180);
draw_sprite_stretched(spr_gameBoard,0,0,0,320,180);
draw_set_color(c_white);
var _title = "Card Game"


//Exit
draw_sprite_stretched(spr_menu_circle16,1,8,8,16,16);
if (point_in_rectangle(_mouseX,_mouseY,8,8,24,24))
{
	draw_sprite_stretched(spr_highlight_circle,0,7,7,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		scr_text_end();
		_SubString = string_copy(text_string,1,letter_counter);
		e_page = true;
	}
}

//Test Draw
draw_text_transformed(160,8,string(pdeck_array[0,1]),1.0,1.0,0)


//Draw Deck
draw_sprite_ext(spr_card_allS_back,0,252,92,1,1,0,c_white,1);
draw_text_transformed(279,92,string(array_length(pdeck_array)),1,1,0);
}