//Player Scene CG
//
//
//
//
//
//Player Scene CG
function PlayerSceneCG(){
//sprite_index = idle_sprite;
//Convert Mouse to GUI
}
//
//
//
//
//
//Text for Player CG Scene
function PlayerSceneTextCG(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_sprite_stretched(menu_sprite,3,0,0,320,180);
draw_set_color(c_white);
draw_sprite(spr_gameBoard,0,0,0);

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "" 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(16,71,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{
	obj_game.scene = false;
	obj_player.scene = false;
	obj_player.state_script = obj_player.free_state;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
//if (point_in_rectangle(_mouseX,_mouseY,16,64,47,79))
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,14,62,36,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		scene = false;
//	}
//}
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}