//Card Array Guide
//
//0: Card ID # - 0,1,2...
//1: Name String - "Name"
//2: Type - Combatants 0-7, Spells 8, Enchantments 9, Pylon 10-15
//3: Stage - 0,1,2...
//4: HP - 4,5,6...
//
//Player Card Game 
//
//
//
//
//
//Player Card Game (Main) | obj_player_cg | Draw GUI
function scr_draw_cg_player(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//
//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);


//
//Draw Player
scr_draw_cg_player_deck();
//scr_draw_cg_player_discard();
scr_draw_cg_player_game();


}
//
//
//
//
//
//Draw Player Deck | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_deck(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _deckLen = array_length(deck_array);
var _deckY = 105;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (deck_array[0, 0] != -1)
{
	draw_sprite_ext(spr_card_back,0,295,_deckY,1,1,0,c_white,1);
	draw_text_transformed(310,_deckY,string(_deckLen),1,1,0);
	if (obj_cardGame.turn = 0)
	{
		if (draw_pt = false)
		{
			draw_pt = true;
			var _cardNum = deck_array[0,0];
			if ((_deckLen) > 1)
			{
				
				scr_cg_cardDraw_deck(player);
				array_delete(deck_array,0,1);
			}
			if ((_deckLen) = 1)
			{
				scr_cg_cardDraw_deck(player);
				deck_array[0,0] = -1;
				deck_array[0,1] = -1;
				deck_array[0,2] = -1;
				deck_array[0,3] = -1;
				deck_array[0,4] = -1;
				deck_array[0,5] = -1;
			}
		}
	}
}


}
//
//
//
//
//
//Draw Opponent Deck | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_discard(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _discardTop = array_length(discard_array) - 1;
var _discardX = 295;
var _discardY = 133;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

if (discard_array[_discardTop, 0] != -1)
{
	draw_sprite_ext(spr_card_all,discard_array[_discardTop, 2],_discardX,_discardY,1,1,0,c_white,1);
	draw_text_transformed(290,_discardY,string(array_length(discard_array)),1,1,0);
}


}
//
//
//
//
//
//Draw Player Active | obj_player_cg | scr_draw_cg_player
function scr_draw_cg_player_game(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _cardX = 165;
var _cardY = 105;
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);



//if (card_hover != -1)
//{
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_top);
//	draw_text_transformed(_mouseX,_mouseY-14,card_hover,.5,.5,0);
//}

if (action_text != -1)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(128,80,action_text,.5,.5,0);//126,85
}

if (obj_cardGame.turn = 0)
{
	draw_sprite_stretched(spr_menu_6,3,1566,60,318,80);
	draw_text_transformed(1542,64,"END\nTURN",3,3,0);
	if (point_in_rectangle(_mouseX,_mouseY,1542,64,1642,164)) and (action_state = false)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_sprite_stretched(spr_highlight_nineslice,0,130,138,31,17);
		if (mouse_check_button_released(mb_left))
		{
			draw_pt = false;
			charge_pt = false;
			move_pt = false;
			pylon_pt = false;
			obj_cardGame.turn = 1;
		}
	}
}
}
