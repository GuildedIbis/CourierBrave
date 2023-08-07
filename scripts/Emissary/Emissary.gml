//NPC Necromancer
//
//
//
//
//
//Necromancer Create
function scr_npc_emissary_create(){
entity_step = scr_npc_emissary_scene_00;
sound = snd_npc_mouse;
timer1 = 40;
idle_sprite = spr_npc_emissary;
scene = false;
sprite_index = spr_npc_emissary_scene_00;
image_speed = 0;
}
//
//
//
//
//
//Necromancer Scene 1 Step
function scr_npc_emissary_scene_00(){
if (global.dayPhase = 2)
{
	image_alpha = 0;
	image_index = 0;
	image_speed = 0;
}
else
{
	image_alpha = 1;
	image_speed = 1;
	sprite_index = spr_npc_emissary_scene_00;
	timer1 = timer1 - 1;
	if (timer1 <= 0)
	{
		entity_step = scr_npc_emissary_idle;
		obj_player.scene = false;
	}
}
}
//
//
//
//
//
//Necromancer Scene 1 Step
function scr_npc_emissary_idle(){
if (obj_game.gamePaused = false)
{
//Interaction Script
image_alpha = 1;
image_index = 1;
image_speed = 0;
sprite_index = spr_npc_emissary;
scr_npc_interact(12);

//Animate
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (keyboard_check_pressed(ord("E"))) 
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_index = _cardinalDir;
		sprite_index = spr_npc_emissary;
		entity_step = scr_npc_emissary_scene_01;
		timer1 = 160;
		with (obj_player)
		{
			scene = true;
			sprite_index = idle_sprite;
			image_speed = 0;
			state_script = scr_player_scene_01;
			timer1 = 39;
			timer2 = 170;
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
//Necromancer Scene 1 Step
function scr_npc_emissary_scene_01(){
if (obj_game.gamePaused = false)
{
//Interaction Script
if (timer1 < 120)
{
	image_alpha = 1;
	image_speed = 1;
	sprite_index = spr_npc_emissary_scene_01;
}

//Animate
timer1 = timer1 - 1;
if (timer1 <= 0)
{
	scr_room_transition(88,88,rm_lenko_farwayRoad_00,0,0,obj_inventory.farwayRoad_map_ary,obj_game.farwayRoad_enemy_grid,true,0);
}
}
}
//
//
//
//
//
//Necromancer Scene 1 Text
function scr_text_emissary_scene_01(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//
//
//
//Initial Dialogue;
if (obj_inventory.quest_grid[# 89, 0] = false)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Emissary Theeda"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Good morning Captain.\nI see you've found the Elder Tree in purple flower...\nYou must have waited here a long time." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "You haven't forgotten what it means then?\nYou are prepared to return?"
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		e_page = false;
		draw_sprite_stretched(menu_sprite,3,258,136,48,48);
		text_string = "Kephra sent me with a formal decree and her regards,\nwill you hear it?"
		_SubString = string_copy(text_string,1,letter_counter);
		if (letter_counter >= string_length(text_string))
		{
			draw_set_font(global.fnt_main_white);
			draw_set_halign(fa_left)
			draw_set_valign(fa_middle)
			draw_sprite_stretched(spr_menu_circle16,1,70,92,180,20);
			draw_sprite_stretched(spr_menu_circle16,1,70,114,180,20);
			var _buttonString = "Yes, thank you Theeda."
			var _buttonString2 = "Only her regards please. (Skip Intro)"
			draw_text_transformed(76,102,_buttonString,.6,.6,0)
			draw_text_transformed(76,124,_buttonString2,.6,.6,0)
			if (point_in_rectangle(_mouseX,_mouseY,70,92,250,112))
			{
				draw_sprite_stretched(spr_highlight_circle,0,69,91,182,22);
				if (mouse_check_button_pressed(mb_left))
				{
					obj_inventory.quest_grid[# 89, 0] = true;
					e_page = true;
					text_string = ""
					string_counter = 0;
					page = 0;
				}
			}
			if (point_in_rectangle(_mouseX,_mouseY,70,114,250,134))
			{
				draw_sprite_stretched(spr_highlight_circle,0,69,113,182,22);
				if (mouse_check_button_pressed(mb_left))
				{
					obj_inventory.quest_grid[# 89, 0] = true;
					e_page = true;
					text_string = ""
					string_counter = 0;
					page = 1;
				}
			}
		}
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		//draw_text_transformed(72,128,"Select ",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}
//
//
//
//Kephra's Dialogue;
if (obj_inventory.quest_grid[# 89, 0] = true) and (page = 0)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Emissary Theeda"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "This is Kephra's Decree" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "The relevent events leading to this."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);

	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "This ends Kephra's decree."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 3)
	{
		speaker = 1;
		text_string = ""
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		string_counter = 0;
		page = 1;
	
	}
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}

//
//
//
//Kephra's Regards Dialogue;
if (obj_inventory.quest_grid[# 89, 0] = true) and (page = 1)
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Emissary Theeda"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Regaliare, Captain of the Couriers..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Motherly concern and Your mission\nGo now and protect the good creatures..."
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);

	}
	if (string_counter >= 2)
	{
		text_script = Idle;
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_text_transformed(259,130,_name,.35,.35,0);
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}

}