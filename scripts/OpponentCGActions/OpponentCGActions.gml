//CG Basic Actions
//
//
//
//
//
//Deck Shuffle
function scr_cg_opp_deck_shuffle(){
var _size = array_length(o_deck_array);
var _tempDeck = array_create(_size);

//Save Temporary Copy of Deck
for (var j = 0; j < _size; j = j + 1)
{
	_tempDeck[j, 0] = o_deck_array[j, 0];
	_tempDeck[j, 1] = o_deck_array[j, 1];
	_tempDeck[j, 2] = o_deck_array[j, 2];
}

//Reset Deck Randomly
for (var i = 0; i < _size; i = i + 1)
{
	var _shuffleID = irandom_range(0,_size - (1+i));
	o_deck_array[i, 0] = _tempDeck[_shuffleID, 0];
	o_deck_array[i, 1] = _tempDeck[_shuffleID, 1];
	o_deck_array[i, 2] = _tempDeck[_shuffleID, 2];
	array_delete(_tempDeck,_shuffleID,1);
}
}
//
//
//
//
//
//Move Between Active Spaces
function scr_cg_opp_active_move(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (o_active_slot <= 4) and (o_active_array[o_active_slot + 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (o_active_slot + 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (o_active_slot + 1)),98,180 + (20 * (o_active_slot + 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (o_active_slot + 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			o_active_array[o_active_slot + 1, 0] = o_active_array[o_active_slot, 0];
			o_active_array[o_active_slot + 1, 1] = o_active_array[o_active_slot, 1];
			o_active_array[o_active_slot + 1, 2] = o_active_array[o_active_slot, 2];
			o_active_array[o_active_slot + 1, 3] = o_active_array[o_active_slot, 3];
			o_active_array[o_active_slot, 0] = -1;
			o_active_array[o_active_slot, 1] = -1;
			o_active_array[o_active_slot, 2] = -1;
			o_active_array[o_active_slot, 3] = -1;

			o_active_slot = -1;
			o_hand_slot = -1;
			o_card_selected = -1;
		}
	}
}
if (o_active_slot >= 1) and (o_active_array[o_active_slot - 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (o_active_slot - 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (o_active_slot - 1)),98,180 + (20 * (o_active_slot - 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (o_active_slot - 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			o_active_array[o_active_slot - 1, 0] = o_active_array[o_active_slot, 0];
			o_active_array[o_active_slot - 1, 1] = o_active_array[o_active_slot, 1];
			o_active_array[o_active_slot - 1, 2] = o_active_array[o_active_slot, 2];
			o_active_array[o_active_slot - 1, 3] = o_active_array[o_active_slot, 3];
			o_active_array[o_active_slot, 0] = -1;
			o_active_array[o_active_slot, 1] = -1;
			o_active_array[o_active_slot, 2] = -1;
			o_active_array[o_active_slot, 3] = -1;

			o_active_slot = -1;
			o_hand_slot = -1;
			o_card_selected = -1;
		}
	}
}
}