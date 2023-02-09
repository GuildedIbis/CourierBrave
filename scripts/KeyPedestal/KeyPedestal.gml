//Key Pedestal 2
//
//
//
//
//
//Key Pedestal 2 Create
function KeyPedestal2Create(){
entity_step = KeyPedestal2Step;
sound = snd_text01;
}
//
//
//
//
//
//Key Pedestal 2 Step
function KeyPedestal2Step(){
sprite_index = spr_activator_key2;
}
//
//
//
//
//
//Key Pedestal 2 Text
function KeyPedestal2HabrafText(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);


//Draw Based on String Counter
var _SubString
if (obj_inventory.quest_grid[# 8, 1] < 2)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "It looks like it needs two keys." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
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
	draw_set_font(fnt_text);
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black);
	draw_text_transformed(69,140,_SubString,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(68,140,_SubString,.5,.5,0);
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}


if (obj_inventory.quest_grid[# 8, 1] >= 2)
{
	if (string_counter = 0)
	{
		speaker = 1;
		text_string = "The door opened." 
		_SubString = string_copy(text_string,1,letter_counter);
		draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
	}

	if (string_counter >= 1)
	{
		text_string = ""
		string_counter = 0;
		obj_inventory.quest_grid[# 8, 1] = 3;
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
	draw_sprite(spr_npc_nisma36,0,258+6,136+6);
}
}