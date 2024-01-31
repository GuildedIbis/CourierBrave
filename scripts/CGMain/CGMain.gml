//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){

//Change To Structs instead of arrays?

//Create Deck

//0: Card ID #
//1: Name
//2: Draw Script
with (instance_create_layer(0,0,"Instances",obj_cardGame))
{

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
//draw_sprite_stretched(spr_menu_circle16,1,8,8,16,16);
//if (point_in_rectangle(_mouseX,_mouseY,8,8,24,24))
//{
//	draw_sprite_stretched(spr_highlight_circle,0,7,7,18,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		scr_text_end();
//		_SubString = string_copy(text_string,1,letter_counter);
//		e_page = true;
//	}
//}
//
//Draw Hand
scr_draw_cg_player_hand();

//Draw Deck
scr_draw_cg_player_deck();

//Draw Active
scr_draw_cg_player_active();

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
		var _leftAlign = 224 - (_handSize * 8);
		var _space = 16;
		var _cardX = _leftAlign + (16 * i);
	}
	else
	{
		var _leftAlign = 224 - (11 * 8);
		//var _space = max(1,26 - ((_handSize - 11)));
		var _space = max(1,170/_handSize); //It's 185 from one edge to the other, -15 for the width of the card
		var _cardX = _leftAlign + (_space * i);
	}
	if (hand_slot = i)
	{
		draw_sprite_ext(spr_card_all,phand_array[i,0],_cardX,154,1,1,0,c_white,1);
	}
	else
	{
		draw_sprite_ext(spr_card_all,phand_array[i,0],_cardX,161,1,1,0,c_white,1);
	}
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,161,_cardX + _space,176))
	{
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,160,17,23);
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

draw_sprite_ext(spr_card_all_back,0,295,98,1,1,0,c_white,1);
draw_text_transformed(310,98,string(array_length(pdeck_array)),1,1,0);
if (point_in_rectangle(_mouseX,_mouseY,295,98,310,119))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,294,97,17,23);
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


for (var i = 0; i < 6; i = i + 1)
{
	if (pactive_array[i,0] != -1)
	{
		draw_sprite_ext(spr_card_all,pactive_array[i,0],165 + (20 * i),98,1,1,0,c_white,1);//80,92
		if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * i),98,180 + (20 * i),119)) and (card_selected = -1)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * i),97,17,23);
			if (mouse_check_button_released(mb_left))
			{
				hand_slot = -1;
				active_slot = i;
				card_selected = pactive_array[i,2];	
			}
		}
	}
}

//if (pactive_array[0,0] != -1)
//{
//	draw_sprite_ext(spr_card_all_xl,pactive_array[0,0],80,92,.05,.05,0,c_white,1);//80,92
//	if (point_in_rectangle(_mouseX,_mouseY,80,92,105,127)) and (card_selected = -1)
//	{
//		draw_sprite_stretched(spr_highlight_nineslice,0,79,91,27,37);
//		if (mouse_check_button_released(mb_left))
//		{
//			hand_slot = -1;
//			active_slot = 0;
//			card_selected = pactive_array[0,2];	
//		}
//	}
//}
	
//if (pactive_array[1,0] != -1)
//{
//	draw_sprite_ext(spr_card_all_xl,pactive_array[1,0],107,92,.05,.05,0,c_white,1);//80,92
//	if (point_in_rectangle(_mouseX,_mouseY,107,92,132,127)) and (card_selected = -1)
//	{
//		draw_sprite_stretched(spr_highlight_nineslice,0,106,91,27,37);
//		if (mouse_check_button_released(mb_left))
//		{
//			hand_slot = -1;
//			active_slot = 1;
//			card_selected = pactive_array[1,2];	
//		}
//	}
//}
}