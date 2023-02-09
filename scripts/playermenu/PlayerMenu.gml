//Player Menu
//
//
//
//
//
//Player Menu GUI
function PlayerMenuGUI(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
//Background
draw_sprite_stretched(spr_menu,3,69,42,90,16);
draw_sprite_stretched(spr_menu,3,69,60,90,16);
draw_sprite_stretched(spr_menu,3,69,78,90,16);
draw_sprite_stretched(spr_menu,3,69,96,90,16);
////draw_sprite_stretched(spr_menu_circle16,3,70,42,36,36);
//draw_sprite_stretched(spr_menu_player_stat,0,100,46,30,30);
////draw_sprite_stretched(spr_menu_circle16,3,184,42,36,36);
//draw_sprite_stretched(spr_menu_player_stat,1,191,46,30,30);
////draw_sprite_stretched(spr_menu_circle16,3,70,88,36,36);
//draw_sprite_stretched(spr_menu_player_stat,2,100,92,30,30);
////draw_sprite_stretched(spr_menu_circle16,3,184,88,36,36);
//draw_sprite_stretched(spr_menu_player_stat,3,191,92,30,30);
if (point_in_rectangle(_mouseX,_mouseY,69,42,159,58))//Select weapons menu draw script
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,40,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 0;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,60,159,76))//Select weapons menu draw script
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,58,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 1;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,78,159,94))//Select weapons menu draw script
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,76,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 2;
		
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,96,159,112))//Select weapons menu draw script
{
	draw_sprite_stretched(spr_highlight_nineslice,0,67,94,94,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 3;
		
	}
}

var _vitalityTitle = "VITALITY | LVL: " + string(obj_player.vitality);
var _energyTitle = "ENERGY | LVL: " + string(obj_player.energy);
var _mightTitle = "MIGHT | LVL: " + string(obj_player.might);
var _graceTitle = "GRACE | LVL: " + string(obj_player.grace);
draw_text_transformed(75,47,_vitalityTitle,.35,.35,0);
draw_text_transformed(75,65,_energyTitle,.35,.35,0);
draw_text_transformed(75,83,_mightTitle,.35,.35,0);
draw_text_transformed(75,101,_graceTitle,.35,.35,0);

//Draw Vitality
if (page = 0)
{
	draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(167,47,"VITALITY",.35,.35,0);
	draw_text_transformed(167,54,"Base health 150.\nEach level increases max health.",.3,.3,0);
}


//Draw Energy
if (page = 1)
{
	draw_sprite_stretched(spr_menu_player_stat,1,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(167,47,"ENERGY",.35,.35,0);
	draw_text_transformed(167,54,"Base energy 50.\nEach level increases max energy.",.3,.3,0);
}


//Draw Might
if (page = 2)
{
	draw_sprite_stretched(spr_menu_player_stat,2,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(167,47,"MIGHT",.35,.35,0);
	draw_text_transformed(167,54,"Added to weapon skill.\nApplies to some special skills.",.3,.3,0);
}

//Draw Grace
if (page = 3)
{
	draw_sprite_stretched(spr_menu_player_stat,3,196,64,30,30);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text_transformed(167,47,"GRACE",.35,.35,0);
	draw_text_transformed(167,54,"Applies to magic skills.\nApplies to some special skills.",.3,.3,0);
}

}
//
//
//
//
//
//Draw Stats
//function DrawStats(){
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
////Does not include mouse conversion to GUI
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
//draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
////Background
//draw_sprite_stretched(spr_menu,3,69,42,90,16);
//draw_sprite_stretched(spr_menu,3,69,60,90,16);
//draw_sprite_stretched(spr_menu,3,69,78,90,16);
//draw_sprite_stretched(spr_menu,3,69,96,90,16);
//////draw_sprite_stretched(spr_menu_circle16,3,70,42,36,36);
////draw_sprite_stretched(spr_menu_player_stat,0,100,46,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,184,42,36,36);
////draw_sprite_stretched(spr_menu_player_stat,1,191,46,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,70,88,36,36);
////draw_sprite_stretched(spr_menu_player_stat,2,100,92,30,30);
//////draw_sprite_stretched(spr_menu_circle16,3,184,88,36,36);
////draw_sprite_stretched(spr_menu_player_stat,3,191,92,30,30);
//if (point_in_rectangle(_mouseX,_mouseY,69,42,159,58))//Select weapons menu draw script
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,40,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 0;
		
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,60,159,76))//Select weapons menu draw script
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,58,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 1;
		
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,78,159,94))//Select weapons menu draw script
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,76,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 2;
		
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,96,159,112))//Select weapons menu draw script
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,67,94,94,20);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		audio_sound_gain(snd_menu,global.volumeMenu,1);
//		audio_play_sound(snd_menu,0,false);
//		page = 3;
		
//	}
//}

//var _vitalityTitle = "VITALITY | LVL: " + string(obj_player.vitality);
//var _energyTitle = "ENERGY | LVL: " + string(obj_player.energy);
//var _mightTitle = "MIGHT | LVL: " + string(obj_player.might);
//var _graceTitle = "GRACE | LVL: " + string(obj_player.grace);
//draw_text_transformed(75,47,_vitalityTitle,.35,.35,0);
//draw_text_transformed(75,65,_energyTitle,.35,.35,0);
//draw_text_transformed(75,83,_mightTitle,.35,.35,0);
//draw_text_transformed(75,101,_graceTitle,.35,.35,0);

////Draw Vitality
//if (page = 0)
//{
//	draw_sprite_stretched(spr_menu_player_stat,0,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"VITALITY",.35,.35,0);
//	draw_text_transformed(167,54,"Base health 150.\nEach level increases max health.",.3,.3,0);
//}


////Draw Energy
//if (page = 1)
//{
//	draw_sprite_stretched(spr_menu_player_stat,1,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"ENERGY",.35,.35,0);
//	draw_text_transformed(167,54,"Base energy 50.\nEach level increases max energy.",.3,.3,0);
//}


////Draw Might
//if (page = 2)
//{
//	draw_sprite_stretched(spr_menu_player_stat,2,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"MIGHT",.35,.35,0);
//	draw_text_transformed(167,54,"Added to weapon damage and sometimes special damage.",.3,.3,0);
//}

////Draw Might
//if (page = 3)
//{
//	draw_sprite_stretched(spr_menu_player_stat,3,196,64,30,30);
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_color(c_white);
//	draw_text_transformed(167,47,"GRACE",.35,.35,0);
//	draw_text_transformed(167,54,"Added to magic damage and sometimes special damage.",.3,.3,0);
//}
//}	
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