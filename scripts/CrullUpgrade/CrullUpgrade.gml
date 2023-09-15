//
//
//
//
//
//Crull Upgrade Pedestal Create
function xCrullUpgradePedestalCreate(){
entity_step = CrullUpgradePedestalStep;
sound = -1;
active_sprite = spr_crullUpgrade_pedestal;
idle_sprite = spr_crull_pedestal_empty;
}
//
//
//
//
//
//Crull Upgrade Pedestal Step
function xCrullUpgradePedestalStep(){
if (obj_inventory.crullUpgrade_list[activate_args] = false)
{
		sprite_index = active_sprite;
		image_speed = 1;
}
else
{
	sprite_index = idle_sprite;
	image_speed = 0;
}
}
//
//
//
//
//
//Crull Upgrade 1 Text
function xCrullUpgradePedestal1Text(){
//Stone
if (obj_inventory.crullUpgrade_list[1] = false)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);


	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "Crull Stone Level Upgrade found.\nCrull Stone now heals +25." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_player.crull_level = obj_player.crull_level + 1;
		obj_inventory.crullUpgrade_list[1] = true;
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
}

//Active
if (obj_inventory.crullUpgrade_list[1] = true)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_sprite_stretched(menu_sprite,3,64,136,192,48);
	draw_set_color(c_white);

	//Draw Based on String Counter
	var _SubString
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "There was a Crull Level Upgrade here" 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}
	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		if (obj_player.crull_level = 1) obj_player.crull_level = 2;
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
	
}
//
}