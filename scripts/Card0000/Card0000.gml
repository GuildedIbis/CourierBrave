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
//New
card_name = "KAFFARI GUARD";
card_id = 0;
card_hp = 4;
card_damage = 0;
card_type = 0;
card_stage = 0;

//Sprite
card_sprite = spr_card_all
sprite_index = card_sprite;
image_index = card_type;
image_speed = 0;


//Scripts
card_hand = scr_cg_0000_hand_selected;
card_active = scr_cg_0000_active_selected;
card_back = -1;
card_hit = -1;
card_ability = -1;
card_attack1 = scr_cg_0000_atk1;
card_attack2 = -1;

}
//
//
//
//
//
//While Selected in Hand
function scr_cg_0000_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cName = "KAFFARI GUARD";
var _hpText = card_hp - card_damage;
var _cardX = 0;
var _cardY = 5;
var _actX = 165;
var _actY = 105;


//Draw Card
scr_cg_0000_draw(card_owner,_hpText,_cardX,_cardY);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);


if (card_owner = 0)
{
	//Select Action
	if (obj_cardGame.turn = 0) and (obj_player_cg.action_state = false)
	{
		if (point_in_rectangle(_mouseX,_mouseY,_cardX + 19,_cardY + 81,_cardX + 102,_cardY + 90))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 18,_cardY + 80,86,12);
			if (mouse_check_button_released(mb_left)) 
			{
				scr_cg_card_hand_play_check(card_owner);
				if (playable = true)
				{
					with (obj_player_cg)
					{
						action_state = true;
						action_text = "Select the ENTRY SLOT to put KAFFARI GUARD into play.\n\n\nESC to exit action."
					}
				}
				else
				{
					with (obj_player_cg)
					{
						action_text = "ENTRY SLOT occupied."
					}
				}
			}
		
		}
	}

	//Execute Action
	if (obj_player_cg.action_state = true)
	{
		draw_sprite_ext(spr_card_slot_effect,0,_actX,_actY,1,1,0,c_white,1);//80,92
		if (point_in_rectangle(_mouseX,_mouseY,_actX,_actY,_actX + 15,_actY + 21))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_actX - 1,_actY - 1,17,23);
			if (mouse_check_button_released(mb_left)) 
			{
				//Set to Active
				var _cardPosition = card_position;
				with (obj_card)
				{
					if (card_owner = 0)
					{
						if (card_place = 0) and (card_position > _cardPosition)
						{
							card_position = card_position - 1;
						}
					}
				}
				card_place = 1;
				card_position = 0;
				selected = false;
				with (obj_player_cg)
				{
					action_state = false;
					action_text = "Select a card."
					hand_size = hand_size - 1;
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
function scr_cg_0000_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _hpText = 4;



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
			moveable = true;
			scr_cg_card_active_move_check(card_position + 1);
			if (obj_player_cg.move_pt = false) and (moveable = true)
			{
				with (obj_player_cg)
				{
					action_state = true;
					action_text = "Select a slot to move KAFFARI GUARD to.\n\n\nESC to exit action."
				}
				action_state = true;
				action_choose = 0;
			}
			if (obj_player_cg.move_pt = true)
			{
				with (obj_player_cg)
				{
					action_state = false;
					action_text = "Move per turn already taken."
				}
				action_state = false;
			}
			if (moveable = false)
			{
				with (obj_player_cg)
				{
					action_state = false;
					action_text = "Position occupied."
				}
				action_state = false;
			}
		}
	}
	
	//Action State
	if (action_state = true)
	{
		switch (action_choose)
		{
			case 0:
				scr_cg_card_active_move(card_owner);
			break;
		
			//case 1:
			//	scr_cg_player_0000_atk_0();
			//break;
		}
	}
}
}

