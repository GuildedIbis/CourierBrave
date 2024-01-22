//Card 0001
//
//
//
//
//
//Draw From Deck
function scr_cg_0001_draw(){
var _newCard = array_length(phand_array) - 1;
phand_array[_newCard, 0] = 1;
phand_array[_newCard, 1] = "Name";
phand_array[_newCard, 2] = scr_cg_0001_hand_selected;
phand_array[_newCard, 3] = 1;
}
//
//
//
//
//
//While Selected in Hand
function scr_cg_0001_hand_selected(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
draw_sprite_stretched(spr_menu_circle16,1,8,98,16,16);
if (point_in_rectangle(_mouseX,_mouseY,8,98,24,114))
{
	draw_sprite_stretched(spr_highlight_circle,0,7,97,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		array_delete(phand_array,hand_slot,1);
		hand_slot = -1;
		card_selected = -1;
	}
}
}