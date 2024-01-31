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
phand_array[_newCard, 1] = "Yellow Combatant";
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

//draw_sprite_stretched(spr_menu_circle16,1,42,50,16,16);
//draw_sprite_ext(spr_menu_arrow,2,50,58,1,1,0,c_white,1);
//if (!point_in_rectangle(_mouseX,_mouseY,60,50,260,130))
//{
//	//draw_sprite_stretched(spr_highlight_circle,0,41,49,18,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		hand_slot = -1;
//		card_selected = -1;
//	}
//}


//draw_sprite_stretched(spr_menu_beveled,3,60,50,200,80);
draw_sprite_ext(spr_card_all_full,0,0,3,1,1,0,c_white,1);

if (pactive_array[0,0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165,98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165,98,180,119))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164,97,17,23);
		if (mouse_check_button_released(mb_left)) 
		{
			//Set to Active
			pactive_array[0,0] = 0;
			pactive_array[0,1] = "Yellow Combatant";
			pactive_array[0,2] = scr_cg_0000_active_selected;
			pactive_array[0,3] = 0;
		
			//Remove From Hand
			array_delete(phand_array,hand_slot,1);
			hand_slot = -1;
			card_selected = -1;
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

draw_sprite_ext(spr_card_all_full,0,0,3,1,1,0,c_white,1);

//draw_sprite_stretched(spr_menu_circle16,1,42,50,16,16);
//draw_sprite_ext(spr_menu_arrow,2,50,58,1,1,0,c_white,1);
//if (!point_in_rectangle(_mouseX,_mouseY,60,50,260,130))
//{
//	//draw_sprite_stretched(spr_highlight_circle,0,41,49,18,18);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		hand_slot = -1;
//		card_selected = -1;
//	}
//}

if (active_slot <= 4) and (pactive_array[active_slot + 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (active_slot + 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (active_slot + 1)),98,180 + (20 * (active_slot + 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (active_slot + 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			pactive_array[active_slot + 1, 0] = 0;
			pactive_array[active_slot + 1, 1] = "Yellow Combatant";
			pactive_array[active_slot + 1, 2] = scr_cg_0000_active_selected;
			pactive_array[active_slot + 1, 3] = 0;
			pactive_array[active_slot, 0] = -1;
			pactive_array[active_slot, 1] = -1;
			pactive_array[active_slot, 2] = -1;
			pactive_array[active_slot, 3] = -1;

			active_slot = -1;
			hand_slot = -1;
			card_selected = -1;
		}
	}
}
if (active_slot >= 1) and (pactive_array[active_slot - 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (active_slot - 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (active_slot - 1)),98,180 + (20 * (active_slot - 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (active_slot - 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			pactive_array[active_slot - 1, 0] = 0;
			pactive_array[active_slot - 1, 1] = "Yellow Combatant";
			pactive_array[active_slot - 1, 2] = scr_cg_0000_active_selected;
			pactive_array[active_slot - 1, 3] = 0;
			pactive_array[active_slot, 0] = -1;
			pactive_array[active_slot, 1] = -1;
			pactive_array[active_slot, 2] = -1;
			pactive_array[active_slot, 3] = -1;

			active_slot = -1;
			hand_slot = -1;
			card_selected = -1;
		}
	}
}
}