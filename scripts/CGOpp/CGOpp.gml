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
scr_draw_cg_opp_deck();
//scr_draw_cg_opp_discard();



//Enemy AI
if (obj_cardGame.turn = 1)
{
	//Draw Per Turn
	if (draw_pt = false) and (action_timer <= 0)
	{
		draw_pt = true;
		action_timer = 60;
		var _cardNum = deck_array[0,0];
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
		if ((_deckLen) > 1)
		{
				
			scr_cg_cardDraw_deck(player);
			array_delete(deck_array,0,1);
		}
	}

	if (action_timer <= 0)
	{
		scr_cg_opp_playcheck();
	}
	//Opponent Movecheck
	if (move_pt = false) and (action_timer <= 0)
	{
		scr_cg_opp_movecheck();
	}
	
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
//Draw Opponent Deck | obj_opponent_cg | scr_draw_cg_opp
function scr_draw_cg_opp_discard(){
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
function scr_cg_opp_playcheck()
{
	if (obj_opponent_cg.action_timer <= 0)
	{
		with (obj_card)
		{
			if (card_owner = 1) and (card_place = 0)
			{
				script_execute(card_play);
			}
		}
	}
}
//
//
//
//
//
//Opponent Move Check | obj_opponent_cg | scr_draw_cg_opp
function scr_cg_opp_movecheck()
{
	if (obj_opponent_cg.action_timer <= 0)
	{
		with (obj_card)
		{
			if (card_owner = 1) and (card_place = 1)
			{
				script_execute(card_move);
			}
		}
	}
}