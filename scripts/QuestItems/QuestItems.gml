//Quest Item Scripts
//
//
//
//
//Interact with Quest Items
function scr_item_quest_interact(radius){
//Activate NPC: sprite index, text script, game pause
if (point_in_circle(obj_player.x,obj_player.y,x,y,radius)) and (global.aggroCounter < 1)
{	
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		audio_sound_gain(sound,global.volumeEffects,1);
		audio_play_sound(sound,0,false);
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			if (other.activate_script != -1) text_script = other.activate_script;
			if (other.activate_args != -1) quest_num = other.activate_args;
		}
		if (activate_script != -1)
		{
			
			obj_game.gamePaused = true;
			obj_game.textPaused = true;
			if (obj_game.gamePaused)
			{
				with (all)
				{
					game_paused_image_speed = image_speed;
					image_speed = 0;
				}
			}
			else
			{
				with (all)
				{
					image_speed = game_paused_image_speed;
				}
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
//Quest Item 02 Create
function scr_quest_item_02_create(){
activate_script = scr_text_quest_item_02;
entity_step = scr_quest_item_02;
activate_args = -1;
sound = snd_item_quest_found;
sprite_index = spr_item_quest;
depth = -y;
speed = 0;
image_index = 2;
if (obj_inventory.quest_grid[# 2, 3] = true)
{
	instance_destroy();
}
}//
//
//
//
//
//Quest 02 Item
function scr_quest_item_02(){
if (obj_game.gamePaused = false)
{
	activate_script = scr_text_quest_item_02;
	entity_step = scr_quest_item_02;
	activate_args = -1;
	sound = snd_item_quest_found;
	sprite_index = spr_item_quest;
	depth = -y;
	speed = 0;
	image_index = 2;
	scr_npc_interact(12);
	if (obj_inventory.quest_grid[# 2, 1] >= 1)
	{
		instance_destroy();
	}
}
}
//
//
//
//
//Item Interaction Text
function scr_text_quest_item_02(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
//draw_set_halign(fa_left)
//draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
//draw_set_color(c_white);
//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Quest Item"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "It's a damaged necklace with an orange jewel." 
	_SubString = string_copy(text_string,1,letter_counter);
}
//if (string_counter = 1)
//{
//	speaker = 1;
//	text_string = "It's a damaged necklace with an orange jewel." 
//	_SubString = string_copy(text_string,1,letter_counter);
//}
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.quest_grid[# 2, 0] = true;
	obj_inventory.quest_grid[# 2, 1] = obj_inventory.quest_grid[# 2, 1] + 1;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	page = 0;
	selected = -1;
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
//
//
//
//
//
//Quest Item 10 Create
function scr_quest_item_10_create(){
activate_script = scr_text_quest_item_10;
entity_step = scr_quest_item_10;
hit_script = scr_entity_hit_quest;
destructible = true;
sound = snd_item_quest_found;
sprite_index = spr_effect_habrafLake_crystal_small;
depth = -y;
image_speed = 0;
speed = 0;
image_index = irandom_range(0,4);
if (obj_inventory.quest_grid[# 10, 3] = false)
{
	obj_inventory.quest_grid[# 10, 1] = 0;
}
if (obj_inventory.quest_grid[# 10, 3] = true)
{
	instance_destroy();
}
}//
//
//
//
//
//Quest 02 Item
function scr_quest_item_10(){
if (obj_game.gamePaused = false)
{
	scr_npc_interact(12);
	if (obj_inventory.quest_grid[# 10, 1] >= 10)
	{
		instance_destroy();
	}
}
}
//
//
//
//
//Item Interaction Text
function scr_text_quest_item_10(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Format
draw_set_font(global.fnt_main_white);
//draw_set_halign(fa_left)
//draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
//draw_set_color(c_white);
//draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Quest Item"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "It's a small red crystal. It looks quite fragile." 
	_SubString = string_copy(text_string,1,letter_counter);
}
//if (string_counter = 1)
//{
//	speaker = 1;
//	text_string = "It's a damaged necklace with an orange jewel." 
//	_SubString = string_copy(text_string,1,letter_counter);
//}
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	//obj_inventory.quest_grid[# 2, 0] = true;
	//obj_inventory.quest_grid[# 2, 1] = obj_inventory.quest_grid[# 2, 1] + 1;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	page = 0;
	selected = -1;
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