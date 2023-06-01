//Evarel Menus
//
//
//
//
//
//Evarel Selected Menu
function EvarelSelectedMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Skill Select Buttons Mechanics
if (point_in_rectangle(_mouseX,_mouseY,69,62,89,82))//Armor Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,68,61,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = EvarelForestTunicMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,112,62,132,82))//Weapon Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,111,61,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = EvarelDaggerDashMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,85,89,105))//Magic Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,68,84,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = EvarelBristlerodMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,112,85,132,105)) and (obj_inventory.form_grid[# 1, 8] > 0)//Special Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,111,84,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = EvarelThornriseMenu;
		
	}
}

//Button Text
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(114,46,"EVAREL",.6,.6,0);
if (obj_player.cursed = false) draw_text_transformed(90,113,"EQUIP",.35,.35,0);
else draw_text_transformed(90,113,"CURSED",.35,.35,0);
draw_text_transformed(178,113,"LEVEL",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(113,46,"EVAREL",.6,.6,0);
if (obj_player.cursed = false) draw_text_transformed(89,113,"EQUIP",.35,.35,0);
else draw_text_transformed(89,113,"CURSED",.35,.35,0);
draw_text_transformed(177,113,"LEVEL",.35,.35,0);

//Skills sprites
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 4, 6],89,67);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 4, 5],132,67);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 4, 7],89,90);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 4, 8],132,90);
draw_sprite_stretched(spr_menu_circle16,1,69,62,20,20);
draw_sprite_stretched(spr_menu_circle16,1,112,62,20,20)
draw_sprite_stretched(spr_menu_circle16,1,69,85,20,20)
draw_sprite_stretched(spr_menu_circle16,1,112,85,20,20)
draw_sprite(spr_armor_allGame,4,63,61);
draw_sprite(spr_weapons_allGame,4,106,62);
draw_sprite(spr_magic_allGame,4,63,85);
draw_sprite(spr_special_allGame,4,106,85);


//Draw Right Hand Menu
if (selected_info != -1) script_execute(selected_info)

}//
//
//
//
//
//Draw Evarel Weapon Menu in Inventory
function EvarelDaggerDashMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _damage = string(obj_player.might + (7 * obj_inventory.form_grid[# 4, 5]));
var _cost = string(30);
draw_set_color(c_black);
draw_text_transformed(167,46,"DAGGER DASH",.5,.5,0);
draw_text_transformed(167,56,"A quick short dash in a staight line\nthat deals " + _damage + " for" + _cost + "stamina\nper dash.",.35,.35,0); 
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"DAGGER DASH",.5,.5,0);
draw_text_transformed(166,56,"A quick short dash in a staight line\nthat deals " + _damage + " for" + _cost + "stamina\nper dash.",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 4, 5])
{
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,107,78,10,7);
		//draw_sprite_stretched(spr_menu,3,107,95,10,7);
		//draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,196,108,16,16);
		draw_text_transformed(209,121,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,214,108,16,16);
		draw_text_transformed(227,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,11,5)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 5] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 10, 5);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,124,78,10,7);
		//draw_sprite_stretched(spr_menu,3,124,95,10,7);
		//draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,11,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);	
	break;
}


}
//
//
//
//
//
//Draw Evarel Armor Menu in Inventory
function EvarelForestTunicMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _armor = string(9 + (5 * (obj_inventory.form_grid[# 4, 6] -1)));
draw_set_color(c_black);
draw_text_transformed(167,46,"FOREST TUNIC",.5,.5,0);
draw_text_transformed(167,56,"A tough green tunic that negates\n" + _armor + "damage of every hit taken.",.35,.35,0);  
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"FOREST TUNIC",.5,.5,0);
draw_text_transformed(166,56,"A tough green tunic that negates\n" + _armor + "damage of every hit taken.",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 4, 6])
{
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,107,78,10,7);
		//draw_sprite_stretched(spr_menu,3,107,95,10,7);
		//draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,196,108,16,16);
		draw_text_transformed(209,121,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,214,108,16,16);
		draw_text_transformed(227,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,11,5)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 6] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 10, 5);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,124,78,10,7);
		//draw_sprite_stretched(spr_menu,3,124,95,10,7);
		//draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,11,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);
	break;
}


}
//
//
//
//
//
//Draw Halofire Meteor Menu in Inventory
function EvarelBristlerodMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
if (page = 0)
{
	//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_text);
	var _damage = string(obj_player.grace + ((obj_inventory.form_grid[# 4, 7])));
	var _cost = string(20);
	draw_set_color(c_black);
	draw_text_transformed(167,46,"BRISTLEROD",.5,.5,0);
	draw_text_transformed(167,56,"A projectile that does more damage\nthe further it travels, starting at\n" + _damage + " and costing " + _cost + " charge each.\nFires after a .5 sec windup.",.35,.35,0);  
	//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
	//draw_text_transformed(167,95,_health,.35,.35,0); 
	draw_set_color(c_white);
	draw_text_transformed(166,46,"BRISTLEROD",.5,.5,0);
	draw_text_transformed(166,56,"A projectile that does more damage\nthe further it travels, starting at\n" + _damage + " and costing " + _cost + " charge each.\nFires after a .5 sec windup.",.35,.35,0); 
}
if (page = 1)
{
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_text);
	var _damage = string(round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5)));
	var _cost = string(10);
	draw_set_color(c_black);
	draw_text_transformed(167,46,"REFLEX THORN",.5,.5,0);
	draw_text_transformed(167,56,"A burst of three thorns that deal\n" + _damage + "damage and cost " + _cost + " charge each,\nand bounce off solid objects.",.35,.35,0);  
	//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
	//draw_text_transformed(167,95,_health,.35,.35,0); 
	draw_set_color(c_white);
	draw_text_transformed(166,46,"REFLEX THORN",.5,.5,0);
	draw_text_transformed(166,56,"A burst of three thorns that deal\n" + _damage + "damage and cost " + _cost + " charge each,\nand bounce off solid objects.",.35,.35,0); 
}

//Alt Magic
if (obj_inventory.quest_grid[# 13, 3] = true)
{
	draw_sprite_stretched(spr_menu,3,234,90,10,10);
	draw_text_transformed(236,90,"A",.5,.5,0);
	if (point_in_rectangle(_mouseX,_mouseY,234,90,244,100))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,232,88,14,14)
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_text02,global.volumeMenu,1);
			audio_play_sound(snd_text02,0,false);
			if (page = 0) page = 1;
			else page = 0;
		}
	}
}
else page = 0;

