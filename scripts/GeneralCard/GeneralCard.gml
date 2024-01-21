//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){

//Create Deck
//0: Card ID #
//1: Name
//2: Draw Script
pdeck_array = array_create(5);
pdeck_array = 
[
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1],
	[0,"Name",-1]
]

//Create Hand
//0: Card ID #
//1: Name
//2: Play Script
//3: Type
phand_array = array_create(6);
phand_array = 
[
	[0,"Name",-1,0],
	[0,"Name",-1,0],
	[0,"Name",-1,0],
	[0,"Name",-1,0],
	[0,"Name",-1,0],
	[0,"Name",-1,0]
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

//Draw Hand
var _handSize = array_length(phand_array);
for (var i = 0; i < _handSize; i = i + 1)
{
	if (_handSize < 11)
	{
		var _leftAlign = 160 - (_handSize * 13);
		var _space = 26;
		var _cardX = _leftAlign + (26 * i);
	}
	else
	{
		var _leftAlign = 160 - (11 * 13);
		//var _space = max(1,26 - ((_handSize - 11)));
		var _space = max(1,277/_handSize);
		var _cardX = _leftAlign + (_space * i);
	}
	if (i < _handSize)
	{
		draw_sprite_ext(spr_card_allS,phand_array[i,0],_cardX,170,1.0,1.0,0,c_white,1);
	}
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,170,_cardX + _space,180))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,169,27,37);
		if (mouse_check_button_pressed(mb_left))
		{
			//phand_array[i, 0] = -1;
			//for (var j = 0; j < _handSize - i; j = j + 1)
			//{
			//	phand_array[i + j, 0] = phand_array[i + j + 1, 0];
			//	phand_array[i + j, 1] = phand_array[i + j + 1, 1];
			//	phand_array[i + j, 2] = phand_array[i + j + 1, 2];
			//	phand_array[i + j, 3] = phand_array[i + j + 1, 3];
			//}
			array_delete(phand_array,i,1);
			
		}
	}
}



//Draw Deck
draw_sprite_ext(spr_card_allS_back,0,252,92,1,1,0,c_white,1);
draw_text_transformed(279,92,string(array_length(pdeck_array)),1,1,0);
if (point_in_rectangle(_mouseX,_mouseY,252,92,277,127))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,251,91,27,37);
	if (mouse_check_button_pressed(mb_left))
	{
		array_resize(phand_array,array_length(phand_array) + 1);
		var _newCard = array_length(phand_array) - 1;
		phand_array[_newCard, 0] = 1;
		phand_array[_newCard, 1] = "Name";
		phand_array[_newCard, 2] = -1;
		phand_array[_newCard, 3] = 1;
		
	}
}
}