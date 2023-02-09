//NPC Kovalad
//Kovalads House North of Lenko Main
//Weapon and Armor Upgrading
//
//
//
//
//
//Kovalad Create
function KovaladCreate(){
entity_step = KovaladStep;
sound = snd_npc_mouse;
animation_counter = 0;
animation_timer = 180;
}
//
//
//
//
//
//Kovalad Step
function KovaladStep(){
sprite_index = spr_npc_kovalad;
if (animation_counter <= 2)
{
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = local_frame;
	local_frame = local_frame + sprite_get_speed(sprite_index) / _frameRate;
	//Cuts the degree by 90 to give you a number between 0 and 3
	//The 0-3 is multiplied by the 1/4 frame number because all four sprites are within a single sprite.
	//Local frame then increments in the speed of the animation
	if (local_frame >= _totalFrames)
	{
		animation_counter = animation_counter + 1;
		animation_end = true;
		local_frame = local_frame - _totalFrames
	}
	else animation_end = false;
}
else 
{
	image_speed = 0;
	image_index = 0;
	animation_timer = animation_timer - 1;
	if (animation_timer <= 0)
	{
		animation_timer = 180;
		animation_counter = 0;
	}
}
}
//
//
//
//
//
//Kovalad Text
function KovaladText(){
//Before Talking to Nisma
if (obj_inventory.quest_grid[# 1, 1] <= 0)
{
	//Quest info
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Kovalad the Weapon Smith"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "You must be the Courier!\nThat flower sniffing old mouse was right..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "You should go talk to Nisma down the hall,\n but come back by when you're ready to talk steel." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		obj_inventory.quest_grid[# 1, 0] = true;
		obj_inventory.quest_grid[# 1, 1] = 0;
	}
	if (string_counter >= 2)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		//Revert if broken^
	
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
	draw_sprite(spr_npc_kovalad36,0,258+6,136+6);
}

//First time talking after talking to Nisma
if (obj_inventory.quest_grid[# 1, 1] >= 1) and (obj_inventory.quest_grid[# 2, 0] = false)
{
	//Quest info
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Kovalad the Weapon Smith"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Courier! What an honor you've entered my humble shop.\nAnd none too soon, I fear we are on the edge of absolute darkness.\nThe Great Evil lurks behind every tree." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawSmithMenu(obj_player.melee_id,obj_inventory);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "But with your arrival, the power of fear has changed hands.\nNow the rats and monsters will tremble and hide.\nI am honored to work Courier steel..." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawSmithMenu(obj_player.melee_id,obj_inventory);
	}
	if (string_counter = 2)
	{
		speaker = 1;
		text_string = "...Materials don't exactly come by doorstep delivery.\nYou'll have to provide your own resources for the most part,\nbut keep the rats off our doorstep and I'll consider it a favor." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawSmithMenu(obj_player.melee_id,obj_inventory);
	}
	if (string_counter >= 3)
	{
			
		text_script = KovaladMenu;
		obj_inventory.quest_grid[# 2, 0] = true;
		obj_inventory.quest_grid[# 2, 1] = 0;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
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
	draw_sprite(spr_npc_kovalad36,0,258+6,136+6);

	
}


//After First Conversation with Nisma and Kovalad
if (obj_inventory.quest_grid[# 1, 1] >= 1) and (obj_inventory.quest_grid[# 2, 0] = true)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Kovalad the Weapon Smith"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "The death of dark is crafted with fire." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "I'm honored to forge Courrier steel."
		_SubString = string_copy(text_string,1,letter_counter);
		//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawArmorSmithMenu(obj_player.melee_id,obj_inventory);
	}

	if (string_counter >= 2)
	{
		text_script = KovaladMenu;
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
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
	draw_sprite(spr_npc_kovalad36,0,258+6,136+6);
}
}
//
//
//
//
//
//Kovalad Menu
function KovaladMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Kovalad the Smith"
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_kovalad36,0,258+6,136+6);

//Draw Based on String Counter
//Get mouse location on GUI


//draw_text_transformed(68,28,"Press E to Exit",.5,.5,0);

//Lefthand Buttons
draw_sprite_stretched(button_sprite,3,70,142,88,15);
draw_sprite_stretched(button_sprite,3,164,142,88,15);
draw_sprite_stretched(button_sprite,3,70,159,88,15);

//draw_sprite_stretched(menu_sprite,3,70,163,88,15);
//draw_sprite_stretched(menu_sprite,3,164,163,88,15);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(114,149,"WEAPONS",.5,.5,0);
draw_text_transformed(208,149,"ARMOR",.5,.5,0);
draw_text_transformed(114,166,"QUEST",.5,.5,0);
//draw_text_transformed(40,86,"WEAPONS",.5,.5,0);
//draw_text_transformed(40,122,"MAGIC",.5,.5,0);
//draw_text_transformed(40,158,"x(ARMOR)x",.5,.5,0);


if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 1;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		
		////Reset Buy/Sell Menu
		//page = 0;
		//slot = -1;
		//item_id = -1;
		//item_name = -1;
		//sell_price = 0;
		//buy_price = 0;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 2;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,70,159,158,166))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,157,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		text_gui = 3;
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (text_gui = 0) 
{
	
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
}
if (text_gui = 1) 
{
	//draw_sprite_stretched(menu_sprite,3,32,36,256,96);
	draw_text_transformed(64,28,"Press E to Exit",.5,.5,0);
	DrawWeaponSmithMenu(obj_player.form,obj_inventory);
}
if (text_gui = 2) 
{
	
	draw_text_transformed(64,28,"Press E to Exit",.5,.5,0);
	DrawArmorSmithMenu(obj_player.form,obj_inventory);
}
if (text_gui = 3) 
{
	
	draw_text_transformed(64,28,"Press E to Exit",.5,.5,0);
	text_script = KovaladQuestText;
}
if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
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

}
//
//
//
//
//
//Kovalad Quest Text
function KovaladQuestText(){
//Before Talking to Nisma
if (obj_inventory.quest_grid[# 2, 1] < 100)
{
	//Quest info
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Kovalad the Weapon Smith"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "With all these rats lurking about, getting a good\nhaul of resources is more dangerous than it's worth." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "If you could clear enough of them out\nI'd be honored to share what I gather." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		obj_inventory.quest_grid[# 1, 0] = true;
		obj_inventory.quest_grid[# 1, 1] = 0;
	}
	if (string_counter >= 2)
	{
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		obj_game.gamePaused = false;
		obj_game.textPaused = false;
		//Revert if broken^
	
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
	draw_sprite(spr_npc_kovalad36,0,258+6,136+6);
}

//First time talking after talking to Nisma
if (obj_inventory.quest_grid[# 2, 1] >= 100)
{
	//Quest info
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);
	draw_sprite_stretched(menu_sprite,3,258,136,48,48);
	var _name = "Kovalad the Weapon Smith"

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Every rat slain makes Lenko a safer place to travel.\nIt's not much, but I hope these resources are helpful nonetheless." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawSmithMenu(obj_player.melee_id,obj_inventory);
	}
	if (string_counter = 1)
	{
		speaker = 1;
		text_string = "ITEMS RECEIVED: Rustrock Chunk x 5... Raw Silver x1\nJade Essence x5... Tarby Pearl x1" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
		//DrawSmithMenu(obj_player.melee_id,obj_inventory);
	}
	if (string_counter >= 2)
	{
			
		text_script = KovaladMenu;
		obj_inventory.quest_grid[# 2, 0] = true;
		obj_inventory.quest_grid[# 2, 1] = 0;
		ItemsAdd(obj_inventory,5,5)
		ItemsAdd(obj_inventory,6,1)
		ItemsAdd(obj_inventory,4,5)
		ItemsAdd(obj_inventory,9,1)
		text_string = ""
		string_counter = 0;
		_SubString = string_copy(text_string,1,letter_counter);
		//obj_game.gamePaused = false;
		//obj_game.textPaused = false;
	
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
	draw_sprite(spr_npc_kovalad36,0,258+6,136+6);

	
}


}
