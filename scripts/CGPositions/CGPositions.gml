//Card Position Scripts
function scr_cg_card_position_player(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//draw_sprite_ext(spr_card_all,card_type,x,y,1,1,0,c_white,1.0);
draw_sprite_ext(spr_card_all_full,card_id,x,y,1,1,0,c_white,1.0);
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
		var _cardY = (155 * 6);
		if (_handSize < 11)
		{
			var _leftAlign = (164 * 6) - (_handSize * 134);
			//var _space = 64;
			var _cardX = _leftAlign + (134 * card_position);
		}
		else
		{
			var _leftAlign = (164 * 6) - (11 * 64);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,(170*6)/_handSize); //It's 185 from one edge to the other, -15 for the width of the card
			var _cardX = _leftAlign + (_space * card_position);
		}
		x = _cardX;
		y = _cardY;
		
		//Select
		if (point_in_rectangle(_mouseX,_mouseY,_cardX,_cardY,_cardX+125,_cardY+175))
		{
			draw_sprite_ext(spr_card_all_full3,card_id,1542,554,1,1,0,c_white,1);
			draw_sprite_stretched(spr_highlight_nineslice6,0,_cardX-6,_cardY-6,137,187);
			if (mouse_check_button_pressed(mb_left))
			{
				with (obj_card)
				{
					selected = false;
				}
				selected = true;
				with (obj_card_effect)
				{
					instance_destroy();
				}
				with (instance_create_layer(x-3,y-3,"Instances",obj_card_effect))
				{
					depth = obj_cardGame.depth - 2;
					effect_draw = scr_cg_effect_selected;
				}
			}
		}
	break;
		
	case 1: //Active
		//Set Position
		var _cardX = 225 + (75 * card_position)
		var _cardY = 288;
		x = _cardX;
		y = _cardY;
		
		//Select
		if (point_in_rectangle(mouse_x,mouse_y,_cardX,_cardY,_cardX+125,_cardY+175))
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
var _handSize = obj_opponent_cg.hand_size;

switch(card_place)
{
	case 0: //Hand
		//Draw Card Back
		draw_sprite_ext(spr_card_back,0,x,y,1,1,0,c_white,1.0);
		//Set Position
		var _cardY = 2;
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
		//if (point_in_rectangle(mouse_x,mouse_y,_cardX,_cardY,_cardX+15,_cardY+21))
		//{
		//	draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + -1,_cardY -1,17,23);
		//	if (mouse_check_button_pressed(mb_left))
		//	{
		//		with (obj_card)
		//		{
		//			selected = false;
		//		}
		//		selected = true;
		//	}
		//}
	break;
		
	case 1: //Active
		draw_sprite_ext(spr_card_all,card_type,x,y,1,1,0,c_white,1.0);
		//Set Position
		var _cardX = 265 - (20 * card_position)
		var _cardY = 56;
		x = _cardX;
		y = _cardY;
		
		//Select
		//if (point_in_rectangle(mouse_x,mouse_y,_cardX,_cardY,_cardX+15,_cardY+21))
		//{
		//	draw_sprite_stretched(spr_highlight_nineslice,0,_cardX + -1,_cardY -1,17,23);
		//	if (mouse_check_button_pressed(mb_left))
		//	{
		//		with (obj_card)
		//		{
		//			selected = false;
		//		}
		//		selected = true;
		//	}
		//}
	break;
		
	case 2: //Back
	break;
}
}