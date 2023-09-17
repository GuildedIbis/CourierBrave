//Halofire Menus
//
//
//
//
//
//Halofire Selected Menu
function scr_menu_halofire(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _scriptList = array_create(4,-1)
_scriptList[0] = scr_menu_halofire_armor;
_scriptList[1] = scr_menu_halofire_weapon;
_scriptList[2] = scr_menu_halofire_primary;
_scriptList[3] = scr_menu_halofire_special;

//Right-hand Menu and Buttons
draw_sprite(spr_menu_rope,3,176,77);
draw_sprite(spr_menu_rope,3,262,77);
draw_sprite(spr_menu_rope,3,176,99);
draw_sprite(spr_menu_rope,3,262,99);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,44);
draw_sprite_stretched(spr_menu_beveled,3,166,85,110,16);
draw_sprite_stretched(spr_menu_beveled,3,166,107,110,16);
draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
draw_sprite_stretched(spr_menu_beveled,3,226,127,24,16);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_sprite_stretched(spr_menu_circle16,3,167,127,50,16);

//Title
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(101,39,"HALOFIRE",1,1,0);

for (var i = 0; i < 4; i = i + 1)
{
	var _originX = 50 + (26 * i);
	var _originY = 53;
	if (point_in_rectangle(_mouseX,_mouseY,_originX,_originY,_originX+21,_originY+21))
	{
		draw_sprite_stretched(spr_highlight_circle,1,_originX-1,_originY-1,23,23)
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			selected_info = _scriptList[i];
		
		}
	}
}



