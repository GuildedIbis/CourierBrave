//Stats Menu
//
//
//
//
//
//Stats Menu GUI
function StatsMenuGUI(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);


//Buttons
draw_sprite_stretched(spr_menu_beveled,3,69,42,90,28);
draw_sprite_stretched(spr_menu_beveled,3,161,42,90,64);
draw_sprite_stretched(spr_menu,3,69,72,90,16);
draw_sprite_stretched(spr_menu,3,69,90,90,16);
draw_sprite_stretched(spr_menu,3,69,108,90,16);


//Button Mechanics
if (point_in_rectangle(_mouseX,_mouseY,69,72,159,88))//Vitality
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,70,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 0;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,90,159,106))//Might
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,88,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 1;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,108,159,124))//Grace
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,106,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 2;
		
	}
}

//Button Text
var _vitalityTitle = "VITALITY | LVL: " + string(obj_player.vitality);
var _mightTitle = "MIGHT | LVL: " + string(obj_player.might);
var _graceTitle = "GRACE | LVL: " + string(obj_player.grace);
draw_text_transformed(75,77,_vitalityTitle,.35,.35,0);
draw_text_transformed(75,95,_mightTitle,.35,.35,0);
draw_text_transformed(75,113,_graceTitle,.35,.35,0);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(114,46,"COURIER\nSTATS",.6,.6,0);
draw_set_color(c_white);
draw_text_transformed(113,46,"COURIER\nSTATS",.6,.6,0);

//Draw Vitality
if (page = 0)
{
	
	//Main Text
	draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_text);
	var _vitLevel = "Level: " + string(obj_player.vitality) + " > " + string(obj_player.vitality+1);
	var _health = "Max health: " + string(150 + (3* ((obj_player.vitality) + round((obj_player.vitality)/15)))) + ">" + string(150 + (3* ((obj_player.vitality + 1) + round((obj_player.vitality+1)/15))));
	draw_set_color(c_black);
	draw_text_transformed(167,46,"VITALITY",.5,.5,0);
	draw_text_transformed(167,56,"Increases max health.\nBase health 150.",.35,.35,0); 
	draw_text_transformed(167,87,_vitLevel,.35,.35,0); 
	draw_text_transformed(167,95,_health,.35,.35,0); 
	draw_set_color(c_white);
	draw_text_transformed(166,46,"VITALITY",.5,.5,0);
	draw_text_transformed(166,56,"Increases max health.\nBase health 150.",.35,.35,0); 
	draw_text_transformed(166,87,_vitLevel,.35,.35,0); 
	draw_text_transformed(166,95,_health,.35,.35,0);
	
	//Cost Button
	draw_sprite_stretched(spr_menu,3,161,108,90,16);
	draw_sprite(spr_bean,0,243,117)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(167,113,"Level up:",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(166,113,"Level up:",.35,.35,0);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var _cost = (obj_player.vitality * round(obj_player.vitality/2)) + obj_player.might + obj_player.grace;
	draw_set_color(c_black);
	draw_text_transformed(235,113,_cost,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(234,113,_cost,.35,.35,0);
	if (point_in_rectangle(_mouseX,_mouseY,161,108,251,124))//Level
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,159,106,94,20);
		if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			obj_player.beans = obj_player.beans - _cost;
			obj_player.vitality = obj_player.vitality + 1;
			obj_player.max_hp = 150 + (3* (obj_player.vitality + round(obj_player.vitality/15)));
			
		
		}
	}
}

//Draw Might
if (page = 1)
{

	//Main Text
	draw_sprite_stretched(spr_menu_player_stat,1,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_text);
	var _mitLevel = "Level: " + string(obj_player.might) + " > " + string(obj_player.might+1);
	var _health = "Max stamina: " + string(50 + (3* (obj_player.might + round(obj_player.might/15)))) + ">" + string(50 + (3* ((obj_player.might + 1) + round((obj_player.might+1)/15))));
	draw_set_color(c_black);
	draw_text_transformed(167,46,"MIGHT",.5,.5,0);
	draw_text_transformed(167,56,"Increases max stamina. Slightly\nincreases damage of weapon skills.\nBase stamina 50.",.35,.35,0); 
	draw_text_transformed(167,87,_mitLevel,.35,.35,0); 
	draw_text_transformed(167,95,_health,.35,.35,0); 
	draw_set_color(c_white);
	draw_text_transformed(166,46,"MIGHT",.5,.5,0);
	draw_text_transformed(166,56,"Increases max stamina. Slightly\nincreases damage of weapon skills.\nBase stamina 50.",.35,.35,0);  
	draw_text_transformed(166,87,_mitLevel,.35,.35,0); 
	draw_text_transformed(166,95,_health,.35,.35,0);
	
	//Cost Button
	draw_sprite_stretched(spr_menu,3,161,108,90,16);
	draw_sprite(spr_bean,0,243,117)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(167,113,"Level up:",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(166,113,"Level up:",.35,.35,0);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var _cost = (obj_player.might * round(obj_player.might/2)) + obj_player.vitality + obj_player.grace;
	draw_set_color(c_black);
	draw_text_transformed(235,113,_cost,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(234,113,_cost,.35,.35,0);
	if (point_in_rectangle(_mouseX,_mouseY,161,108,251,124))//Level
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,159,106,94,20);
		if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			obj_player.beans = obj_player.beans - _cost;
			obj_player.might = obj_player.might + 1;
			obj_player.max_stamina = 50 + (3* (obj_player.might + round(obj_player.might/15)));
			obj_player.stamina = obj_player.max_stamina;
			
		
		}
	}
}

