//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//
//Card 0001 - Player
//
//
//
//
//
//Draw From Deck
function scr_cg_0001_draw(){
var _newCard = array_length(hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
if (player = 0)
{
	hand_array[_newCard, 0] = 1;
	hand_array[_newCard, 1] = "LIGHTRAY KNIGHT";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 1;
	hand_array[_newCard, 4] = 9;
	//hand_array[_newCard, 5] = scr_cg_player_0001_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 1;
	hand_array[_newCard, 1] = "LIGHTRAY KNIGHT";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 1;
	hand_array[_newCard, 4] = 9;
	//hand_array[_newCard, 5] = scr_cg_player_0001_hand_selected;

}
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_player_0001_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _actX = 165;
var _actY = 105;
var _cName = "LIGHTRAY KNIGHT";
var _atkName1 = "SWORD ATTACK";


//Draw Full Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,0,_cardX,_cardY,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,1,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);
draw_set_halign(fa_left);
draw_text_transformed(_cardX + 10,_cardY + 100,_atkName1,1,1,0);
//
//
//
//
//Set 
if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 10,_cardY + 81,_cardX + 102,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 9,_cardY + 80,95,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
		}
	}
	if (action_state = true)
	{
		for (var i = 0; i < 6; i = i + 1)
		{
			if (active_array[i,0] = 0)
			{
				draw_sprite_ext(spr_card_slot_effect,1,_actX + (20 * i),_actY,1,1,0,c_white,1);//80,92
				//draw_text_transformed(173 + (20 * i), 113,string(active_array[i,4]),.75,.75,0);
				if (point_in_rectangle(_mouseX,_mouseY,_actX + (20 * i),_actY,(_actX + 15) + (20 * i),_actY + 21))// and (p_card_selected = -1)
				{
					//card_hover = string(active_array[i,1]);
					draw_sprite_stretched(spr_highlight_nineslice,0,(_actX - 1) + (20 * i),_actY - 1,17,23);
					if (mouse_check_button_released(mb_left))
					{
						active_array[i,0] = 1;
						active_array[i,1] = "LIGHTRAY KNIGHT";
						active_array[i,2] = 0;
						active_array[i,3] = 1;
						active_array[i,4] = 9;
						//active_array[i,5] = scr_cg_player_0001_active_selected;
				
						//Discard? Leave under?
						with (obj_card_effect) instance_destroy();
						array_delete(hand_array,hand_slot,1);
						card_selected = -1;
						hand_slot = -1;
						action_state = false;
					}
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
//While Selected in Hand
function scr_cg_player_0001_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _cName = "LIGHTRAY KNIGHT";
var _atkName1 = "SWORD ATTACK";


//Draw Full Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,0,_cardX,_cardY,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,1,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);
draw_set_halign(fa_left);
draw_text_transformed(_cardX + 10,_cardY + 100,_atkName1,1,1,0);

if (obj_cardGame.turn = 0)
{
	//Select Move
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 105,_cardY + 81,_cardX + 114,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 104,_cardY + 80,12,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
			action_choose = 0;
		}
	}
	//Select Attack
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 10,_cardY + 100,_cardX + 114,_cardY + 109))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 9,_cardY + 99,106,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
			action_choose = 1;
		}
	}
	//Action State
	if (action_state = true)
	{
		switch (action_choose)
		{
			case 0:
				scr_cg_player_active_move();
			break;
		
			case 1:
				scr_cg_player_0001_atk_0();
			break;
		}
	}
}

}

//
//
//
//
//
//Card 0001 - Player Attack 0
function scr_cg_player_0001_atk_0(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _targetNum = 5 - active_slot;
var _targetPos = obj_opponent_cg.active_array[_targetNum,0]
var _targetX = 265 - (20 * _targetNum)

if (_targetPos != -1)
{
	draw_sprite_ext(spr_card_slot_effect,2,_targetX,56,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_targetX,56,_targetX + 15,76))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_targetX - 1,55,17,23);
		if (mouse_check_button_pressed(mb_left)) 
		{
			action_state = false;
			obj_opponent_cg.active_array[_targetNum,4] -= 2;
			with (obj_card_effect) instance_destroy();
		}
	}
}
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_opp_0001_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;

//Draw Full Card
draw_sprite_ext(spr_gameBoard_selected,1,_cardX,_cardY,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,1,_cardX,_cardY,1,1,0,c_white,1);

//Move (Standard)


}