//Draw Right Hand Menu
if (selected_info != -1)
{
	script_execute(selected_info)
}
else
{
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(222,39,"SELECT A SKILL",1,1,0);
	draw_text_transformed(222,56,"SKILL DESCRIPTION",.5,.5,0); 
	draw_text_transformed(222,91,"LEVEL",.5,.5,0); 
	draw_text_transformed(222,112,"VALUE",.5,.5,0);
}
}//
//
//
//
//
//Draw Halofire Hamaxe Menu in Inventory
function scr_menu_halofire_weapon(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _lvlY = 91;
var _statY = 112;
var _buttonY = 127;

//Main Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _level = "Level: " + string(obj_inventory.form_grid[# 1, 5]) + " > " + string(obj_inventory.form_grid[# 1, 5]+1);
var _stat = "Damage: " + string(38 + (8 * obj_player.might) + (7 * obj_inventory.form_grid[# 1, 5])) + " > " + string(38 + (8 * obj_player.might) + (7 * obj_inventory.form_grid[# 1, 5]+1));
var _title = "HAMAXE";
var _describe = "A slow swinging axe that does\nhigh damage and knockback.";
draw_text_transformed(_midX,_titleY,_title,1,1,0);
draw_text_transformed(_midX,_descY,_describe,.5,.5,0); 
draw_text_transformed(_midX,_lvlY,_level,.5,.5,0); 
draw_text_transformed(_midX,_statY,_stat,.5,.5,0);
	
	
//Level	
switch (obj_inventory.form_grid[# 1, 5])
{
	case 0:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.ps_array[0] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 5] = 1;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
						obj_inventory.ps_array[0] = obj_inventory.ps_array[0] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,0,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"1\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[0])+")",.5,.5,0);
	break;
	
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 2) and (obj_inventory.ps_array[1] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 5] = 1;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 2;
						obj_inventory.ps_array[1] = obj_inventory.ps_array[1] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,1,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"2\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[1])+")",.5,.5,0);	
	break;
}


}
//
//
//
//
//
//Draw Halofire Fireward Armor Menu in Inventory
function scr_menu_halofire_armor(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _lvlY = 91;
var _statY = 112;
var _buttonY = 127;

//Main Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _level = "Level: " + string(obj_inventory.form_grid[# 1, 6]) + " > " + string(obj_inventory.form_grid[# 1, 6]+1);
var _stat = "Negates: " + string(7 + (4 * (obj_inventory.form_grid[# 1, 6]))) + " > " + string(7 + (4 * (obj_inventory.form_grid[# 1, 6]+1)));
var _title = "FIREWARD TUNIC";
var _describe = "A warded tunic that blocks a\nlow amount of damage.";
draw_text_transformed(_midX,_titleY,_title,1,1,0);
draw_text_transformed(_midX,_descY,_describe,.5,.5,0); 
draw_text_transformed(_midX,_lvlY,_level,.5,.5,0); 
draw_text_transformed(_midX,_statY,_stat,.5,.5,0);
	
	
//Level	
switch (obj_inventory.form_grid[# 1, 6])
{
	case 0:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.ps_array[0] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 6] = 1;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
						obj_inventory.ps_array[0] = obj_inventory.ps_array[0] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,0,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"1\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[0])+")",.5,.5,0);
	break;
	
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 2) and (obj_inventory.ps_array[1] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 6] = 2;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 2;
						obj_inventory.ps_array[1] = obj_inventory.ps_array[1] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,0,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,1,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"2\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[1])+")",.5,.5,0);	
	break;
}

}
//
//
//
//
//
//Draw Halofire Meteor Menu in Inventory
function scr_menu_halofire_primary(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _lvlY = 91;
var _statY = 112;
var _buttonY = 127;

//Main Text
if (page = 0)
{
	//Main Text
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	var _level = "Level: " + string(obj_inventory.form_grid[# 1, 7]) + " > " + string(obj_inventory.form_grid[# 1, 7]+1);
	var _stat = "Damage: " + string(30 + (16 * obj_player.grace) + ((obj_inventory.form_grid[# 1, 7])*(14))) + " > " + string(30 + (16 * obj_player.grace) + ((obj_inventory.form_grid[# 1, 7] + 1)*(14)));
	var _title = "METEOR SLING";
	var _describe = "Slowly fire meteors that have low\naccuracy but deal high damage.";
	draw_text_transformed(_midX,_titleY,_title,1,1,0);
	draw_text_transformed(_midX,_descY,_describe,.5,.5,0); 
	draw_text_transformed(_midX,_lvlY,_level,.5,.5,0); 
	draw_text_transformed(_midX,_statY,_stat,.5,.5,0);
}
if (page = 1)
{
	//Main Text
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	var _level = "Level: " + string(obj_inventory.form_grid[# 1, 7]) + " > " + string(obj_inventory.form_grid[# 1, 7]+1);
	var _stat = "Damage: " + string(3 + obj_player.grace + ((obj_inventory.form_grid[# 1, 7]))) + " > " + string(3 + obj_player.grace + ((obj_inventory.form_grid[# 1, 7]+1)));
	var _title = "FIRE SPIT";
	var _describe = "Rapidly spit flames that linger for\na brief period, and leave\nthe target burned";

	draw_text_transformed(_midX,_titleY,_title,1,1,0);
	draw_text_transformed(_midX,_descY,_describe,.5,.5,0); 
	draw_text_transformed(_midX,_lvlY,_level,.5,.5,0); 
	draw_text_transformed(_midX,_statY,_stat,.5,.5,0);
}

//Alt Magic
if (obj_inventory.quest_grid[# 15, 3] = true)
{
	draw_sprite_stretched(spr_menu_circle16,3,277,55,16,16);
	if (page = 0) draw_sprite_ext(spr_primaryAlt_allGame,1,269,55,1,1,0,c_white,1);
	if (page = 1) draw_sprite_ext(spr_primary_allGame,1,269,55,1,1,0,c_white,1);
	if (point_in_rectangle(_mouseX,_mouseY,277,55,293,71))
	{
		draw_sprite_stretched(spr_highlight_circle,0,276,54,18,18)
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
switch (obj_inventory.form_grid[# 1, 7])
{
	case 0:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.ps_array[0] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 7] = 1;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
						obj_inventory.ps_array[0] = obj_inventory.ps_array[0] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,0,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"1\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[0])+")",.5,.5,0);
	break;
	
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 2) and (obj_inventory.ps_array[1] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 7] = 2;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 2;
						obj_inventory.ps_array[1] = obj_inventory.ps_array[1] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,1,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"2\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[1])+")",.5,.5,0);	
	break;
}
}
//
//
//
//
//
//Draw Halofire Special Menu in Inventory
function scr_menu_halofire_special(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
var _midX = 222;
var _leftX = 167;
var _titleY = 39;
var _descY = 56;
var _lvlY = 91;
var _statY = 112;
var _buttonY = 127;

//Main Text
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _level = "Level: " + string(obj_inventory.form_grid[# 1, 8]) + " > " + string(obj_inventory.form_grid[# 1, 8]+1);
var _stat = "Damage: " + string(10 + (3 * obj_player.divinity) + (3 * obj_inventory.form_grid[# 3, 8])) + " > " + string(10 + (3 * obj_player.divinity) + (3 * obj_inventory.form_grid[# 3, 8]+1));
var _title = "FLAMESEED TURRET";
var _describe = "Summon a flame seed that fires randomly\nor selects a traget when in range.";
draw_text_transformed(_midX,_titleY,_title,1,1,0);
draw_text_transformed(_midX,_descY,_describe,.5,.5,0); 
draw_text_transformed(_midX,_lvlY,_level,.5,.5,0); 
draw_text_transformed(_midX,_statY,_stat,.5,.5,0);
	
	
//Level	
switch (obj_inventory.form_grid[# 1, 8])
{
	case 0:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 1) and (obj_inventory.ps_array[0] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 8] = 1;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 1;
						obj_inventory.ps_array[0] = obj_inventory.ps_array[0] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,0,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,0,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"1\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[0])+")",.5,.5,0);
	break;
	
	case 1:
		//draw large weapon sprite
		//draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY-1,52,18)
			if (mouse_check_button_pressed(mb_left))
			{
				if (obj_inventory.rog_array[1] >= 2) and (obj_inventory.ps_array[1] >= 1)
				{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 8] = 2;
						obj_inventory.rog_array[1] = obj_inventory.rog_array[1] - 2;
						obj_inventory.ps_array[1] = obj_inventory.ps_array[1] - 1;
				}
			}
		}

		draw_sprite_stretched(spr_rog_all,1,234,127,16,16);
		draw_sprite_stretched(spr_powerstone_all,1,260,127,16,16);
		draw_set_halign(fa_center);
		draw_text_transformed(_leftX + 25,_buttonY + 5,"LEVEL UP",.5,.5,0);
		draw_set_halign(fa_right);
		draw_text_transformed(235,133,"2\n("+ string(obj_inventory.rog_array[1])+")",.5,.5,0);
		draw_text_transformed(263,133,"1\n("+ string(obj_inventory.ps_array[1])+")",.5,.5,0);	
	break;
}
}
