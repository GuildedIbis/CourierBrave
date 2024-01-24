//Card 0000
//
//
//
//
//
//Draw From Deck
function scr_cg_0000_draw(){
var _newCard = array_length(phand_array) - 1;
//CID
//Name
//Selected Script
//Type
phand_array[_newCard, 0] = 0;
phand_array[_newCard, 1] = "Red Combatant";
phand_array[_newCard, 2] = scr_cg_0000_hand_selected;
phand_array[_newCard, 3] = 0;
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
//draw_sprite_stretched(spr_menu_circle16,1,8,98,16,16);
if (point_in_rectangle(_mouseX,_mouseY,80,92,105,127))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,79,91,27,37);
	if (mouse_check_button_pressed(mb_left)) and (pactive_array[0,0] = -1)
	{
		//Set to Active
		pactive_array[0,0] = 0;
		pactive_array[0,1] = "Red Combatant";
		pactive_array[0,2] = scr_cg_0000_active;
		pactive_array[0,3] = 0;
		
		//Remove From Hand
		array_delete(phand_array,hand_slot,1);
		hand_slot = -1;
		card_selected = -1;
	}
}

}
//
//
//
//
//
//While Selected in Hand
function scr_cg_0000_active(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


}