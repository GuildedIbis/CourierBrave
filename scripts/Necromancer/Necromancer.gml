//NPC Necromancer
//
//
//
//
//
//Necromancer Create
function NecromancerCreate(){
entity_step = NecromancerScene1Step;
sound = snd_npc_mouse;
timer1 = 0;
idle_sprite = spr_necromancer;
sprite_index = idle_sprite;
}
//
//
//
//
//
//Necromancer Scene 1 Step
function NecromancerScene1Step(){
image_speed = 0;

if (point_in_circle(obj_player.x,obj_player.y,x,y,12))
{
	if (keyboard_check_pressed(ord("E"))) and (obj_game.gamePaused = false)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_index = _cardinalDir
	}
}
if (obj_inventory.quest_grid[# 14, 0] = true)
{
	image_alpha = image_alpha - .1;
	if (image_alpha <= 0)
	{
		if (instance_exists(obj_enemy))
		{
			with (obj_enemy)
			{
				global.aggroCounter = global.aggroCounter + 1;
				targeted = true;
				entity_step = home_state;
			}
		}
		instance_destroy();
	}
}
else sprite_index = idle_sprite;
}
//
//
//
//
//
//Necromancer Scene 1 Text
function NecromancerScene1Text(){

//
//
//
//Nisma after intiation
if (obj_inventory.quest_grid[# 14, 0] = false)
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
		text_string = "Welcome Courier!" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "It is truly an honor to meet you, Captain of Omlio Couriers."
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
		text_string = "I'm sorry, but I have sworn my service to Him.\nYour mission is in direct conflict with His commands."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 3)
	{
		speaker = 1;
		text_string = "I know I cannot keep you away from him for long,\nbut I must do everything I can to slow you."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter = 4)
	{
		speaker = 1;
		text_string = "With deepest respect Courier…"
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(72,128,"Press E to Continue",.5,.5,0);
		//DrawAlterMenu(obj_player.magic_id,obj_inventory);
		//DrawSellMenu(obj_inventory);
		//DrawBuyMenu();
		//DrawSelectedMenu(obj_inventory);
	}
	if (string_counter >= 5)
	{
		//text_script = NismaMenu;
		obj_inventory.quest_grid[# 14, 0] = true;
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