//Level	
switch (obj_inventory.form_grid[# 4, 7])
{
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,2,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 5);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,107,78,10,7);
		//draw_sprite_stretched(spr_menu,3,107,95,10,7);
		//draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,196,108,16,16);
		draw_text_transformed(209,121,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,2,214,108,16,16);
		draw_text_transformed(227,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,11,5)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 7] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 10, 5);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,124,78,10,7);
		//draw_sprite_stretched(spr_menu,3,124,95,10,7);
		//draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,11,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);
	break;
}


}
//
//
//
//
//
//Draw Halofire Special Menu in Inventory
function EvarelThornriseMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _damage = string(round(obj_player.grace/3) + (4 * (obj_inventory.form_grid[# 4, 8])));
draw_set_color(c_black);
draw_text_transformed(167,46,"THORN RISE",.5,.5,0);
draw_text_transformed(167,56,"Summon thorns in an area around\nthe courier, dealing " + _damage + "up to 4 times\na second",.35,.35,0);  
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"THORN RISE",.5,.5,0);
draw_text_transformed(166,56,"Summon thorns in an area around\nthe courier, dealing " + _damage + "up to 4 times\na second",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 4, 8])
{
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,15,5))
				{
					if (ItemCheckQuantity(obj_inventory,10,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 10, 1);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,107,78,10,7);
		//draw_sprite_stretched(spr_menu,3,107,95,10,7);
		//draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,196,108,16,16);
		draw_text_transformed(209,121,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,214,108,16,16);
		draw_text_transformed(227,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,161,108,193,124))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,159,106,36,20)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,11,5)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 4, 8] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 10, 5);
					}
				}
			}
		}
		//draw_sprite_stretched(spr_menu,3,124,78,10,7);
		//draw_sprite_stretched(spr_menu,3,124,95,10,7);
		//draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_item_box,1,196,108,16,16);
		draw_sprite_stretched(spr_item_box,1,214,108,16,16);
		draw_sprite_stretched(spr_item_box,1,232,108,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,11,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);	
	break;
}


}
