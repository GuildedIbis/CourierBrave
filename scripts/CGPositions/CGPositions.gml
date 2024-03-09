//Card Position Scripts
function scr_cg_card_position_player(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

switch(card_place)
{
	case 0: //Hand
		//Set Position
		var _cardY = 161;
		if (hand_size < 11)
		{
			var _leftAlign = 224 - (hand_size * 8);
			var _space = 16;
			var _cardX = _leftAlign + (16 * i);
		}
		else
		{
			var _leftAlign = 224 - (11 * 8);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,170/hand_size); //It's 185 from one edge to the other, -15 for the width of the card
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
//
//
//
//
//
//Opponent Position
function scr_cg_card_position_opp(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

switch(card_place)
{
	case 0: //Hand
		//Set Position
		var _cardY = 4;
		if (hand_size < 11)
		{
			var _leftAlign = 224 - (hand_size * 8);
			var _space = 16;
			var _cardX = _leftAlign + (16 * i);
		}
		else
		{
			var _leftAlign = 224 - (11 * 8);
			//var _space = max(1,26 - ((_handSize - 11)));
			var _space = max(1,170/hand_size); //It's 185 from one edge to the other, -15 for the width of the card
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