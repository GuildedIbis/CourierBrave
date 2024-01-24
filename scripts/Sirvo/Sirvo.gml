//NPC Sirvo
//Vostle 00-05
//
//
//
//
//Sirvo Create
function scr_npc_sirvo_create(){
entity_step = scr_npc_sirvo_step;
sprite_index = spr_npc_sirvo;
npc_idle = spr_npc_sirvo;
npc_move = spr_npc_sirvo_walk;
sound = snd_npc_mouse;
interact = 20;
npc_spd = 1.0;
path = -1;
timerW = irandom_range(0,120);
}
//
//
//
//
//
//Sirvo Step
function scr_npc_sirvo_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	scr_npc_wander_home_range(60,240,home_x,home_y,64);
	scr_npc_animation();
}
else
{
	sprite_index = npc_idle;
	image_speed = 0;
	path_end();
}
}
//
//
//
//
//
//Sirvo Text
function scr_text_npc_sirvo(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_sprite_stretched(spr_menu_beveled,3,258,114,66,70);
draw_sprite(spr_npc_portrait_sirvo,0,261,117);
draw_set_color(c_white);
var _name = "Sirvo"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "I've got beds open if you need rest.\nDon't worry about pay- a rat killer is a welcome guest." 
	_SubString = string_copy(text_string,1,letter_counter);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{
	speaker = 1;
	e_page = false;
	//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	text_string = "Anything I can do for you?"
	_SubString = string_copy(text_string,1,letter_counter);
	if (letter_counter >= string_length(text_string))
	{
		draw_set_font(global.fnt_main_white);
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_sprite_stretched(spr_menu_circle16,1,70,92,180,20);
		draw_sprite_stretched(spr_menu_circle16,1,70,114,180,20);
		var _buttonString = "I dunno, make a card game or something."
		var _buttonString2 = "No, thank you Sirvo."
		draw_text_transformed(76,102,_buttonString,.6,.6,0);
		draw_text_transformed(76,124,_buttonString2,.6,.6,0);
		if (point_in_rectangle(_mouseX,_mouseY,70,92,250,112))
		{
			draw_sprite_stretched(spr_highlight_circle,0,69,91,182,22);
			if (mouse_check_button_pressed(mb_left))
			{
				scr_text_end(false);
				_SubString = string_copy(text_string,1,letter_counter);
				scr_card_game_create();
				text_script = scr_card_game_step;
			}
		}
		if (point_in_rectangle(_mouseX,_mouseY,70,114,250,134))
		{
			draw_sprite_stretched(spr_highlight_circle,0,69,113,182,22);
			if (mouse_check_button_pressed(mb_left))
			{
				scr_text_end();
				_SubString = string_copy(text_string,1,letter_counter);
				e_page = true;
			}
		}
		draw_set_valign(fa_middle);
		draw_set_halign(fa_right);
		draw_text_transformed(69,86,"SELECT ONE",.5,.5,0);
	}
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
}
}