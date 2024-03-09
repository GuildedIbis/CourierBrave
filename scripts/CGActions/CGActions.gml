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
	_tempDeck[j, 3] = deck_array[j, 3];
	_tempDeck[j, 4] = deck_array[j, 4];
	//_tempDeck[j, 5] = deck_array[j, 5];
}

//Reset Deck Randomly
for (var i = 0; i < _size; i = i + 1)
{
	var _shuffleID = irandom_range(0,_size - (1+i));
	deck_array[i, 0] = _tempDeck[_shuffleID, 0];
	deck_array[i, 1] = _tempDeck[_shuffleID, 1];
	deck_array[i, 2] = _tempDeck[_shuffleID, 2];
	deck_array[i, 3] = _tempDeck[_shuffleID, 3];
	deck_array[i, 4] = _tempDeck[_shuffleID, 4];
	//deck_array[i, 5] = _tempDeck[_shuffleID, 5];
	array_delete(_tempDeck,_shuffleID,1);
}
}
//
//
//
//
//
//
function scr_cg_combatant_defeated(){
if (defeat_delay = true)
{
	defeat_timer = defeat_timer - 1;
	if (defeat_timer <= 0)
	{
		defeat_timer = 120;
		defeat_delay = false;
		if (discard_array[0,0] != -1)
		{
			var _discard = array_length(discard_array)
			array_resize(discard_array,_discard + 1);
			discard_array[_discard, 0] = active_array[defeat_target, 0];
			discard_array[_discard, 1] = active_array[defeat_target, 1];
			discard_array[_discard, 2] = active_array[defeat_target, 2];
			discard_array[_discard, 3] = active_array[defeat_target, 3];
			discard_array[_discard, 4] = active_array[defeat_target, 4];
			active_array[defeat_target, 0] = -1;
			active_array[defeat_target, 1] = -1;
			active_array[defeat_target, 2] = -1;
			active_array[defeat_target, 3] = -1;
			active_array[defeat_target, 4] = -1;
		}
		else
		{
			discard_array[0, 0] = active_array[defeat_target, 0];
			discard_array[0, 1] = active_array[defeat_target, 1];
			discard_array[0, 2] = active_array[defeat_target, 2];
			discard_array[0, 3] = active_array[defeat_target, 3];
			discard_array[0, 4] = active_array[defeat_target, 4];
			active_array[defeat_target, 0] = -1;
			active_array[defeat_target, 1] = -1;
			active_array[defeat_target, 2] = -1;
			active_array[defeat_target, 3] = -1;
			active_array[defeat_target, 4] = -1;
		}
		defeat_target = -1;
	}
}
}
//
//
//
//
//
//Draw Card from Deck
function scr_cg_cardDraw_deck(){
//Temporary Variables
var _cardNum = deck_array[0,0];
var _cardY = 161;

//Update Hand Array
array_resize(hand_array,array_length(hand_array) + 1);
hand_size = array_length(hand_array);	
script_execute(cg_script_database[_cardNum,0]);

//Se
hand_slot = hand_size - 1;
var _newSelect = hand_array[hand_slot,0];
card_selected = cg_script_database[_newSelect,1];	
	
//Select Drawn Card
for (var i = 0; i < hand_size; i = i + 1)
{

	if (hand_size < 11)
	{
		var _leftAlign = 208 - (hand_size * 8);
		var _space = 16;
		var _cardX = _leftAlign + (16 * hand_size);
	}
	else
	{
		var _leftAlign = 208 - (11 * 8);
		//var _space = max(1,26 - ((_handSize - 11)));
		var _space = max(1,170/hand_size); //It's 185 from one edge to the other, -15 for the width of the card
		var _cardX = _leftAlign + (_space * hand_size);
	}
}
with (obj_card_effect) instance_destroy();
with (instance_create_layer(_cardX-1,_cardY-1,"Instances",obj_card_effect))
{
	depth = obj_cardGame.depth - 2;
	slot = other.hand_slot;
	effect_draw = scr_cg_effect_selected;
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
var _actX = 165;
var _actY = 105;

if (active_slot <= 4) and (active_array[active_slot + 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,_actX + (20 * (active_slot + 1)),_actY,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,_actX + (20 * (active_slot + 1)),_actY,(_actX + 15) + (20 * (active_slot + 1)),_actY + 21)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,(_actX -1) + (20 * (active_slot + 1)),_actY - 1,17,23);
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
			
			with (obj_card_effect) instance_destroy();
			move_pt = true;
			action_text = "Select a card."
			action_state = false;
			card_selected = -1;
			active_slot = -1;
			hand_slot = -1;
			
		}
	}
}
if (active_slot >= 1) and (active_array[active_slot - 1, 0] = -1)
{
	draw_sprite_ext(spr_card_slot_effect,0,_actX + (20 * (active_slot - 1)),_actY,1,1,0,c_white,1);//80,92
	if (point_in_rectangle(_mouseX,_mouseY,_actX + (20 * (active_slot - 1)),_actY,(_actY + 15) + (20 * (active_slot - 1)),_actY + 21)) 
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,(_actX - 1) + (20 * (active_slot - 1)),_actY - 1,17,23);
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

			with (obj_card_effect) instance_destroy();
			move_pt = true;
			action_text = "Select a card."
			card_selected = -1;
			action_state = false;
			active_slot = -1;
			hand_slot = -1;
			
		}
	}
}
}
//
//
//
//
//
//Check Attack Cost
function scr_cg_atk_cost_check_yellow(_cost){
var _charges = 0;
var _costMet = false;

for (var i = 0; i < 6; i = i + 1)
{
	if (back_array[i,2] = 10) and (back_array[i,4] >= 1)
	{
		_charges = _charges + back_array[i,4];
	}
}

if (_charges >= _cost)
{
	_costMet = true;
}

return _costMet
}
//
//
//
//
//
//Check Attack Cost Any
function scr_cg_atk_cost_check_any(_cost){
var _charges = 0;
var _costMet = false;

for (var i = 0; i < 6; i = i + 1)
{
	if (back_array[i,2] >= 10) and (back_array[i,2] <= 16)
	{
		if (back_array[i,4] >= 1)
		{
			_charges = _charges + back_array[i,4];
		}
	}
}

if (_charges >= _cost)
{
	_costMet = true;
}

return _costMet
}