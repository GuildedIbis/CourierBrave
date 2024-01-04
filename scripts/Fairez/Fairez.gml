//NPC Fairez
//
//
//
//
//Fairez Create
function scr_npc_fairez_create(){
entity_step = scr_npc_fairez_step;
sprite_index = spr_npc_fairez;
npc_idle = spr_npc_fairez;
npc_move = spr_npc_fairez_walk;
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
//Fairez Step
function scr_npc_fairez_step(){
if (obj_game.gamePaused = false)
{
	scr_npc_timer_countdown();
	scr_npc_interact(12);
	scr_npc_wander_home_range(60,240,home_x,home_y,64);
	scr_npc_animation();
}
else path_end();
}
//
//
//
//
//
//Fairez Text
function scr_text_npc_fairez(){
//Formatting
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(spr_menu_beveled,3,64,136,192,48);
draw_set_color(c_white);
var _name = "Fairez"

var _SubString
if (obj_inventory.quest_grid[# 10, 3] = false)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Hmph- just when you think you've found a quiet\npiece of lakeside to yourself.\nWell, thanks I guess... I found this nice fishin spot but\nI'll admit- I was a bit lost." 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "Green Skill Stone Received!" 
		_SubString = string_copy(text_string,1,letter_counter);
	}
	if (string_counter >= 2)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 10, 0] = true;
		obj_inventory.quest_grid[# 10, 1] = 3;
		obj_inventory.quest_grid[# 10, 3] = true;
		obj_inventory.skill_stone_list[11] = true;
		obj_inventory.skill_stone[4] = obj_inventory.skill_stone[4] + 1; //Green 2/12
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_text_transformed(259,110,_name,.5,.5,0);
	draw_text_transformed(69,132,"Press E to Continue",.5,.5,0);
}
if (obj_inventory.quest_grid[# 10, 3] = true)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "I might stay a bit longer. It's an excellent fishing spot.\nTell Orodry not to wait for me to have supper." 
		_SubString = string_copy(text_string,1,letter_counter);
	}

	if (string_counter >= 1)
	{
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
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(69,141,_SubString,.6,.6,0);
	draw_set_valign(fa_middle);
	draw_text_transformed(64,132,_name,.5,.5,0);
	draw_set_halign(fa_right);
	draw_text_transformed(256,132,"Press E to Continue",.5,.5,0);
}

}



