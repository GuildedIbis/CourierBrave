//Regaliare Menus
//
//
//
//
//
//Regaliare Selected Menu
function RegaliareSelectedMenu(){
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
		selected_info = RegaliareRegalArmorMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,112,62,132,82))//Weapon Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,111,61,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = RegaliareRegalBladeMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,85,89,105))//Magic Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,68,84,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = RegaliareGoldBurstMenu;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,112,85,132,105)) and (obj_inventory.form_grid[# 0, 8] > 0)//Special Skill
{
	draw_sprite_stretched(spr_highlight_circle,1,111,84,22,22)
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		selected_info = RegaliareGoldArcMenu;
		
	}
}
//Button Text
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(114,46,"REGALIARE",.6,.6,0);
draw_text_transformed(90,113,"EQUIP",.35,.35,0);
draw_text_transformed(178,113,"LEVEL",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(113,46,"REGALIARE",.6,.6,0);
draw_text_transformed(89,113,"EQUIP",.35,.35,0);
draw_text_transformed(177,113,"LEVEL",.35,.35,0);




//Skills sprites
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 5],89,67);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 6],132,67);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 7],89,90);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 8],132,90);
draw_sprite_stretched(spr_menu_circle16,1,69,62,20,20);
draw_sprite_stretched(spr_menu_circle16,1,112,62,20,20)
draw_sprite_stretched(spr_menu_circle16,1,69,85,20,20)
draw_sprite_stretched(spr_menu_circle16,1,112,85,20,20)
draw_sprite(spr_armor_allGame,0,63,61);
draw_sprite(spr_weapons_allGame,0,106,62);
draw_sprite(spr_magic_allGame,0,63,85);
if (obj_inventory.form_grid[# 0, 8] > 0) draw_sprite(spr_special_allGame,0,106,85);
else draw_sprite(spr_item_all,0,120,93);


//Draw Right Hand Menu
if (selected_info != -1) script_execute(selected_info)

}
//
//
//
//
//
//Draw Regal Blade Menu in Inventory
function RegaliareRegalBladeMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _damage = string(obj_player.might + (11 * obj_inventory.form_grid[# 0, 5]));
var _cost = string(20);
draw_set_color(c_black);
draw_text_transformed(167,46,"REGAL BLADE",.5,.5,0);
draw_text_transformed(167,56,"A fast swinging sword that does\n" + _damage + " damage per hit and costs\n" + _cost + " stamina per swing",.35,.35,0); 
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"REGAL BLADE",.5,.5,0);
draw_text_transformed(166,56,"A fast swinging sword that does\n" + _damage + " damage per hit and costs\n" + _cost + " stamina per swing",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 0, 5])
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
					if (ItemCheckQuantity(obj_inventory,3,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 3, 1);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
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
				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,3,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 3, 5);
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
		
		draw_sprite_stretched(spr_item_all,15,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);	
	break;
}


}
//
//
//
//
//
//Draw Regaliare's Armor Menu in Inventory
function RegaliareRegalArmorMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _armor = string(12 + (6 * (obj_inventory.form_grid[# 0, 6] -1)));
draw_set_color(c_black);
draw_text_transformed(167,46,"REGAL ARMOR",.5,.5,0);
draw_text_transformed(167,56,"Grey steel armor that negates " + _armor + "\ndamage of every hit taken.",.35,.35,0);  
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"REGAL ARMOR",.5,.5,0);
draw_text_transformed(166,56,"Grey steel armor that negates " + _armor + "\ndamage of every hit taken.",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 0, 6])
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
					if (ItemCheckQuantity(obj_inventory,3,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 3, 1);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
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
					if (ItemCheckQuantity(obj_inventory,3,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 3, 5);
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
		
		draw_sprite_stretched(spr_item_all,15,196,108,16,16);
		draw_text_transformed(209,121,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,214,108,16,16);
		draw_text_transformed(227,121,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);
	break;
}


}
//
//
//
//
//
//Draw Gold Burst Menu in Inventory
function RegaliareGoldBurstMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _damage = string(round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5)));
var _cost = string(5);
draw_set_color(c_black);
draw_text_transformed(167,46,"GOLD BURST",.5,.5,0);
draw_text_transformed(167,56,"Rapidly fire small golden projec-\ntiles that deal " + _damage + " and\ncost " + _cost + " charge each.",.35,.35,0);  
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"GOLD BURST",.5,.5,0);
draw_text_transformed(166,56,"Rapidly fire small golden projec-\ntiles that deal " + _damage + " and\ncost " + _cost + " charge each.",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 0, 7])
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
					if (ItemCheckQuantity(obj_inventory,3,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 5);
						ItemRemove(obj_inventory, 3, 1);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
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
					if (ItemCheckQuantity(obj_inventory,3,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 3, 5);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);
	break;
}


}
//
//
//
//
//
//Draw Gold Arc Menu in Inventory
function RegaliareGoldArcMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
//Main Text
//draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);
var _damage = string(round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 8]-1)*(5)));
draw_set_color(c_black);
draw_text_transformed(167,46,"GOLD ARCS",.5,.5,0);
draw_text_transformed(167,56,"Summon 2 golden arcs that encircle\nthe courier, granting them invicibility\nand dealing " + _damage + "on contact",.35,.35,0);  
//draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
//draw_text_transformed(167,95,_health,.35,.35,0); 
draw_set_color(c_white);
draw_text_transformed(166,46,"GOLD ARCS",.5,.5,0);
draw_text_transformed(166,56,"Summon 2 golden arcs that encircle\nthe courier, granting them invicibility\nand dealing " + _damage + "on contact",.35,.35,0); 

//Level	
switch (obj_inventory.form_grid[# 0, 8])
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
					if (ItemCheckQuantity(obj_inventory,3,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 3, 1);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
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
				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,3,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 3;
						ItemRemove(obj_inventory, 11, 5);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 3, 5);
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
		draw_sprite_stretched(spr_item_all,3,232,108,16,16);
		draw_text_transformed(245,121,"5",.35,.35,0);	
	break;
}


}
