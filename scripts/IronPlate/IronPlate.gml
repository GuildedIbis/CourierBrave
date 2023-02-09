//Iron Plate Armor
//
//
//
//
//
//Iron Plate Main
//function IronPlateMain(){
//with (obj_player)
//{
//	if (armor_main != IronPlateMain)
//	{
//		armor_main = IronPlateMain;
//		armor_id = 0;
	
//		idle_sprite = spr_player_ironPlate_idle;
//		run_sprite = spr_player_ironPlate_run;
//		roll_sprite = spr_player_ironPlate_roll;
//		crull_sprite = spr_player_ironPlate_crull;
//		jab_sprite = spr_player_ironPlate_jab;
//		slash_sprite = spr_player_ironPlate_slash;
//		castJab_sprite = spr_player_ironPlate_castJab;
//		castMagic_sprite = spr_player_ironPlate_castMagic;
//		castSlash_sprite = spr_player_ironPlate_castSlash;
//		castRun_sprite = spr_player_ironPlate_run_castMagic;

//		armor = 6 + (12 * (obj_inventory.armor_grid[# 0, 4] -1));
//	}
//}
//}
//
//
//
//
//
//Iron Plate Stats
//function DrawIronPlateStats(){
//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);

////Draw Armor
//var _armorStat = "ARMOR:  " + string(6 + (12 * (obj_inventory.armor_grid[# 0, 4] -1)));
//draw_set_color(c_black);
//draw_text_transformed(240,134,_armorStat,.5,.5,0);
//draw_set_color(c_white);
//draw_text_transformed(239,134,_armorStat,.5,.5,0);	
//////Draw Count
////var _countStat = "COUNT:  " + string(3 + round(obj_inventory.weapon_grid[# 0, 5]/2))
////draw_set_color(c_black);
////draw_text_transformed(240,144,_countStat,.5,.5,0);
////draw_set_color(c_white);
////draw_text_transformed(239,144,_countStat,.5,.5,0);	
//////Draw Speed
////var _speedStat = "SPEED:  " + string(1.00 + (obj_inventory.weapon_grid[# 0, 5]/20))
////draw_set_color(c_black);
////draw_text_transformed(240,154,_speedStat,.5,.5,0);
////draw_set_color(c_white);
////draw_text_transformed(239,154,_speedStat,.5,.5,0);	
//////Draw Recovery
////var _recoverStat = "RECOVERY:  " + string(60 - round(3 * obj_inventory.weapon_grid[# 0, 5]))
////draw_set_color(c_black);
////draw_text_transformed(240,164,_recoverStat,.5,.5,0);
////draw_set_color(c_white);
////draw_text_transformed(239,164,_recoverStat,.5,.5,0);	
//////Draw Recovery
////var _magicStat = "SPECIAL:  " + string(obj_player.might + obj_inventory.weapon_grid[# 0, 6] + (18 * obj_inventory.weapon_grid[# 0, 6]))
////draw_set_color(c_black);
////draw_text_transformed(240,174,_magicStat,.5,.5,0);
////draw_set_color(c_white);
////draw_text_transformed(239,174,_magicStat,.5,.5,0);	
//}
//
//
//
//
//
//Draw Iron Plate Upgrade
//function DrawIronPlateUpgrade(){
//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);

//draw_sprite_stretched(spr_menu,3,71,41,64,13);
//draw_sprite_stretched(spr_menu,3,137,41,96,13);
//draw_text_transformed(74,48,"Iron Plate",.5,.5,0);
//draw_set_halign(fa_center);
//if (page = 0) script_execute(IronPlateArmorUpgrade);
////if (page = 1) script_execute(FayaniBalanceUpgrade);
////if (page = 2) script_execute(FayaniGraceUpgrade);

//}
//
//
//
//
//
//Iron Plate Armor Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawKovaladMenu > _armorDraw = DrawIronPlateUpgrade
//function IronPlateArmorUpgrade(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);	





//switch (obj_inventory.armor_grid[# 0, 4])
//{
//	case 1:
//		//draw large weapon sprite
//		draw_sprite_stretched(spr_menu,1,95,61,14,54);
//		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
//		{
//			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
//			if (mouse_check_button_pressed(mb_left))
//			{
//				if (ItemCheckQuantity(obj_inventory,1,5)) and (ItemCheckQuantity(obj_inventory,5,1))
//				{
//					if (ItemCheckQuantity(obj_inventory,6,5))
//					{
//						audio_sound_gain(snd_text02,global.volumeMenu,1);
//						audio_play_sound(snd_text02,0,false);
//						obj_inventory.armor_grid[# 0, 4] = 2;
//						ItemRemove(obj_inventory, 1, 10);
//						ItemRemove(obj_inventory, 5, 10);
//						ItemRemove(obj_inventory, 6, 3);
//					}
//				}
//			}
//		}
//		draw_sprite_stretched(spr_menu,3,107,78,10,7);
//		draw_sprite_stretched(spr_menu,3,107,95,10,7);
//		draw_sprite_stretched(spr_menu,3,107,112,10,7);
//		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
//		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
//		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
//		//draw items and quantity needed
		
//		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
//		draw_text_transformed(112,82,"10",.35,.35,0);
//		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
//		draw_text_transformed(112,99,"10",.35,.35,0);
//		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
//		draw_text_transformed(112,116,"3",.35,.35,0);	
//	break;
	
//	case 2:
//		//draw large weapon sprite
//		draw_sprite_stretched(spr_menu,1,112,61,14,54);
//		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
//		{
//			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
//			if (mouse_check_button_pressed(mb_left))
//			{
//				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
//				{
//					if (ItemCheckQuantity(obj_inventory,15,5))
//					{
//						audio_sound_gain(snd_text02,global.volumeMenu,1);
//						audio_play_sound(snd_text02,0,false);
//						obj_inventory.armor_grid[# 0, 4] = 2;
//						ItemRemove(obj_inventory, 15, 5);
//						ItemRemove(obj_inventory, 15, 1);
//						ItemRemove(obj_inventory, 15, 5);
//					}
//				}
//			}
//		}
//		draw_sprite_stretched(spr_menu,3,124,78,10,7);
//		draw_sprite_stretched(spr_menu,3,124,95,10,7);
//		draw_sprite_stretched(spr_menu,3,124,112,10,7);
//		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
//		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
//		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
//		//draw items and quantity needed
		
//		draw_sprite_stretched(spr_item_all,15,111,73,16,16);
//		draw_text_transformed(129,82,"5",.35,.35,0);
//		draw_sprite_stretched(spr_item_all,15,111,90,16,16);
//		draw_text_transformed(129,99,"1",.35,.35,0);
//		draw_sprite_stretched(spr_item_all,15,111,107,16,16);
//		draw_text_transformed(129,116,"5",.35,.35,0);	
//	break;
//}
//for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
//{
//	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
//	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
//	else draw_text_transformed(238,64,"10",.75,.75,0);
//}
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
//var _armorExplain = "Level " + string(obj_inventory.armor_grid[# 0, 4]) + ": " + string(6 + (12 * (obj_inventory.armor_grid[# 0, 4] -1))) + " > Level " + string(obj_inventory.armor_grid[# 0, 4] + 1) + ": " + string(6 + (12 * (obj_inventory.armor_grid[# 0, 4])));
//draw_text_transformed(141,44,_armorExplain,.5,.5,0);
//draw_set_halign(fa_center);
//}