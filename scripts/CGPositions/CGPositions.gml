//Card Position Scripts
function scr_cg_card_position_player(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
draw_sprite_ext(spr_card_all,card_type,x,y,1,1,0,c_white,1.0);
depth = obj_cardGame.depth - 1;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _handSize = obj_player_cg.hand_size;

switch(card_place)
{
	case 0: //Hand
		//Set Position
		var _cardY = 161;
		if (_handSize < 11)
		{
			var _leftAlign = 224 - (_handSize * 8);
			var _space = 16;
			var _cardX = _leftAlign + (16 * card_position);
		}
		else
		{
			var _leftAlign = 224 - (11 * 8);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,170/_handSize); //It's 185 from one edge to the other, -15 for the width of the card
			var _cardX = _leftAlign + (_space * card_position);
		}
		x = _cardX;
		y = _cardY;
		
		//Select
		if (point_in_rectangle(mouse_x,mouse_y,_cardX,_cardY,_cardX+15,_cardY+21))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + -1,_cardY -1,17,23);
			if (mouse_check_button_pressed(mb_left))
			{
				with (obj_card)
				{
					selected = false;
				}
				selected = true;
			}
		}
	break;
		
	case 1: //Active
		//Set Position
		var _cardX = 165 + (20 * card_position)
		var _cardY = 105;
		x = _cardX;
		y = _cardY;
		
		//Select
		if (point_in_rectangle(mouse_x,mouse_y,_cardX,_cardY,_cardX+15,_cardY+21))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + -1,_cardY -1,17,23);
			if (mouse_check_button_pressed(mb_left))
			{
				with (obj_card)
				{
					selected = false;
				}
				selected = true;
			}
		}
	break;
		
	case 2: //Back
	break;
}
}
//
//
//
//
//
//Opponent Position
function scr_cg_card_position_opp(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
depth = obj_cardGame.depth - 1;

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _handSize = obj_player_cg.hand_size;

switch(card_place)
{
	case 0: //Hand
		//Set Position
		var _cardY = 8;
		if (_handSize < 11)
		{
			var _leftAlign = 224 - (_handSize * 8);
			var _space = 16;
			var _cardX = _leftAlign + (16 * card_position);
		}
		else
		{
			var _leftAlign = 224 - (11 * 8);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,170/_handSize); //It's 185 from one edge to the other, -15 for the width of the card
			var _cardX = _leftAlign + (_space * card_position);
		}
		x = _cardX;
		y = _cardY;
	break;
		
	case 1: //Active
	break;
		
	case 2: //Back
	break;
}
}