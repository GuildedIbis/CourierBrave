
//
//Card 0000 - Player
//
//
//
//
//
//Draw From Deck
function scr_cg_0000_draw(){
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
	hand_array[_newCard, 5] = scr_cg_player_0000_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 0;
	hand_array[_newCard, 1] = "KAFFARI GAURD";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 0;
	hand_array[_newCard, 4] = 4;
	hand_array[_newCard, 5] = scr_cg_player_0000_hand_selected;

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
var _cardX = 0;
var _cardY = 5;

//Draw Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,0,0,0,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,0,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);

//Actions and Buttons
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
	
	if (active_array[0,0] = -1) and (action_state = true)
	{
		draw_sprite_ext(spr_card_slot_effect,0,165,98,1,1,0,c_white,1);//80,92
		if (point_in_rectangle(_mouseX,_mouseY,165,98,180,119))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,164,97,17,23);
			if (mouse_check_button_released(mb_left)) 
			{
				//Set to Active
				active_array[0,0] = 0;
				active_array[0,1] = "KAFFARI GAURD";
				active_array[0,2] = 0;
				active_array[0,3] = 0;
				active_array[0,4] = 4;
				//active_array[0,5] = scr_cg_player_0000_active_selected;

		
				//Remove From Hand
				array_delete(hand_array,hand_slot,1);
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

//Draw Full Card
var _cName = "KAFFARI GUARD";

//Draw Full Card
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_sprite_ext(spr_gameBoard_selected,0,0,0,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,0,_cardX,_cardY,1,1,0,c_white,1);
draw_text_transformed(_cardX + 63,_cardY + 5,_cName,1,1,0);

if (obj_cardGame.turn = 0)
{
	if (point_in_rectangle(_mouseX,_mouseY,_cardX + 105,_cardY + 81,_cardX + 114,_cardY + 90))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + 104,_cardY + 80,12,12);
		if (mouse_check_button_released(mb_left)) 
		{
			action_state = true;
		}
	}

	if (action_state = true)
	{
		//Move (Standard)
		scr_cg_player_active_move();
	}
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

//Draw Full Card
draw_sprite_ext(spr_gameBoard_selected,1,0,0,1,1,0,c_white,1);
draw_sprite_ext(spr_card_all_full,0,_cardX,_cardY,1,1,0,c_white,1);

//Move (Standard)


}
