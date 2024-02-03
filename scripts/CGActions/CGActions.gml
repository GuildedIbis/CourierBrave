//CG Basic Actions
//
//
//
//
//
//Deck Shuffle
function scr_cg_deck_shuffle(){
var _size = array_length(deck_array);
var _tempDeck = array_create(_size);

//Save Temporary Copy of Deck
for (var j = 0; j < _size; j = j + 1)
{
	_tempDeck[j, 0] = deck_array[j, 0];
	_tempDeck[j, 1] = deck_array[j, 1];
	_tempDeck[j, 2] = deck_array[j, 2];
}

//Reset Deck Randomly
for (var i = 0; i < _size; i = i + 1)
{
	var _shuffleID = irandom_range(0,_size - (1+i));
	deck_array[i, 0] = _tempDeck[_shuffleID, 0];
	deck_array[i, 1] = _tempDeck[_shuffleID, 1];
	deck_array[i, 2] = _tempDeck[_shuffleID, 2];
	array_delete(_tempDeck,_shuffleID,1);
}
}
//
//
//
//
//
//Move Between Active Spaces
function scr_cg_player_active_move(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (active_slot <= 4) and (active_array[active_slot + 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (active_slot + 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (active_slot + 1)),98,180 + (20 * (active_slot + 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (active_slot + 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			active_array[active_slot + 1, 0] = active_array[active_slot, 0];
			active_array[active_slot + 1, 1] = active_array[active_slot, 1];
			active_array[active_slot + 1, 2] = active_array[active_slot, 2];
			active_array[active_slot + 1, 3] = active_array[active_slot, 3];
			active_array[active_slot + 1, 4] = active_array[active_slot, 4];
			active_array[active_slot + 1, 5] = active_array[active_slot, 5];
			active_array[active_slot, 0] = -1;
			active_array[active_slot, 1] = -1;
			active_array[active_slot, 2] = -1;
			active_array[active_slot, 3] = -1;
			active_array[active_slot, 4] = -1;
			active_array[active_slot, 5] = -1;


			active_slot = -1;
			hand_slot = -1;
			p_card_selected = -1;
		}
	}
}
if (active_slot >= 1) and (active_array[active_slot - 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,165 + (20 * (active_slot - 1)),98,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,165 + (20 * (active_slot - 1)),98,180 + (20 * (active_slot - 1)),119)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,164 + (20 * (active_slot - 1)),97,17,23);
		if (mouse_check_button_released(mb_left))
		{
			//Set to Active
			active_array[active_slot - 1, 0] = active_array[active_slot, 0];
			active_array[active_slot - 1, 1] = active_array[active_slot, 1];
			active_array[active_slot - 1, 2] = active_array[active_slot, 2];
			active_array[active_slot - 1, 3] = active_array[active_slot, 3];
			active_array[active_slot - 1, 4] = active_array[active_slot, 4];
			active_array[active_slot - 1, 5] = active_array[active_slot, 5];
			active_array[active_slot, 0] = -1;
			active_array[active_slot, 1] = -1;
			active_array[active_slot, 2] = -1;
			active_array[active_slot, 3] = -1;
			active_array[active_slot, 4] = -1;
			active_array[active_slot, 5] = -1;


			active_slot = -1;
			hand_slot = -1;
			p_card_selected = -1;
		}
	}
}
}