//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//5: Active/Hand Script - scr_cg_player...
//
//Card 0003 - Player
//
//
//
//
//
//Draw From Deck
function scr_cg_0003_draw(){
var _newCard = array_length(hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
if (player = 0)
{
	hand_array[_newCard, 0] = 3;
	hand_array[_newCard, 1] = "Orange Primary";
	hand_array[_newCard, 2] = 1;
	hand_array[_newCard, 3] = 0;
	hand_array[_newCard, 4] = 5;
	hand_array[_newCard, 5] = scr_cg_player_0003_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 3;
	hand_array[_newCard, 1] = "Orange Primary";
	hand_array[_newCard, 2] = 1;
	hand_array[_newCard, 3] = 0;
	hand_array[_newCard, 4] = 5;
	hand_array[_newCard, 5] = scr_cg_player_0003_hand_selected;

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

//Draw Full Card
draw_sprite_ext(spr_card_all_full,3,0,3,1,1,0,c_white,1);
//
//
//
//
//Set 
if (active_array[0,0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165,98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165,98,180,119))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164,97,17,23);
		if (mouse_check_button_released(mb_left)) 
		{
			//Set to Active
			active_array[0,0] = 3;
			active_array[0,1] = "Orange Primary";
			active_array[0,2] = 1;
			active_array[0,3] = 0;
			active_array[0,4] = 5;
			active_array[0,5] = scr_cg_player_0003_active_selected;

		
			//Remove From Hand
			array_delete(hand_array,hand_slot,1);
			hand_slot = -1;
			p_card_selected = -1;
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

//Draw Full Card
draw_sprite_ext(spr_card_all_full,3,0,3,1,1,0,c_white,1);

//Move (Standard)
scr_cg_player_active_move();

//Test Attack - 
//Select attack - enter attack state
//If obj_opp.active_array[x,0] != -1 and (correct placement)
//


}