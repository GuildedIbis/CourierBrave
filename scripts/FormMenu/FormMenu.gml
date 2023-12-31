//Inventory Scripts
//
//
//
//
//
//Form Array
function scr_inventory_form_create(){
form_grid = ds_grid_create(18,9);
form_stone_list = array_create(18, false);
skill_stone_list = array_create(72, false);
form_stone_list[0] = true;
form_stone = array_create(6,0);
skill_stone = array_create(6,0);

//Regaliare 
form_grid[# 0, 0] = "REGALIARE"
form_grid[# 0, 1] = Idle;
form_grid[# 0, 2] = scr_player_regaliare_set; //Set Script
form_grid[# 0, 3] = scr_menu_skills_regaliare;
form_grid[# 0, 4] = true; //Unlocked Status
form_grid[# 0, 5] = false; 
form_grid[# 0, 6] = false; 
form_grid[# 0, 7] = false; 
form_grid[# 0, 8] = false; 

//Halofire
form_grid[# 1, 0] = "HALOFIRE"
form_grid[# 1, 1] = scr_menu_skills_halofire_unlock;
form_grid[# 1, 2] = scr_player_halofire_set; //Player Script
form_grid[# 1, 3] = scr_menu_skills_halofire; //Inventory Script
form_grid[# 1, 4] = false; //Unlocked Status
form_grid[# 1, 5] = false; 
form_grid[# 1, 6] = false; 
form_grid[# 1, 7] = false; 
form_grid[# 1, 8] = false; 

//Adavoid
form_grid[# 2, 0] = "ADAVIO"
form_grid[# 2, 1] = scr_menu_skills_adavio_unlock;
form_grid[# 2, 2] = scr_player_adavio_set; //Player Script
form_grid[# 2, 3] = scr_menu_skills_adavio; //Inventory Script
form_grid[# 2, 4] = false; //Unlocked Status
form_grid[# 2, 5] = false; 
form_grid[# 2, 6] = false; 
form_grid[# 2, 7] = false; 
form_grid[# 2, 8] = false; 

//Ceriver
form_grid[# 3, 0] = "CERIVER"
form_grid[# 3, 1] = scr_menu_skills_ceriver_unlock;
form_grid[# 3, 2] = scr_player_ceriver_set; //Player Script
form_grid[# 3, 3] = scr_menu_skills_ceriver; //Inventory Script
form_grid[# 3, 4] = false; //Unlocked Status
form_grid[# 3, 5] = false; 
form_grid[# 3, 6] = false; 
form_grid[# 3, 7] = false; 
form_grid[# 3, 8] = false; 

//Evarel
form_grid[# 4, 0] = "EVAREL"
form_grid[# 4, 1] = scr_menu_skills_evarel_unlock;
form_grid[# 4, 2] = scr_player_evarel_set; //Player Script
form_grid[# 4, 3] = scr_menu_skills_evarel; //Inventory Script
form_grid[# 4, 4] = false; //Unlocked Status
form_grid[# 4, 5] = false; 
form_grid[# 4, 6] = false; 
form_grid[# 4, 7] = false; 
form_grid[# 4, 8] = false; 

}
//
//
//
//
//
//Draw Switch Menu
function scr_menu_form_switch(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _rowLength = 6;
draw_sprite_stretched(spr_menu_beveled,3,87,35,146,98);
draw_sprite_stretched(spr_menu,8,82,35,156,16);

draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(159,39,"SELECT A FORM",1,1,0);


//Button Mechanics
for (var i = 0; i < 18; i = i + 1)
{
	var _x2 = 92 + (i mod _rowLength) * 23;
	var _y2 = 52 + (i div _rowLength) * 26;
	draw_sprite_stretched(spr_menu_circle16,1,_x2,_y2,21,24)
	if (obj_inventory.form_grid[# i, 4] = true) 
	{
		draw_sprite(spr_formSelect_icons,i,_x2 + 10,_y2 + 13);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+21,_y2+24))
		{
			draw_sprite_stretched_ext(spr_highlight_circle,1,_x2-1,_y2-1,23,26,c_white,1.0)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				inv_gui = obj_inventory.form_grid[# i, 3];
				selected_info = -1;
				slot = i;
			}
		}
	}
	if (obj_inventory.form_grid[# i, 4] = false) and (form_stone[i mod 6] > 0)
	{
		draw_sprite(spr_formSelect_icons,i,_x2 + 10,_y2 + 13);
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+21,_y2+24))
		{
			draw_sprite_stretched_ext(spr_highlight_circle,1,_x2-1,_y2-1,23,26,c_white,1.0)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				inv_gui = obj_inventory.form_grid[# i, 1];
				selected_info = -1;
				slot = i;
			}
		}
	}
	if (obj_inventory.form_grid[# i, 4] = false) and (form_stone[i mod 6] = 0)
	{
		draw_sprite(spr_lock,i,_x2 + 10,_y2 + 13);
		
	}
	
}

draw_sprite_stretched(spr_menu_beveled,3,87,135,146,20);
for (var i = 0; i < 6; i = i + 1)
{
	draw_sprite(spr_form_stones_all,i,100+(23*i),146);
	draw_text_transformed(106+(23*i),144,string(form_stone[i]),.5,.5,0);
}


}


