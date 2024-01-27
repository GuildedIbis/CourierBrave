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
	[0,"Yellow Combatant",scr_cg_0000_hand_selected,0],
];


//Create Active Lane
pactive_array = array_create(6);
pactive_array = 
[
	[-1,-1,-1,-1],
	[-1,-1,-1,-1],
	[-1,-1,-1,-1],
	[-1,-1,-1,-1],
	[-1,-1,-1,-1],
	[-1,-1,-1,-1]
];
}
//
//
//
//
//
//Card Main Engine
function scr_card_game_step(){
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
scr_draw_cg_player_hand();
//
//Draw Deck
scr_draw_cg_player_deck();
//
//Draw Active
scr_draw_cg_player_active();
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
//Draw Player Hand
function scr_draw_cg_player_hand(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


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
		draw_sprite_ext(spr_card_all_xl,phand_array[i,0],_cardX,145,.05,.05,0,c_white,1);
	}
	else
	{
		draw_sprite_ext(spr_card_all_xl,phand_array[i,0],_cardX,170,.05,.05,0,c_white,1);
	}
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,170,_cardX + _space,180))
	{
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,169,27,37);
		}
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = i;
			card_selected = phand_array[i,2];	
		}
	}
}
}
//
//
//
//
//
//Draw Player Deck
function scr_draw_cg_player_deck(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

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
}
//
//
//
//
//
//Draw Player Active
function scr_draw_cg_player_active(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (pactive_array[0,0] != -1)
{
	draw_sprite_ext(spr_card_all_xl,pactive_array[0,0],80,92,.05,.05,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,80,92,105,127)) and (card_selected = -1)
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,79,91,27,37);
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = -1;
			active_slot = 0;
			card_selected = pactive_array[0,2];	
		}
	}
}

if (pactive_array[1,0] != -1)
{
	draw_sprite_ext(spr_card_all_xl,pactive_array[1,0],107,92,.05,.05,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,107,92,132,127)) and (card_selected = -1)
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,106,91,27,37);
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = -1;
			active_slot = 1;
			card_selected = pactive_array[1,2];	
		}
	}
}
}