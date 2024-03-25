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
	draw_sprite_stretched(spr_menu_background,0,0,0,320,180);
	draw_sprite_stretched(spr_menu_beveled,3,120,50,80,60);
	draw_sprite_stretched(spr_menu,8,115,50,90,20);
	draw_sprite_stretched(spr_menu_circle16,1,125,75,70,16);
	draw_sprite_stretched(spr_menu_circle16,1,125,93,70,16);
	
	if (point_in_rectangle(_mouseX,_mouseY,125,75,195,91))
	{
		draw_sprite_stretched(spr_highlight_circle,0,124,74,72,18);
		if (mouse_check_button_pressed(mb_left))
		{
			display_set_gui_size(_resolutionWidth,_resolutionHeight);
			obj_game.card_live = false;
			with (obj_cursor)
			{
				scale_x = 1;
				scale_y = 1;
			}
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
	if (point_in_rectangle(_mouseX,_mouseY,125,93,195,109))
	{
		draw_sprite_stretched(spr_highlight_circle,0,124,92,72,18);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.cardPaused = false;
		}
	}
}
}