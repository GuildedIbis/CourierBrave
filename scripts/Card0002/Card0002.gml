//Card 0002 - Player
//
//
//
//
//
//Draw From Deck
function scr_cg_0002_draw(){
var _newCard = array_length(hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
if (player = 0)
{
	hand_array[_newCard, 0] = 2;
	hand_array[_newCard, 1] = "Captain Holon";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 2;
	hand_array[_newCard, 4] = 14;
	//hand_array[_newCard, 5] = scr_cg_player_0002_hand_selected;

}
if (player = 1)
{
	hand_array[_newCard, 0] = 2;
	hand_array[_newCard, 1] = "Captain Holon";
	hand_array[_newCard, 2] = 0;
	hand_array[_newCard, 3] = 2;
	hand_array[_newCard, 4] = 14;
	//hand_array[_newCard, 5] = scr_cg_player_0002_hand_selected;
}
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_player_0002_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Full Card
draw_sprite_ext(spr_card_all_full,2,0,3,1,1,0,c_white,1);
//
//
//
//
//Set 
if (obj_cardGame.turn = 0)
{
	if (active_array[0,0] = -1)
	{
		draw_sprite_ext(spr_card_slot_effect,0,165,98,1,1,0,c_white,1);//80,92
		if (point_in_rectangle(_mouseX,_mouseY,165,98,180,119))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,164,97,17,23);
			if (mouse_check_button_released(mb_left)) 
			{
				//Set to Active
				active_array[0,0] = 2;
				active_array[0,1] = "Lightray Knight";
				active_array[0,2] = 0;
				active_array[0,3] = 2;
				active_array[0,4] = 14;
				//active_array[0,5] = scr_cg_player_0002_active_selected;

		
				//Remove From Hand
				array_delete(hand_array,hand_slot,1);
				hand_slot = -1;
				p_card_selected = -1;
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
function scr_cg_player_0002_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Full Card
draw_sprite_ext(spr_card_all_full,2,0,3,1,1,0,c_white,1);

//Move (Standard)
if (obj_cardGame.turn = 0)
{
	scr_cg_player_active_move();

}


}

//
//
//
//
//
//While Selected in Hand
function scr_cg_opp_0002_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Full Card
draw_sprite_ext(spr_card_all_full,2,0,3,1,1,0,c_white,1);

//Move (Standard)


}
