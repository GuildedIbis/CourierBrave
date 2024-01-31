//Card 0000
//
//
//
//
//
//Draw From Deck
function scr_cg_0000_draw(){
var _newCard = array_length(p_hand_array) - 1; //"-1" because the array was already += 1
//CID
//Name
//Selected Script
//Type
p_hand_array[_newCard, 0] = 0;
p_hand_array[_newCard, 1] = "Yellow Combatant";
p_hand_array[_newCard, 2] = scr_cg_0000_hand_selected;
p_hand_array[_newCard, 3] = 0;
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

//Draw Full Card
draw_sprite_ext(spr_card_all_full,0,0,3,1,1,0,c_white,1);

//Set 
if (p_active_array[0,0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165,98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165,98,180,119))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164,97,17,23);
		if (mouse_check_button_released(mb_left)) 
		{
			//Set to Active
			p_active_array[0,0] = 0;
			p_active_array[0,1] = "Yellow Combatant";
			p_active_array[0,2] = scr_cg_0000_active_selected;
			p_active_array[0,3] = 0;
		
			//Remove From Hand
			array_delete(p_hand_array,p_hand_slot,1);
			p_hand_slot = -1;
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
function scr_cg_0000_active_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Full Card
draw_sprite_ext(spr_card_all_full,0,0,3,1,1,0,c_white,1);

//Move (Standard)
scr_cg_active_move();

}