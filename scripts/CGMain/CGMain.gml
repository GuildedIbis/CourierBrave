//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//5: Active/Hand Script - scr_cg_player...
//
//Card Scripts
//
//
//
//
//
//Cards Create
function scr_card_game_create(){
	

with (instance_create_layer(0,0,"Instances",obj_cardGame))
{
	depth = obj_cursor.depth + 3;
}
	
with (instance_create_layer(0,0,"Instances",obj_player_cg))
{
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	player = 0;
	deck_array = array_create(12);
	deck_array = 
	[
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
	];
	scr_cg_deck_shuffle();
	hand_array = array_create(1);
	hand_array = 
	[
		[0,"Yellow Combatant",0,0,4,scr_cg_player_0000_hand_selected],
	];
	active_array = array_create(6);
	active_array = 
	[
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1]
	];
}

with (instance_create_layer(0,0,"Instances",obj_opponent_cg))
{
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	//Create Deck
	//0: Card ID #
	//1: Name
	//2: Draw Script
	//Create Opponent Deck and Shuffle 
	deck_array = array_create(12);
	deck_array = 
	[
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[3,"Name",3,0,4,scr_cg_0003_draw],
	];
	scr_cg_deck_shuffle();
	//Create Hand
	//0: Card ID #
	//1: Name
	//2: Play Script
	//3: Type
	hand_array = array_create(1);
	hand_array = 
	[
		[0,"KAFFARI GUARD",0,0,4,scr_cg_opp_0000_hand],
		[1,"LIGHTRAY KNIGHT",0,1,9,scr_cg_opp_0001_hand],
		[2,"CAPTAIN HOLON",0,2,14,scr_cg_opp_0002_hand],
	];
	//Create Active Lane
	active_array = array_create(6);
	active_array = 
	[
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[0,"KAFFARI GUARD",0,0,4,scr_cg_opp_0000_active_selected],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1]
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
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);


//
//Draw Player
scr_draw_cg_player_hand();
scr_draw_cg_player_deck();
scr_draw_cg_player_active();
if (p_card_selected != -1) //Primary Card View (Left Click)
{
	script_execute(p_card_selected);
}
//
//Draw Opponent
if (s_card_selected != -1) //Secondary Card View (Right Click)
{
	script_execute(s_card_selected);
}

if (card_hover != -1)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_transformed(_mouseX,_mouseY-14,card_hover,.5,.5,0);
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
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

card_hover = -1;
var _handSize = array_length(hand_array);
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
		draw_sprite_ext(spr_card_all,hand_array[i,2],_cardX,154,1,1,0,c_white,1);
		draw_text_transformed(_cardX + 8, 166,string(hand_array[i,4]),.75,.75,0);
	}
	else
	{
		draw_sprite_ext(spr_card_all,hand_array[i,2],_cardX,161,1,1,0,c_white,1);
		draw_text_transformed(_cardX + 8, 173,string(hand_array[i,4]),.75,.75,0);
	}
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,161,_cardX + _space,176)) and (action_state = false)
	{
		card_hover = string(hand_array[i,1]);
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,160,17,23);
		}
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = i;
			p_card_selected = cg_select_database[hand_array[i,0],0];	
		}
		if (mouse_check_button_released(mb_right))
		{
			hand_slot = i;
			s_card_selected = cg_select_database[hand_array[i,0],1];	
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
var _deckLen = array_length(deck_array);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (deck_array[0, 0] != -1)
{
	draw_sprite_ext(spr_card_all_back,0,295,98,1,1,0,c_white,1);
	draw_text_transformed(310,98,string(_deckLen),1,1,0);
	if (obj_cardGame.turn = 0)
	{
		if (draw_pt = false)
		{
			draw_pt = true;
		
			if ((_deckLen) > 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(deck_array[0,5]);
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(deck_array[0,5]);
				deck_array[0,0] = -1;
				deck_array[0,1] = -1;
				deck_array[0,2] = -1;
				deck_array[0,3] = -1;
				deck_array[0,4] = -1;
				deck_array[0,5] = -1;
			}
		}
	}
}

if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,131,132,159,146)) and (action_state = false)
	{

		draw_sprite_stretched(spr_highlight_nineslice,0,130,131,30,16);
		if (mouse_check_button_released(mb_left))
		{
			draw_pt = false;
			move_pt = false;
			obj_cardGame.turn = 1;
		}
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
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i = 0; i < 6; i = i + 1)
{
	if (active_array[i,0] != -1)
	{
		draw_sprite_ext(spr_card_all,active_array[i,2],165 + (20 * i),98,1,1,0,c_white,1);//80,92
		draw_text_transformed(173 + (20 * i), 110,string(active_array[i,4]),.75,.75,0);
		if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * i),98,180 + (20 * i),119)) and (action_state = false)
		{
			card_hover = string(active_array[i,1]);
			draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * i),97,17,23);
			if (mouse_check_button_released(mb_left))
			{
				hand_slot = -1;
				active_slot = i;
				p_card_selected = active_array[i,5];	
			}
		}
	}
}


}
//
//
//
//
//
//Draw Opponent Deck
function scr_draw_cg_opp_deck(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _deckLen = array_length(deck_array);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (deck_array[0, 0] != -1)
{
	draw_sprite_ext(spr_card_all_back,0,135,63,1,1,0,c_white,1);
	draw_text_transformed(130,63,string(_deckLen),1,1,0);
	if (obj_cardGame.turn = 1)
	{
		if (draw_pt = false)
		{
			draw_pt = true;
		
			if ((_deckLen) > 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(deck_array[0,5]);
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(deck_array[0,5]);
				deck_array[0,0] = -1;
				deck_array[0,1] = -1;
				deck_array[0,2] = -1;
				deck_array[0,3] = -1;
				deck_array[0,4] = -1;
				deck_array[0,5] = -1;
			}
		}
	}
}

if (obj_cardGame.turn = 1)
{
	draw_pt = false;
	move_pt = false;
	obj_cardGame.turn = 0;
}
}
//
//
//
//
//
//Draw Opponent Active
function scr_draw_cg_opp_active(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i = 0; i < 6; i = i + 1)
{
	if (active_array[i,0] != -1)
	{
		draw_sprite_ext(spr_card_all,active_array[i,0],265 - (20 * i),63,1,1,0,c_white,1);
		draw_text_transformed(273 - (20 * i), 76,string(active_array[i,4]),.75,.75,0);
		if (point_in_rectangle(_mouseX,_mouseY,265 - (20 * i),63,280 - (20 * i),84))
		{
			obj_player_cg.card_hover = string(active_array[i,1]);
			draw_sprite_stretched(spr_highlight_nineslice,0,264 - (20 * i),62,17,23);
			if (mouse_check_button_released(mb_left))
			{
				obj_player_cg.p_card_selected = active_array[i,5];	
			}
		}
	}
}

}
//
//
//
//
//
//Draw Opponent Hand
function scr_draw_cg_opp_hand(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _handSize = array_length(hand_array);
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
	
	draw_sprite_ext(spr_card_all_back,0,_cardX,4,1,1,0,c_white,1);
	
}
}