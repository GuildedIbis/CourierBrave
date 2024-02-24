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
//Draw Full Card
function scr_cg_0003_draw(_player,_cardX=0,_cardY=5){
var _cName = "YELLOW PYLON";
var _bodyText = "At the beginning of each turn,\nthis Pylon gains +1 charge."




//Draw Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,_player,0,0,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,3,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);
draw_set_halign(fa_left);
draw_text_transformed(_cardX + 10,_cardY + 90,_bodyText,.5,.5,0);

}
//
//
//
//
//
//Draw From Deck
function scr_cg_0003_draw_fd(){
var _newCard = array_length(hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
if (player = 0)
{
	hand_array[_newCard, 0] = 3;
	hand_array[_newCard, 1] = "YELLOW PYLON";
	hand_array[_newCard, 2] = 10;
	hand_array[_newCard, 3] = -1;
	hand_array[_newCard, 4] = -1;
	//hand_array[_newCard, 5] = scr_cg_player_0001_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 3;
	hand_array[_newCard, 1] = "YELLOW PYLON";
	hand_array[_newCard, 2] = 10;
	hand_array[_newCard, 3] = -1;
	hand_array[_newCard, 4] = -1;
	//hand_array[_newCard, 5] = scr_cg_player_0001_hand_selected;

}
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_player_0003_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;
var _actX = 165;
var _actY = 105;

//Draw Full Card
scr_cg_0003_draw(0,_cardX,_cardY);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Set 
if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 10,_cardY + 81,_cardX + 102,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 9,_cardY + 80,95,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
			action_text = "Select an empty back position to place the YELLOW PYLON.\n\n\nESC to exit action."
		}
	}
	if (action_state = true)
	{
		for (var i = 0; i < 6; i = i + 1)
		{
			if (back_array[i,0] = 0)
			{
				draw_sprite_ext(spr_card_slot_effect,1,_actX + (20 * i),_actY,1,1,0,c_white,1);//80,92
				//draw_text_transformed(173 + (20 * i), 113,string(active_array[i,4]),.75,.75,0);
				if (point_in_rectangle(_mouseX,_mouseY,_actX + (20 * i),_actY,(_actX + 15) + (20 * i),_actY + 21))// and (p_card_selected = -1)
				{
					//card_hover = string(active_array[i,1]);
					draw_sprite_stretched(spr_highlight_nineslice,0,(_actX - 1) + (20 * i),_actY - 1,17,23);
					if (mouse_check_button_released(mb_left))
					{
						
						
						back_array[i,0] = 3;
						back_array[i,1] = "YELLOW PYLON";
						back_array[i,2] = 10;
						back_array[i,3] = -1;
						back_array[i,4] = 0;
				
						//Discard? Leave under?
						with (obj_card_effect) instance_destroy();
						action_text = "Select a card."
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
function scr_cg_player_0003_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;


//Draw Full Card
scr_cg_0001_draw(0,_cardX,_cardY);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (obj_cardGame.turn = 0)
{
	//Select Move
	//if (point_in_rectangle(_mouseX,_mouseY,_cardX + 105,_cardY + 81,_cardX + 114,_cardY + 90))
	//{
	//	draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 104,_cardY + 80,12,12);
	//	if (mouse_check_button_released(mb_left)) 
	//	{
	//		action_state = true;
	//		action_text = "Select a slot to move LIGHTRAY KNIGHT to.\n\n\nESC to exit action."
	//		action_choose = 0;
	//	}
	//}
	////Select Attack
	//if (point_in_rectangle(_mouseX,_mouseY,_cardX + 10,_cardY + 100,_cardX + 114,_cardY + 109))
	//{
	//	draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 9,_cardY + 99,106,12);
	//	if (mouse_check_button_released(mb_left)) 
	//	{
	//		action_state = true;
	//		action_text = "Select a target for LIGHTRAY KNIGHT's attack.\n\n\nESC to exit action."
	//		action_choose = 1;
	//	}
	//}
	////Action State
	//if (action_state = true)
	//{
	//	switch (action_choose)
	//	{
	//		case 0:
	//			scr_cg_player_active_move();
	//		break;
		
	//		case 1:
	//			scr_cg_player_0001_atk_0();
	//		break;
	//	}
	//}
}

}

//
//
//
//
//Opponent Check to Play
function scr_cg_opp_0003_hand_playcheck(){

}
//
//
//
//
//
//While Selected in Hand
function scr_cg_opp_0003_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 0;
var _cardY = 5;

//Draw Full Card
scr_cg_0003_draw(1,_cardX,_cardY);
//draw_sprite_ext(spr_gameBoard_selected,1,0,0,1,1,0,c_white,1);
//draw_sprite_ext(spr_card_all_full,1,_cardX,_cardY,1,1,0,c_white,1);

//Move (Standard)


}