//Draw Grace
if (page = 2)
{
	//Main Text
	draw_sprite_stretched(spr_menu_player_stat,2,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_text);
	var _grcLevel = "Level: " + string(obj_player.grace) + " > " + string(obj_player.grace+1);
	var _charge = "Max charge: " + string(100 + (obj_player.grace + round(obj_player.grace/15))) + ">" + string(100 + ((obj_player.grace + 1) + round((obj_player.grace+1)/15)));
	draw_set_color(c_black);
	draw_text_transformed(167,46,"GRACE",.5,.5,0);
	draw_text_transformed(167,56,"Increases max charge. Slightly\nincreases damage of magic skills.\nBase charge 100.",.35,.35,0); 
	draw_text_transformed(167,87,_grcLevel,.35,.35,0); 
	draw_text_transformed(167,95,_charge,.35,.35,0); 
	draw_set_color(c_white);
	draw_text_transformed(166,46,"GRACE",.5,.5,0);
	draw_text_transformed(166,56,"Increases max charge. Slightly\nincreases damage of magic skills.\nBase charge 100.",.35,.35,0);  
	draw_text_transformed(166,87,_grcLevel,.35,.35,0); 
	draw_text_transformed(166,95,_charge,.35,.35,0);
	
	//Cost Button
	draw_sprite_stretched(spr_menu,3,161,108,90,16);
	draw_sprite(spr_bean,0,243,117)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(167,113,"Level up:",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(166,113,"Level up:",.35,.35,0);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	var _cost = (obj_player.grace * round(obj_player.grace/2)) + obj_player.vitality + obj_player.might;
	draw_set_color(c_black);
	draw_text_transformed(235,113,_cost,.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(234,113,_cost,.35,.35,0);
	if (point_in_rectangle(_mouseX,_mouseY,161,108,251,124))//Level
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,159,106,94,20);
		if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			obj_player.beans = obj_player.beans - _cost;
			obj_player.grace = obj_player.grace + 1;
			obj_player.max_charge = 100 + (obj_player.grace + round(obj_player.grace/15));
			obj_player.charge = obj_player.max_charge;
			
		
		}
	}
}

}
//
//
//
//
//
//Draw Kephra Stone Info
function DrawKephraKnowledge(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

var _rowLengthB = 6;

for (var i = page * 12; i < (page * 12) + 12; i = i + 1)//Draw Info
{
	var _x2 = 88 + ((i mod 12) mod _rowLengthB) * 36;
	var _y2 = 78 + ((i mod 12) div _rowLengthB) * 36;
	draw_sprite_stretched(spr_menu_circle16,0,_x2,_y2,34,34);
	draw_sprite_stretched(spr_menu,2,_x2,_y2+24,34,11);
	if (obj_inventory.kephra_grid[# i, 1] = true) 
	{
		draw_text(_x2 + 17, _y2 + 12,string(i));
		draw_set_color(c_black);
		//draw_text_transformed(_x2 + 17,_y2 + 28, string(equip_draw[# i, 0]),.3,.3,0)
		if (point_in_rectangle(_mouseX,_mouseY,_x2,_y2,_x2+32,_y2+32))
		{
			//draw_sprite_stretched(spr_highlight_nineslice,0,_x2-2,_y2-2,20,20)
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				slot = i;
				item_id = i;
				playerMenu_draw = DrawSelectedKnowledge;
			}
		}
	}
	else draw_sprite(spr_item_all,0, _x2 + 8, _y2 + 8);
}

//Page Buttons
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_sprite_stretched(spr_menu,2,125,156,32,16);
draw_sprite_stretched(spr_menu,2,160,156,32,16);
draw_text_transformed(141,164,"Page 1",.35,.35,0);
draw_text_transformed(176,164,"Page 2",.35,.35,0);
if (point_in_rectangle(_mouseX,_mouseY,125,156,157,172))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,123,154,36,20);
	if (mouse_check_button_pressed(mb_left)) and (page > 0)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = page - 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,160,156,192,172))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,158,154,36,20);
	if (mouse_check_button_pressed(mb_left)) and (page < 5)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = page + 1;
	}
}



draw_line_width_color(235,70,235,170,1,c_black,c_black)

//Execute Selected Draw Script


}
//
//
//
//
//
//Draw Selected
function DrawSelectedKnowledge(){
//Convert Mouse to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
script_execute(kephra_grid[# slot, 0],20,34);


}