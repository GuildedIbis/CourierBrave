//Ceriver Menus
//
//
//
//
//
//Ceriver Unlock Menu GUI
function scr_menu_skills_ceriver_unlock(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Base and Title
draw_sprite_stretched(spr_menu_beveled,3,87,35,146,98);
draw_sprite_stretched(spr_menu,8,82,35,156,16);
draw_text_transformed(160,39,"UNLOCK CERIVER?",1,1,0);

//
//Skill Buttons
draw_sprite_stretched(spr_menu_circle16,1,95,53,21,21);
draw_sprite(spr_armor_allGame,3,90,52);
if (point_in_rectangle(_mouseX,_mouseY,95,53,116,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,94,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 0;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,130,53,21,21);
draw_sprite(spr_weapons_allGame,3,125,52);
if (point_in_rectangle(_mouseX,_mouseY,130,53,151,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,129,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 1;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,166,53,21,21);
draw_sprite(spr_primary_allGame,3,161,52);
if (point_in_rectangle(_mouseX,_mouseY,166,53,187,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,165,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 2;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,202,53,21,21);
draw_sprite(spr_special_allGame,3,197,52);
if (point_in_rectangle(_mouseX,_mouseY,202,53,223,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,201,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 3;
	}
}

//
//Upgrade Buttons
draw_sprite_stretched(spr_menu_circle16,1,95,76,21,16);
draw_sprite(spr_form_stones_all,3,106,85);
if (form_grid[# 3, 5] = false) draw_sprite(spr_lock,0,105,85)
if (point_in_rectangle(_mouseX,_mouseY,95,76,116,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,94,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 4;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,130,76,21,16);
draw_sprite(spr_form_stones_all,3,141,85);
if (form_grid[# 3, 6] = false) draw_sprite(spr_lock,0,140,85)
if (point_in_rectangle(_mouseX,_mouseY,130,76,151,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,129,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 5;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,166,76,21,16);
draw_sprite(spr_form_stones_all,3,177,85);
if (form_grid[# 3, 7] = false) draw_sprite(spr_lock,0,176,85)
if (point_in_rectangle(_mouseX,_mouseY,166,76,187,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,165,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 6;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,202,76,21,16);
draw_sprite(spr_form_stones_all,3,213,85);
if (form_grid[# 3, 8] = false) draw_sprite(spr_lock,0,212,85)
if (point_in_rectangle(_mouseX,_mouseY,202,76,223,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,201,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 7;
	}
}

//
//Select Stat Info
switch(page)
{
	case 0: 
		draw_set_halign(fa_left);
		var _describe = "Negates 10 damage from attacks\nand projectiles."
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"REGAL ARMOR",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 1:
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"REGAL BLADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 2: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"GOLD BURST",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 3: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"GOLD ARC",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 4: 
		draw_set_halign(fa_left);
		var _describe = "Gain 20 overshield that recharges\nwhile no enemies are targeting\nyou."
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"ARMOR UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 5: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"WEAPON UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 6: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"PRIMARY UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 7: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"SPECIAL UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
}
//
//Purchase
draw_set_halign(fa_center);
draw_sprite_stretched(spr_menu,8,197,94,24,16);
draw_sprite(spr_form_stones_all,3,213,103);
draw_text_transformed(206,101,string(form_stone[3]),.5,.5,0);
draw_sprite_stretched(spr_menu_circle16,1,193,112,32,16);
draw_text_transformed(209,115,"UNLOCK\nFORM",.5,.5,0);
if (point_in_rectangle(_mouseX,_mouseY,193,112,229,128))
{
	draw_sprite_stretched(spr_highlight_circle,0,192,111,34,18);
	if (mouse_check_button_pressed(mb_left))
	{
		quest_grid[# 9, 0] = true;
		quest_grid[# 9, 1] = 1;
		quest_grid[# 9, 3] = true;
		form_stone[3] = form_stone[3] - 1;
		form_grid[# 3, 4] = true;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = obj_inventory.form_grid[# 3, 3];
		slot = 3;
	}
}
}
//
//
//
//
//
//Ceriver Skills Menu GUI
function scr_menu_skills_ceriver(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Base and Title
draw_sprite_stretched(spr_menu_beveled,3,87,35,146,98);
draw_sprite_stretched(spr_menu,8,82,35,156,16);
draw_text_transformed(160,39,"CERIVER SKILLS",1,1,0);

//
//Skill Buttons
draw_sprite_stretched(spr_menu_circle16,1,95,53,21,21);
draw_sprite(spr_armor_allGame,3,90,52);
if (point_in_rectangle(_mouseX,_mouseY,95,53,116,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,94,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 0;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,130,53,21,21);
draw_sprite(spr_weapons_allGame,3,125,52);
if (point_in_rectangle(_mouseX,_mouseY,130,53,151,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,129,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 1;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,166,53,21,21);
draw_sprite(spr_primary_allGame,3,161,52);
if (point_in_rectangle(_mouseX,_mouseY,166,53,187,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,165,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 2;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,202,53,21,21);
draw_sprite(spr_special_allGame,3,197,52);
if (point_in_rectangle(_mouseX,_mouseY,202,53,223,75))
{
	draw_sprite_stretched(spr_highlight_circle,0,201,52,23,23);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 3;
	}
}

//
//Upgrade Buttons
draw_sprite_stretched(spr_menu_circle16,1,95,76,21,16);
draw_sprite(spr_form_stones_all,3,106,85);
if (form_grid[# 3, 5] = false) draw_sprite(spr_lock,0,105,85)
if (point_in_rectangle(_mouseX,_mouseY,95,76,116,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,94,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 4;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,130,76,21,16);
draw_sprite(spr_form_stones_all,3,141,85);
if (form_grid[# 3, 6] = false) draw_sprite(spr_lock,0,140,85)
if (point_in_rectangle(_mouseX,_mouseY,130,76,151,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,129,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 5;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,166,76,21,16);
draw_sprite(spr_form_stones_all,3,177,85);
if (form_grid[# 3, 7] = false) draw_sprite(spr_lock,0,176,85)
if (point_in_rectangle(_mouseX,_mouseY,166,76,187,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,165,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 6;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,202,76,21,16);
draw_sprite(spr_form_stones_all,3,213,85);
if (form_grid[# 3, 8] = false) draw_sprite(spr_lock,0,212,85)
if (point_in_rectangle(_mouseX,_mouseY,202,76,223,93))
{
	draw_sprite_stretched(spr_highlight_circle,0,201,75,23,18);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 7;
	}
}

//
//Select Stat Info
switch(page)
{
	case 0: 
		draw_set_halign(fa_left);
		var _describe = "Negates 10 damage from attacks\nand projectiles."
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"REGAL ARMOR",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 1:
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"REGAL BLADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 2: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"GOLD BURST",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 3: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"GOLD ARC",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 4: 
		draw_set_halign(fa_left);
		var _describe = "Gain 20 overshield that recharges\nwhile no enemies are targeting\nyou."
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"ARMOR UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 5: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"WEAPON UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 6: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"PRIMARY UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 7: 
		draw_set_halign(fa_left);
		var _describe = ""
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"SPECIAL UPGRADE",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
}

//
//Purchase
if (page >= 4) and (form_grid[# 3, page + 1] = false)
{
	draw_set_halign(fa_center);
	draw_sprite_stretched(spr_menu,8,197,94,24,16);
	draw_sprite(spr_form_stones_all,3,213,103);
	draw_text_transformed(206,101,string(skill_stone[3]),.5,.5,0);
	if (skill_stone[3] > 0)
	{
		draw_sprite_stretched(spr_menu_circle16,1,193,112,32,16);
		draw_text_transformed(209,115,"PURCHASE\nUPGRADE",.5,.5,0);
		if (point_in_rectangle(_mouseX,_mouseY,193,112,229,128))
		{
			draw_sprite_stretched(spr_highlight_circle,0,192,111,34,18);
			if (mouse_check_button_pressed(mb_left))
			{
				switch(page)
				{
					case 4: 
						skill_stone[3] = skill_stone[3] - 1;
						form_grid[# 3, 5] = true;
					break;
				
					case 5: 
						skill_stone[3] = skill_stone[3] - 1;
						form_grid[# 3, 6] = true;
						obj_player.weapon_count = obj_player.weapon_count + 1;
					break;
				
					case 6: 
						skill_stone[3] = skill_stone[3] - 1;
						form_grid[# 3, 7] = true;
					break;
					
					case 7: 
						skill_stone[3] = skill_stone[3] - 1;
						form_grid[# 3, 8] = true;
					break;
				}
			}
		}
	}
}
}