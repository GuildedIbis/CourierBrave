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
pdeck_array = array_create(12);
pdeck_array = 
[
	[0,"Name",scr_cg_0000_draw],
	[1,"Name",scr_cg_0001_draw],
	[2,"Name",scr_cg_0002_draw],
	[3,"Name",scr_cg_0003_draw],
	[0,"Name",scr_cg_0000_draw],
	[1,"Name",scr_cg_0001_draw],
	[2,"Name",scr_cg_0002_draw],
	[3,"Name",scr_cg_0003_draw],
	[0,"Name",scr_cg_0000_draw],
	[1,"Name",scr_cg_0001_draw],
	[2,"Name",scr_cg_0002_draw],
	[3,"Name",scr_cg_0003_draw],
];

scr_cg_deck_shuffle();
//Create Hand
//0: Card ID #
//1: Name
//2: Play Script
//3: Type
phand_array = array_create(1);
phand_array = 
[
	[0,"Name",scr_cg_0000_hand_selected,0],
];

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
//
//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,0,0,320,180);
draw_sprite_stretched(spr_gameBoard,0,0,0,320,180);
draw_set_color(c_white);
var _title = "Card Game"
//
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
//
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
	if (hand_slot = i)
	{
		draw_sprite_ext(spr_card_allS,phand_array[i,0],_cardX,145,1.0,1.0,0,c_white,1);
	}
	else
	{
		draw_sprite_ext(spr_card_allS,phand_array[i,0],_cardX,170,1.0,1.0,0,c_white,1);
	}
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,170,_cardX + _space,180))
	{
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,169,27,37);
		}
		if (mouse_check_button_pressed(mb_left))
		{
			hand_slot = i;
			card_selected = phand_array[i,2];	
		}
	}
}
//
//Draw Deck
draw_sprite_ext(spr_card_allS_back,0,252,92,1,1,0,c_white,1);
draw_text_transformed(279,92,string(array_length(pdeck_array)),1,1,0);
if (point_in_rectangle(_mouseX,_mouseY,252,92,277,127))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,251,91,27,37);
	if (mouse_check_button_pressed(mb_left)) and (pdeck_array[0, 0] != -1)
	{
		array_resize(phand_array,array_length(phand_array) + 1);
		script_execute(pdeck_array[0,2]);
		array_delete(pdeck_array,0,1);
	}
}
//
//Selected Card
if (card_selected != -1)
{
	script_execute(card_selected);
}
}
//
//
//
//
//
//Deck Shuffle
function scr_cg_deck_shuffle(){
var _size = array_length(pdeck_array);
var _tempDeck = array_create(_size);

//Save Temporary Copy of Deck
for (var j = 0; j < _size; j = j + 1)
{
	_tempDeck[j, 0] = pdeck_array[j, 0];
	_tempDeck[j, 1] = pdeck_array[j, 1];
	_tempDeck[j, 2] = pdeck_array[j, 2];
}

//Reset Deck Randomly
for (var i = 0; i < _size; i = i + 1)
{
	var _shuffleID = irandom_range(0,_size - (1+i));
	pdeck_array[i, 0] = _tempDeck[_shuffleID, 0];
	pdeck_array[i, 1] = _tempDeck[_shuffleID, 1];
	pdeck_array[i, 2] = _tempDeck[_shuffleID, 2];
	array_delete(_tempDeck,_shuffleID,1);
}
}
