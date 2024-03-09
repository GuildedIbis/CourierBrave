//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//
//Opponent CG Scripts
//
//
//
//
//Main Opponent CG | obj_opponent_cg | Draw GUI
function scr_draw_cg_opp(){
if (action_timer > 0) action_timer = action_timer - 1;
var _deckLen = array_length(deck_array);
//scr_draw_cg_opp_hand();
scr_draw_cg_opp_deck();
//scr_draw_cg_opp_active();
//scr_draw_cg_opp_discard();
//scr_cg_combatant_defeated();


//Enemy AI
if (obj_cardGame.turn = 1)
{
	//Draw Per Turn
	if (draw_pt = false) and (action_timer <= 0)
	{
		draw_pt = true;
		action_timer = 60;
		var _cardNum = deck_array[0,0];
		if ((_deckLen) > 1)
		{
				
			scr_cg_cardDraw_deck(player);
			array_delete(deck_array,0,1);
		}
		if ((_deckLen) = 1)
		{
			scr_cg_cardDraw_deck(player);
			deck_array[0,0] = -1;
			deck_array[0,1] = -1;
			deck_array[0,2] = -1;
			deck_array[0,3] = -1;
			deck_array[0,4] = -1;
			deck_array[0,5] = -1;
		}
	}

	//if (action_timer <= 0)
	//{
	//	scr_opp_cg_playcheck();
	//}
	////Opponent Movecheck
	//if (move_pt = false) and (action_timer <= 0)
	//{
	//	scr_opp_cg_movecheck();
	//}
	
	//End Turn if no other action can be taken
	if (action_timer <= 0)
	{
		draw_pt = false;
		move_pt = false;
		obj_cardGame.turn = 0;
	}
}


}
//
//
//
//
//
//Draw Opponent Deck | obj_opponent_cg | scr_draw_cg_opp
function scr_draw_cg_opp_deck(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _deckLen = array_length(deck_array);
var _deckY = 56
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (deck_array[0, 0] != -1)
{
	draw_sprite_ext(spr_card_back,0,135,_deckY,1,1,0,c_white,1);
	draw_text_transformed(130,_deckY,string(_deckLen),1,1,0);
}


}
//
//
//
//
//
//Draw Opponent Active | obj_opponent_cg | scr_draw_cg_opp
function xscr_draw_cg_opp_active(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 265;
var _cardY = 56;//63
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

for (var i = 0; i < 6; i = i + 1)
{
	if (active_array[i,0] != -1)
	{
		var _hpRem = active_array[i,4] - active_array[i,5];
		draw_sprite_ext(spr_card_all,active_array[i,0],_cardX - (20 * i),_cardY,1,1,0,c_white,1);
		draw_text_transformed((_cardX + 8) - (20 * i), _cardY + 12,string(_hpRem),.75,.75,0);
		if (point_in_rectangle(_mouseX,_mouseY,_cardX - (20 * i),_cardY,(_cardX + 15) - (20 * i),_cardY+21))
		{
			var _cardNum = active_array[i,0];
			obj_player_cg.card_hover = string(active_array[i,1]);
			draw_sprite_stretched(spr_highlight_nineslice,0,(_cardX -1) - (20 * i),_cardY-1,17,23);
			if (mouse_check_button_released(mb_left)) and (obj_player_cg.action_state = false)
			{
				obj_player_cg.card_selected = cg_script_database[_cardNum,3];	
				obj_player_cg.active_slot = i;
				with (obj_card_effect) instance_destroy();
				with (instance_create_layer((_cardX-1) - (20 * i),_cardY-1,"Instances",obj_card_effect))
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
//Draw Opponent Hand | obj_opponent_cg | scr_draw_cg_opp
function xscr_draw_cg_opp_hand(){
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
	
	draw_sprite_ext(spr_card_back,0,_cardX,4,1,1,0,c_white,1);
	draw_text_transformed(_cardX,12,string(hand_array[i,0]),.75,.75,0);
	
	
}
draw_text_transformed(131,8,string(hand_size),.75,.75,0);
}
//
//
//
//
//
//Draw Opponent Deck | obj_opponent_cg | scr_draw_cg_opp
function xscr_draw_cg_opp_discard(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _discardTop = array_length(discard_array) - 1;
var _discardX = 135;
var _discardY = 28;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (discard_array[_discardTop, 0] != -1)
{
	draw_sprite_ext(spr_card_all,discard_array[_discardTop, 2],_discardX,_discardY,1,1,0,c_white,1);
	draw_text_transformed(130,_discardY,string(array_length(discard_array)),1,1,0);
}


}
//
//
//
//
//
//Opponent Play Check | obj_opponent_cg | scr_draw_cg_opp
function xscr_opp_cg_playcheck()
{
	for (var i = 0; i < hand_size; i = i + 1)
	{
		var _cardID = hand_array[i, 0];
		hand_slot = i;
		script_execute(cg_script_database[_cardID,4])
		if (card_played = true)
		{
			card_played = false;
			break;
		}	
	}
}
//
//
//
//
//
//Opponent Move Check | obj_opponent_cg | scr_draw_cg_opp
function xscr_opp_cg_movecheck()
{
	for (var i = 0; i < 6; i = i + 1)
	{
		if (move_pt = false)
		if (active_array[i,0] != -1) and (active_array[i + 1,0] = -1)
		{
			move_pt = true;
			action_timer = 120;
			var _cardID = active_array[i,0];
			//Set to Active
			active_array[i + 1, 0] = active_array[i, 0];
			active_array[i + 1, 1] = active_array[i, 1];
			active_array[i + 1, 2] = active_array[i, 2];
			active_array[i + 1, 3] = active_array[i, 3];
			active_array[i + 1, 4] = active_array[i, 4];
			active_array[i + 1, 5] = active_array[i, 5];
			//Clear old slot
			active_array[i, 0] = -1;
			active_array[i, 1] = -1;
			active_array[i, 2] = -1;
			active_array[i, 3] = -1;
			active_array[i, 4] = -1;
			active_array[i, 5] = -1;


			with (obj_card_effect) instance_destroy();
			var _name = "Opponent moved " + active_array[i + 1, 1] + "."
			obj_player_cg.action_text = _name
			obj_player_cg.active_slot = 0;
			obj_player_cg.card_selected = cg_script_database[_cardID,3];
		}
	}
}