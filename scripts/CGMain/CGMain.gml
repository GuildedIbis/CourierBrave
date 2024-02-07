//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//5: Draw/Select Script
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
		[0,"Name",0,0,4],
		[1,"Name",1,0,4],
		[2,"Name",2,0,4],
		[0,"Name",0,0,4],
		[0,"Name",0,0,4],
		[1,"Name",1,0,4],
		[2,"Name",2,0,4],
		[1,"Name",1,0,4],
		[0,"Name",0,0,4],
		[1,"Name",1,0,4],
		[2,"Name",2,0,4],
		[2,"Name",2,0,4],
	];
	scr_cg_deck_shuffle();
	hand_array = array_create(1);
	hand_array = 
	[
		[0,"Yellow Combatant",0,0,4],
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
	//Copy Database
	scr_cg_database();
	depth = obj_cardGame.depth - 1;
	
	//Create and Shuffle Deck
	deck_array = array_create(12);
	deck_array = 
	[
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[0,"Name",0,0,4,scr_cg_0000_draw],
		[1,"Name",1,0,4,scr_cg_0001_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
		[2,"Name",2,0,4,scr_cg_0002_draw],
	];
	scr_cg_deck_shuffle();
	
	//Create Hand
	hand_array = array_create(1);
	hand_array = 
	[
		[0,"KAFFARI GUARD",0,0,4],
		[1,"LIGHTRAY KNIGHT",0,1,9],
		[2,"CAPTAIN HOLON",0,2,14],
	];
	
	//Create Active Lane
	active_array = array_create(6);
	active_array = 
	[
		[-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1],
		[0,"KAFFARI GUARD",0,0,4],
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
if (card_selected != -1) //Primary Card View (Left Click)
{
	script_execute(card_selected);
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
		var _cardNum = hand_array[i,0];
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,160,17,23);
		}
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = i;
			card_selected = cg_script_database[_cardNum,1];	
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
			var _cardNum = deck_array[0,0];
			if ((_deckLen) > 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(cg_script_database[_cardNum,0]);
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(cg_script_database[_cardNum,0]);
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
			var _cardNum = active_array[i,0];
			card_hover = string(active_array[i,1]);
			draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * i),97,17,23);
			if (mouse_check_button_released(mb_left))
			{
				hand_slot = -1;
				active_slot = i;
				card_selected = cg_script_database[_cardNum,2];	
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
		
			var _cardNum = deck_array[0,0];
			if ((_deckLen) > 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(cg_script_database[_cardNum,0]);
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				array_resize(hand_array,array_length(hand_array) + 1);
				script_execute(cg_script_database[_cardNum,0]);
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
				obj_player_cg.card_selected = active_array[i,4];	
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