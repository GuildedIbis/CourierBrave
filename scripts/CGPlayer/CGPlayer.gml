//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//
//Player Card Game 
//
//
//
//
//
//Player Card Game (Main) | obj_player_cg | Draw GUI
function scr_draw_cg_player(){
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
scr_draw_cg_player_discard();
scr_draw_cg_player_game();


}
//
//
//
//
//
//Draw Player Hand | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_hand(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardY = 161
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

card_hover = -1;
var _handSize = array_length(hand_array);
for (var i = 0; i < _handSize; i = i + 1)
{
	//Set Position
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
	
	//Draw Card
	var _hpText = string(hand_array[i,4]);
	draw_sprite_ext(spr_card_all,hand_array[i,2],_cardX,_cardY,1,1,0,c_white,1);
	if (hand_array[i,4] != -1)
	{
		draw_text_transformed(_cardX + 8,_cardY+12,_hpText,.75,.75,0);
	}
	
	//Select Card
	if (point_in_rectangle(_mouseX,_mouseY,_cardX,_cardY,_cardX + _space,_cardY + 21)) and (action_state = false)
	{
		card_hover = string(hand_array[i,1]);
		var _cardNum = hand_array[i,0];
		if (hand_slot != i)
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX-1,_cardY-1,17,23);
		}
		if (mouse_check_button_released(mb_left))
		{
			hand_slot = i;
			card_selected = cg_script_database[_cardNum,1];	
			with (obj_card_effect) instance_destroy();
			with (instance_create_layer(_cardX-1,_cardY-1,"Instances",obj_card_effect))
			{
				depth = obj_cardGame.depth - 2;
				slot = i;
				effect_draw = scr_cg_effect_selected;
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
//Draw Player Deck | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_deck(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _deckLen = array_length(deck_array);
var _deckY = 105;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (deck_array[0, 0] != -1)
{
	draw_sprite_ext(spr_card_back,0,295,_deckY,1,1,0,c_white,1);
	draw_text_transformed(310,_deckY,string(_deckLen),1,1,0);
	if (obj_cardGame.turn = 0)
	{
		if (draw_pt = false)
		{
			draw_pt = true;
			var _cardNum = deck_array[0,0];
			if ((_deckLen) > 1)
			{
				
				scr_cg_cardDraw_deck();
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				scr_cg_cardDraw_deck();
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


}
//
//
//
//
//
//Draw Player Active | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_active(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 165;
var _cardY = 105;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i = 0; i < 6; i = i + 1)
{
	if (active_array[i,0] != -1)
	{
		var _hpRem = active_array[i,4] - active_array[i,5];
		draw_sprite_ext(spr_card_all,active_array[i,2],165 + (20 * i),_cardY,1,1,0,c_white,1);//80,92
		draw_text_transformed(173 + (20 * i), _cardY + 12,string(_hpRem),.75,.75,0);
		if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * i),_cardY,180 + (20 * i),_cardY+21)) and (action_state = false)
		{
			var _cardNum = active_array[i,0];
			card_hover = string(active_array[i,1]);
			draw_sprite_stretched(spr_highlight_nineslice,0,(_cardX-1) + (20 * i),_cardY-1,17,23);
			if (mouse_check_button_released(mb_left))
			{
				hand_slot = -1;
				active_slot = i;
				card_selected = cg_script_database[_cardNum,2];	
				
				with (obj_card_effect) instance_destroy();
				with (instance_create_layer((_cardX-1) + (20 * i),_cardY-1,"Instances",obj_card_effect))
				{
					depth = obj_cardGame.depth - 2;
					slot = i;
					effect_draw = scr_cg_effect_selected;
				}
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
//Draw Opponent Deck | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_discard(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _discardTop = array_length(discard_array) - 1;
var _discardX = 295;
var _discardY = 133;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (discard_array[_discardTop, 0] != -1)
{
	draw_sprite_ext(spr_card_all,discard_array[_discardTop, 2],_discardX,_discardY,1,1,0,c_white,1);
	draw_text_transformed(290,_discardY,string(array_length(discard_array)),1,1,0);
}


}
//
//
//
//
//
//Draw Player Active | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_game(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 165;
var _cardY = 105;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

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

if (action_text != -1)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(128,80,action_text,.5,.5,0);//126,85
}
if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,131,139,159,153)) and (action_state = false)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_sprite_stretched(spr_highlight_nineslice,0,130,138,31,17);
		draw_text_transformed(145,142,"END\nTURN",.5,.5,0);
		if (mouse_check_button_released(mb_left))
		{
			draw_pt = false;
			move_pt = false;
			pylon_pt = false;
			obj_cardGame.turn = 1;
		}
	}
}
}
