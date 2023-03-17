//Regaliare Menus
//
//
//
//
//
//Regliare Selected
function RegaliareSelected(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(114,46,obj_inventory.form_grid[# obj_player.form, 0],.6,.6,0);
draw_text_transformed(76,113,"EQUIP",.35,.35,0);
draw_text_transformed(120,113,"SWITCH",.35,.35,0);
draw_text_transformed(120,113,"LEVEL",.35,.35,0);
draw_set_color(c_white);
draw_text_transformed(113,46,obj_inventory.form_grid[# obj_player.form, 0],.6,.6,0);
draw_text_transformed(75,113,"EQUIP",.35,.35,0);
draw_text_transformed(152,113,"SWITCH",.35,.35,0);
draw_text_transformed(152,113,"LEVEL",.35,.35,0);



////Draw Selected Form Menu Sprites (Right Hand Side) //Drawn Regardless if form is selected
//draw_sprite_stretched(spr_menu_circle16,1,70,42,32,32);
//draw_sprite_stretched(spr_menu,3,70,63,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,70,76,32,32);
//draw_sprite_stretched(spr_menu,3,70,97,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,162,42,32,32);
//draw_sprite_stretched(spr_menu,3,162,63,32,11);
//draw_sprite_stretched(spr_menu_circle16,1,162,76,32,32);
//draw_sprite_stretched(spr_menu,3,162,97,32,11);
//draw_sprite_stretched(spr_menu,3,70,110,90,16);
//draw_sprite_stretched(spr_menu,3,162,110,32,16);
//draw_sprite_stretched(spr_menu,3,196,110,32,16);

////Draw the selected form

////Draw it's four levelable features //weapon, armor, magic, special
draw_sprite(spr_armor_allGame,0,63,62);
draw_sprite(spr_weapons_allGame,0,106,62);
draw_sprite(spr_magic_allGame,0,63,85);
if (obj_inventory.form_grid[# 0, 8] > 0) draw_sprite(spr_special_allGame,0,106,85);
//draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 5]-1,70,63);
//draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 6]-1,70,97);
//draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 7]-1,162,63);
//if (obj_inventory.form_grid[# 0, 8] > 0)  draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 8]-1,162,97);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_text_transformed(115,118,"REGALIARE",.35,.35,0);
//draw_text_transformed(178,118,"EQUIP",.35,.35,0);
//draw_text_transformed(212,118,"BACK",.35,.35,0);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//var _weaponText = "WEAPON: L-CLICK\nA quick slash that does\n" + string(obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])) + " damage per hit.\nCan hit multiple targets."
//draw_text_transformed(104,42,_weaponText,.35,.35,0);
//var _armorText = "ARMOR: PASSIVE\nBlock " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6] -1))) + " incoming\ndamage."
//draw_text_transformed(104,76,_armorText,.35,.35,0);
//var _magicText = "MAGIC: R-CLICK\nRapidly fire small\ngolden projectiles that\nbreak on inpact and deal\n" + string(round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5))) + " damage per hit."
//draw_text_transformed(196,42,_magicText,.35,.35,0);
//var _specialText = "SPECIAL: SHIFT\n2 gold arcs that\nspin around the player,\ndealing " + string(obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8] - 1))) + " damage\nper hit with knockback."
//if (obj_inventory.form_grid[# 0, 8] > 0) draw_text_transformed(196,76,_specialText,.35,.35,0);



////Equip the form
//if (point_in_rectangle(_mouseX,_mouseY,162,110,194,126))
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		with (obj_player) 
//		{
//			form = 0;
//			script_execute(obj_inventory.form_grid[# form, 2]);
//		}
//	}
//}
////Return to Select
//if (point_in_rectangle(_mouseX,_mouseY,196,110,228,126))
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,194,108,36,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		inv_gui = FormMenuGUI;
//	}
//}

}
//
//
//
//
//
//Draw Regaliare's Sword Upgrade at Smith NPC's
function DrawRegaliareSlashUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Regal Blade",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 6, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 3;
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,15,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])
var _damage1 = obj_player.might + (11 * (obj_inventory.form_grid[# 0, 5]+1))
var _weaponExplain = "Level " + string(obj_inventory.form_grid[# 0, 5]) + ": " + string(_damage) + " > Level " + string(_damage1);
draw_text_transformed(141,44,_weaponExplain,.5,.5,0);
draw_set_halign(fa_center);
//damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])

}
//
//
//
//
//
//Draw Regaliare's Armor Upgrade at Smith NPC's
function DrawRegaliareArmorUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Armor",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 6, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 6]) + ": " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6] -1))) + " > Level " + string(obj_inventory.form_grid[# 0, 6] + 1) + ": " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6])));
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//obj_player.armor = 6 + (12 * (obj_inventory.form_grid[# 0, 6] -1))
}
//
//
//
//
//
//Draw Regaliare's Magic Upgrade at Browi NPC
function DrawRegaliareMagicUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Gold Seed",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 7])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,2,5))
				{
					if (ItemCheckQuantity(obj_inventory,9,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 5);
						ItemRemove(obj_inventory, 9, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,2,94,90,16,16);
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _damage = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));
var _damage1 = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7])*(5));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 7]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 7] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Draw Regaliare Special Upgrade at Browi NPC
function DrawRegaliareSpecialUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Gold Arc",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 8])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,9,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 9, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,94,90,16,16);
		draw_text_transformed(112,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _damage = obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8] - 1));
var _damage1 = obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8]));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 8]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 8] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}