//
//
//
//
//
//Card 0000 - Player Attack 1
function scr_cg_0000_atk1(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _backX = 165;
var _backY = 133;
var _targetNum = 5 - active_slot;
var _targetPos = obj_opponent_cg.active_array[_targetNum,0]
var _targetX = 265 - (20 * _targetNum)

if (_targetPos != -1) and (target_selected = -1)
{
	draw_sprite_ext(spr_card_slot_effect,2,_targetX,56,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,_targetX,56,_targetX + 15,76))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_targetX - 1,55,17,23);
		if (mouse_check_button_pressed(mb_left)) and (obj_opponent_cg.defeat_delay = false)
		{
			//if (scr_cg_atk_cost_check(1,0,0,0,0,0,1) = true)
			//{
				target_selected = _targetNum;
			//}
			//else
			//{
			//	action_text = "Not enough PYLON CHARGES."
			//}
		}
		
	}
}

if (target_selected != -1)
{
	//Select Pylons
	switch(pylon_use)
	{
		case 0:
			if (scr_cg_atk_cost_check_yellow(1) = true)
			{
				action_text = "CHARGE 1: Select a YELLOW PYLON CHARGE.\n\n\nESC to exit action."
				for (var i = 0; i < 6; i = i + 1)
				{
					if (back_array[i,2] = 10) and (back_array[i,4] >= 1)
					{
						draw_sprite_ext(spr_card_slot_effect,3,_backX + (20 * i),_backY,1,1,0,c_white,1);//80,92
						//draw_text_transformed(173 + (20 * i), 113,string(active_array[i,4]),.75,.75,0);
						if (point_in_rectangle(_mouseX,_mouseY,_backX + (20 * i),_backY,(_backX + 15) + (20 * i),_backY + 21))// and (p_card_selected = -1)
						{
							draw_sprite_stretched(spr_highlight_nineslice,0,_backX - 1,_backY - 1,17,23);
							if (mouse_check_button_pressed(mb_left))
							{
								pylon_use = 1;
								pylon_select[0] = i;
								back_array[i,4] = back_array[i,4] - 1;
							}
						}
					}
				
				}
			}
			else
			{
				action_text = "Not enough YELLOW PYLON CHARGES.\n\n\nESC to exit action."
			}
		break;
		
		case 1:
			if (scr_cg_atk_cost_check_any(1) = true)
			{
				action_text = "CHARGE 2: Select any PYLON CHARGE.\n\n\nESC to exit action."
				for (var i = 0; i < 6; i = i + 1)
				{
					if (back_array[i,2] >= 10) and (back_array[i,2] <= 16)
					{
						if (back_array[i,4] >= 1)
						{
							draw_sprite_ext(spr_card_slot_effect,3,_backX + (20 * i),_backY,1,1,0,c_white,1);//80,92
							//draw_text_transformed(173 + (20 * i), 113,string(active_array[i,4]),.75,.75,0);
							if (point_in_rectangle(_mouseX,_mouseY,_backX + (20 * i),_backY,(_backX + 15) + (20 * i),_backY + 21))// and (p_card_selected = -1)
							{
								draw_sprite_stretched(spr_highlight_nineslice,0,_backX - 1,55,17,23);
								if (mouse_check_button_pressed(mb_left))
								{
									pylon_use = 2;
									pylon_select[1] = i;
									back_array[i,4] = back_array[i,4] - 1;
									pylon_met = true;
								
								}
							}
						}
					}
				}
			}
			else
			{
				action_text = "Not enough PYLON CHARGES.\n\n\nESC to exit action."
			}
		break;
	}
			
	//Use Attack When Requirments Met				
	if (pylon_met = true)
	{
		
		//Original
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
		
		pylon_use = 0;
		pylon_select = -1;
		pylon_met = false
	}
	
	//Exit and Return Pylons
	if (keyboard_check_pressed(vk_escape))
	{
		for (var i = 0; i < pylon_use; i = i + 1)
		{
			var _returnID = pylon_select[i];
			back_array[_returnID,4] = back_array[_returnID,4] + 1;
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
function xscr_cg_opp_0000_hand_playcheck(){
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
	obj_player_cg.active_slot = 0;
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
function xscr_cg_opp_0000_active_selected(){
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
