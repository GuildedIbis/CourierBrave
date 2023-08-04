//NPC Necromancer
//
//
//
//
//
//Necromancer Create
function scr_npc_emissary_create(){
entity_step = scr_npc_emissary_scene_0;
sound = snd_npc_mouse;
timer1 = 40;
idle_sprite = spr_npc_emissary;
scene = false;
sprite_index = idle_sprite;
image_speed = 0;
}
//
//
//
//
//
//Necromancer Scene 1 Step
function scr_npc_emissary_scene_0(){
//Interaction Script
scr_npc_interact_unprompted(12);

//Animate
if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_index = _cardinalDir
	}
}

//Move to next room
if (obj_inventory.quest_grid[# 89, 0] = true)
{
	obj_inventory.room_num = 0;
	obj_inventory.room_ary = obj_inventory.farwayRoad_map_ary;
	obj_game.room_num = 0;
	obj_game.room_name = obj_inventory.room_ary[0][0];
	obj_game.room_name_timer = 180;
	obj_game.room_enemy_grid = obj_game.farwayRoad_enemy_grid;
	obj_game.level_num = 0;
	obj_game.level_name = obj_inventory.level_name[0];
	obj_game.level_name_timer = 180;
	obj_inventory.level_ary[0] = true;
	global.targetX = 88;
	global.targetY = 88;
	global.targetRoom = rm_lenko_farwayRoad_00;
	global.targetCamp = true;
	script_execute(RoomEnemiesReset);
	global.lastCamp = rm_lenko_farwayRoad_00;
	global.lastCampX = 88;
	global.lastCampY = 88;
	obj_inventory.camp_grid[# 0, 3] = true;
	global.transition = true;
	global.fadeOut = true;
} 

}
//
//
//
//
//
//Necromancer Scene 1 Text
function scr_text_emissary_scene_0(){

//
//
//
//Nisma after intiation
if (obj_inventory.quest_grid[# 89, 0] = false)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "The Necromancer"

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
		text_string = "You haven't forgotten what it means then? You are prepared to return?"
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
		text_string = "Good luck Courier."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter >= 3)
	{
		//text_script = NismaMenu;
		obj_inventory.quest_grid[# 89, 0] = true;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
	
		//Reset Buy/Sell Menu
		text_gui = 0
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