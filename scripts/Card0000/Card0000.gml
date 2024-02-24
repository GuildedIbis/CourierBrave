//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//
//Card 0000 - Player
//
//
//
//
//
//Draw Full Card
function scr_cg_0000_draw(_player,_hpText,_cardX=0,_cardY=5){
var _cName = "KAFFARI GUARD";
var _atkName1 = "SWORD STRIKE";
var _stage = "ORDINARY KAFFARI WARRIOR";


//Draw Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,_player,0,0,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,0,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);
draw_text_transformed(_cardX + 60,_cardY + 84,_stage,.5,.5,0);
draw_text_transformed(_cardX + 115,_cardY + 16,_hpText,1,1,0);
draw_set_halign(fa_right);
draw_text_transformed(_cardX + 114,_cardY + 102,_atkName1,.75,.75,0);

}
//
//
//
//
//
//Draw From Deck
function scr_cg_0000_draw_fd(){
var _newCard = array_length(hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
if (player = 0)
{
	hand_array[_newCard, 0] = 0;
	hand_array[_newCard, 1] = "KAFFARI GAURD";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 0;
	hand_array[_newCard, 4] = 4;
	//hand_array[_newCard, 5] = scr_cg_player_0000_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 0;
	hand_array[_newCard, 1] = "KAFFARI GAURD";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 0;
	hand_array[_newCard, 4] = 4;
	//hand_array[_newCard, 5] = scr_cg_player_0000_hand_selected;

}
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_player_0000_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cName = "KAFFARI GUARD";
var _hpText = string(hand_array[hand_slot,4]);
var _cardX = 0;
var _cardY = 5;
var _actX = 165;
var _actY = 105;


//Draw Card
scr_cg_0000_draw(0,_hpText,_cardX,_cardY);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


//Actions and Buttons
if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 10,_cardY + 81,_cardX + 102,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 9,_cardY + 80,95,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
			action_text = "Select the ENTRY SLOT to put KAFFARI GUARD into play.\n\n\nESC to exit action."
		}
	}
	
	if (active_array[0,0] = -1) and (action_state = true)
	{
		draw_sprite_ext(spr_card_slot_effect,0,_actX,_actY,1,1,0,c_white,1);//80,92
		if (point_in_rectangle(_mouseX,_mouseY,_actX,_actY,_actX + 15,_actY + 21))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_actX - 1,_actY - 1,17,23);
			if (mouse_check_button_released(mb_left)) 
			{
				//Set to Active
				active_array[0,0] = 0;
				active_array[0,1] = "KAFFARI GAURD";
				active_array[0,2] = 0;
				active_array[0,3] = 0;
				active_array[0,4] = 4;
				active_array[0,5] = 0;

		
				//Remove From Hand
				with (obj_card_effect) instance_destroy();
				array_delete(hand_array,hand_slot,1);
				action_text = "Select a card."
				hand_slot = -1;
				card_selected = -1;
				action_state = false;
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
function scr_cg_player_0000_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _hpText = string(active_array[active_slot,4] - active_array[active_slot,5]);



//Draw Full Card
scr_cg_0000_draw(0,_hpText,_cardX,_cardY);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


if (obj_cardGame.turn = 0)
{
	//Select Move
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 105,_cardY + 81,_cardX + 114,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 104,_cardY + 80,12,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
			action_text = "Select a slot to move KAFFARI GUARD to.\n\n\nESC to exit action."
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
			action_text = "Select a target for KAFFARI GUARD's attack.\n\n\nESC to exit action."
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
				scr_cg_player_0000_atk_0();
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
//Card 0000 - Player Attack 0
function scr_cg_player_0000_atk_0(){
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
		if (mouse_check_button_pressed(mb_left)) and (obj_opponent_cg.defeat_delay = false)
		{
			action_state = false;
			obj_opponent_cg.active_array[_targetNum,5] += 2;
			var _hpRem = obj_opponent_cg.active_array[_targetNum,4] - obj_opponent_cg.active_array[_targetNum,5];
			if (_hpRem <= 0)
			{
				action_text = "Target Defeated."
				with (obj_opponent_cg)
				{
					defeat_delay = true;
					defeat_timer = 120;
					defeat_target = 5 - other.active_slot;
				}
			}
			else
			{
				action_text = "Select a card."
			}
			card_selected = -1;
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
function scr_cg_opp_0000_hand_playcheck(){
if (active_array[0,0] = -1)
{
	card_played = true;
	//Set to Active
	active_array[0,0] = 0;
	active_array[0,1] = "KAFFARI GAURD";
	active_array[0,2] = 0;
	active_array[0,3] = 0;
	active_array[0,4] = 4;
	active_array[0,5] = 0;

	hand_selected = true;
	hand_size = hand_size - 1;
	obj_player_cg.action_text = "Opponent played KAFARRI GUARD."
	action_timer = 60;
	with (obj_card_effect) instance_destroy();
	obj_player_cg.card_selected = scr_cg_opp_0000_active_selected;//cg_script_database[0,3];
	array_delete(hand_array,hand_slot,1);
}


}
//
//
//
//
//
//While Selected in Hand
function scr_cg_opp_0000_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _hpText = string(obj_opponent_cg.active_array[active_slot,4] - obj_opponent_cg.active_array[active_slot,5]);

//Draw Full Card
scr_cg_0000_draw(1,_hpText,_cardX,_cardY);
//draw_sprite_ext(spr_card_all_full,0,_cardX,_cardY,1,1,0,c_white,1);

//Move (Standard)


}
