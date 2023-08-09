//Star Orb Pedestal
//
//
//
//
//
//Star Orb Pedestal Create
function StarOrbPedestalCreate(){
entity_step = StarOrbPedestalStep;
sound = -1;
active_sprite = spr_starOrb_pedestal;
idle_sprite = spr_starOrb_pedestal_stone;
}

//
//
//
//
//
//Star Orb Pedestal Step
function StarOrbPedestalStep(){
if (obj_game.gamePaused = false)
{
	scr_npc_interact(12);
	if (obj_inventory.starOrb_list[activate_args] = false)
	{
		if (point_in_circle(obj_player.x,obj_player.y,x,y,64)) sprite_index = active_sprite;
		else sprite_index = idle_sprite;
		image_speed = 1;
		activate_script = StarOrbPedestalText;
	}
	else
	{
		sprite_index = spr_starOrb_pedestal_empty;
		image_speed = 0;
		activate_script = -1;
	}
}
}
//
//
//
//
//
//Star orb Text
function StarOrbPedestalText(){
//Set
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
	text_string = "Star Orb Found!\nUse it to level up one of the Courier's stats." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
	
if (string_counter >= 1)
{
	text_string = ""
	string_counter = 0;
	obj_inventory.star_orb = obj_inventory.star_orb + 1;
	obj_inventory.starOrb_list[quest_num] = true;
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
