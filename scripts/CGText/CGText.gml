//
//
//
//
//
//Text Script Card Game
function scr_text_card_game(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
depth = obj_cursor.depth + 1;

if (keyboard_check_pressed(vk_escape))
{
	if (obj_player_cg.action_state = false)
	{
		obj_game.cardPaused = !obj_game.cardPaused;
	}
	else
	{
		obj_player_cg.action_state = false;
		obj_player_cg.action_text = "Select a card.";
	}
}

if (obj_game.cardPaused = true)
{
	draw_sprite_stretched(spr_menu_background,0,0,0,480,270);
	draw_sprite_stretched(spr_menu_beveled,3,200,100,80,60);
	draw_sprite_stretched(spr_menu,8,190,100,90,20);
	draw_sprite_stretched(spr_menu_circle16,1,210,124,60,16);
	draw_sprite_stretched(spr_menu_circle16,1,210,142,60,16);
	
	if (point_in_rectangle(_mouseX,_mouseY,210,124,270,140))
	{
		draw_sprite_stretched(spr_highlight_circle,0,219,123,62,18);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.card_live = false;
			with(obj_card)
			{
				instance_destroy();
			}
			with(obj_cardGame)
			{
				instance_destroy();
			}
			with(obj_player_cg)
			{
				instance_destroy();
			}
			with(obj_opponent_cg)
			{
				instance_destroy();
			}
			with(obj_card_effect)
			{
				instance_destroy();
			}
		
			scr_text_end();
			_SubString = string_copy(text_string,1,letter_counter);
			e_page = true;
			obj_game.cardPaused = false;
		}
	}
	//if (point_in_rectangle(_mouseX,_mouseY,125,93,195,109))
	//{
	//	draw_sprite_stretched(spr_highlight_circle,0,124,92,72,18);
	//	if (mouse_check_button_pressed(mb_left))
	//	{
	//		obj_game.cardPaused = false;
	//	}
	//}
}
}