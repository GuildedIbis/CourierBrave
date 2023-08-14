//Settings Menus
//
//
//
//
//
//Game Settings Menu
function scr_menu_game_settings(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Draw Sprites
draw_sprite_stretched(spr_menu_beveled,3,64,28,192,100);
draw_sprite_stretched(spr_menu,8,59,14,202,20);
draw_sprite_stretched(spr_menu_circle16,1,69,37,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,54,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,71,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,88,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,105,32,16);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(160,26,"SETTINGS",1,1,0);
draw_text_transformed(84,44,"Volume",.35,.35,0);
draw_text_transformed(84,62,"Controls",.35,.35,0);
draw_text_transformed(84,116,"Return",.35,.35,0);

//Button Mechanics
//Volume
if (point_in_rectangle(_mouseX,_mouseY,69,37,101,53))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,36,34,18)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = scr_menu_game_volume;
	}
}
//Controls
if (point_in_rectangle(_mouseX,_mouseY,69,54,101,70))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,53,34,18)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = scr_menu_player_controls;
		page = 0;
	}
}
//Return
if (point_in_rectangle(_mouseX,_mouseY,69,105,101,121))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,104,34,18);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		script_execute(SaveGameSettings);
		pause_menu = scr_menu_game_pause;

	}
}
if (sub_menu != -1)
{
	script_execute(sub_menu);
}
}
//
//
//
//
//
//Game Volume Menu
function scr_menu_game_volume(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Set Text
draw_set_font(global.fnt_main_white);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
	
//Music Volume Sprites
draw_sprite_stretched(spr_menu_circle16,1,106,37,16,16);
draw_sprite_stretched(spr_menu_circle16,1,194,37,16,16);
draw_text_transformed(112,46,"<",.75,.75,0);
draw_text_transformed(201,46,">",.75,.75,0);
draw_text_transformed(216,46,"MUSIC",.75,.75,0);
//Music Volume Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,37,122,52))
{
	draw_sprite_stretched(spr_highlight_circle,0,105,36,18,18)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeMusic >= .05)
	{
		global.volumeMusic = global.volumeMusic - .05;
		with (obj_song)
		{
			audio_sound_gain(room_song,global.volumeMusic,1);
		}
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,37,210,52))
{
	draw_sprite_stretched(spr_highlight_circle,0,193,36,18,18);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeMusic <= .95)
	{
		global.volumeMusic = global.volumeMusic + .05;
		with (obj_song)
		{
			audio_sound_gain(room_song,global.volumeMusic,1);
		}
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
	}
}
//Music Volume Slider
var _volumeMusicPerc = (global.volumeMusic/1.00) * 100;
draw_healthbar(124,39,191,51,_volumeMusicPerc,c_black,c_white,c_white,0,true,true);

//Menu Volume Sprites
draw_sprite_stretched(spr_menu_circle16,1,106,54,16,16);
draw_sprite_stretched(spr_menu_circle16,1,194,54,16,16);
draw_text_transformed(112,62,"<",.75,.75,0);
draw_text_transformed(201,62,">",.75,.75,0);
draw_text_transformed(216,62,"MENU",.75,.75,0);
//Menu Volume Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,54,122,70))
{
	draw_sprite_stretched(spr_highlight_circle,0,105,53,18,18)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeMenu >= .02)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeMenu = global.volumeMenu - .02;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,54,210,70))
{
	draw_sprite_stretched(spr_highlight_circle,0,193,53,18,18);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeMenu <= .38)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeMenu = global.volumeMenu + .02;
	}
}
//Menu Volume Slider
var _volumeMenuPerc = (global.volumeMenu/.4) * 100;
draw_healthbar(124,55,191,67,_volumeMenuPerc,c_black,c_white,c_white,0,true,true);


//Effects Volume Sprites
draw_sprite_stretched(spr_menu_circle16,1,106,71,16,16);
draw_sprite_stretched(spr_menu_circle16,1,194,71,16,16);
draw_text_transformed(216,80,"GAME",.75,.75,0)
draw_text_transformed(112,80,"<",.75,.75,0)
draw_text_transformed(201,80,">",.75,.75,0)
//Effects Volume Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,71,122,87))
{
	draw_sprite_stretched(spr_highlight_circle,0,105,70,18,18)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeEffects >= .04)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeEffects = global.volumeEffects - .04;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,71,210,87))
{
	draw_sprite_stretched(spr_highlight_circle,0,193,70,18,18);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeEffects <= .76)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeEffects = global.volumeEffects + .04;
	}
}
//Effects Volume Slider
var _volumeFXPerc = (global.volumeEffects/.8) * 100;
draw_healthbar(124,73,191,85,_volumeFXPerc,c_black,c_white,c_white,0,true,true);
}
//
//
//
//
//
//Player Controls 
function scr_menu_player_controls(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


if (page = 0)
{
	//Lines
	draw_line_width_color(102,40,102,112,1,c_black,c_black);	
	draw_line_width_color(102,40,240,40,1,c_black,c_black);
	draw_line_width_color(102,50,240,50,1,c_black,c_black);
	draw_line_width_color(102,60,240,60,1,c_black,c_black);
	draw_line_width_color(102,76,240,76,1,c_black,c_black);
	draw_line_width_color(102,86,240,86,1,c_black,c_black);
	draw_line_width_color(102,102,240,102,1,c_black,c_black);
	draw_line_width_color(102,112,240,112,1,c_black,c_black);
	draw_line_width_color(240,40,240,112,1,c_black,c_black);
	
	//Text
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(105,42,"ESC - Open the game menu: settings, save, and quite.",.35,.35,0);
	draw_text_transformed(105,52,"Tab - Open the player menu: inventory, equipment, stats.",.35,.35,0);
	draw_text_transformed(105,62,"W,S,A,D - Up, Down, Left, Right. The direction the\nplayer is facing and moving.",.35,.35,0);
	draw_text_transformed(105,78,"Space - Roll and become briefly invincible.",.35,.35,0);
	draw_text_transformed(105,88,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(105,104,"E - Interact",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"ESC - Open the game menu: settings, save, and quite.",.35,.35,0);
	draw_text_transformed(104,52,"Tab - Open the player menu: inventory, equipment, stats.",.35,.35,0);
	draw_text_transformed(104,62,"W,S,A,D - Up, Down, Left, Right. The direction the\nplayer is facing and moving.",.35,.35,0);
	draw_text_transformed(104,78,"Space - Roll and become briefly invincible.",.35,.35,0);
	draw_text_transformed(104,88,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(104,104,"E - Interact",.35,.35,0);


}

if (page = 1)
{
	//Lines
	draw_line_width_color(102,40,102,96,1,c_black,c_black);	
	draw_line_width_color(102,40,240,40,1,c_black,c_black);
	draw_line_width_color(102,50,240,50,1,c_black,c_black);
	draw_line_width_color(102,60,240,60,1,c_black,c_black);
	draw_line_width_color(102,70,240,70,1,c_black,c_black);
	draw_line_width_color(102,80,240,80,1,c_black,c_black);
	draw_line_width_color(102,96,240,96,1,c_black,c_black);
	draw_line_width_color(240,40,240,96,1,c_black,c_black);
	
	//Text
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(105,42,"L Mouse - Use magic skill. ",.35,.35,0);
	draw_text_transformed(105,52,"R Mouse - Use weapon skill.",.35,.35,0);
	draw_text_transformed(105,62,"Shift - Use special skill (if unlocked).",.35,.35,0);
	draw_text_transformed(105,72,"F - Switch magic skill (if unlocked)",.35,.35,0);
	draw_text_transformed(105,82,"Z - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"L Mouse - Use magic skill. ",.35,.35,0);
	draw_text_transformed(104,52,"R Mouse - Use weapon skill.",.35,.35,0);
	draw_text_transformed(104,62,"Shift - Use special skill (if unlocked).",.35,.35,0);
	draw_text_transformed(104,72,"F - Switch magic skill (if unlocked)",.35,.35,0);
	draw_text_transformed(104,82,"Z - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);

}
draw_sprite(spr_scroll_bar2b,page,242,41)
if (point_in_rectangle(_mouseX,_mouseY,243,41,251,47))
{
	draw_sprite(spr_scroll_highlight,0,243,41);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,243,114,251,119))
{
	draw_sprite(spr_scroll_highlight,1,243,114);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 1) page = page + 1;
		else page = 0;
	}
}
}
//
//
//
//
//
//Game Home Settings Menu
function scr_menu_home_settings(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Draw Sprites
draw_sprite_stretched(spr_menu_beveled,3,64,28,192,100);
draw_sprite_stretched(spr_menu,8,59,14,202,20);
draw_sprite_stretched(spr_menu_circle16,1,69,37,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,54,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,71,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,88,32,16);
draw_sprite_stretched(spr_menu_circle16,1,69,105,32,16);

//Set Text
draw_set_font(global.fnt_main_white);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(160,26,"SETTINGS",1,1,0);
draw_text_transformed(84,44,"Volume",.35,.35,0);
draw_text_transformed(84,62,"Controls",.35,.35,0);
draw_text_transformed(84,116,"Return",.35,.35,0);

//Button Mechanics
//Volume
if (point_in_rectangle(_mouseX,_mouseY,69,37,101,53))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,36,34,18)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = scr_menu_home_volume;
	}
}
//Controls
if (point_in_rectangle(_mouseX,_mouseY,69,54,101,70))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,53,34,18)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = scr_menu_home_controls;
		page = 0;
	}
}
//Return
if (point_in_rectangle(_mouseX,_mouseY,69,105,101,121))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,104,34,18);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		script_execute(SaveGameSettings);
		home_menu = scr_menu_game_home;

	}
}
if (sub_menu != -1)
{
	script_execute(sub_menu);
}
}
//
//
//
//
//
//Game Home Volume Menu
function scr_menu_home_volume(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Set Text
draw_set_font(fnt_text);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
	
//Draw Text
//draw_text_transformed(64,28,"ESC to resume",.5,.5,0);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text_transformed(232,44,"MUSIC",.35,.35,0);
draw_text_transformed(232,62,"MENU",.35,.35,0);
draw_text_transformed(232,80,"GAME",.35,.35,0);
draw_text_transformed(114,44,"<",1,1,0);
draw_text_transformed(202,44,">",1,1,0);
draw_text_transformed(114,62,"<",1,1,0);
draw_text_transformed(202,62,">",1,1,0);
draw_text_transformed(114,80,"<",1,1,0);
draw_text_transformed(202,80,">",1,1,0);

//Music Volume
//Draw Sprites
draw_sprite_stretched(menu_sprite,2,106,36,16,16);
draw_sprite_stretched(menu_sprite,2,194,36,16,16);
//Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,36,122,52))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,104,34,20,20)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeMusic >= .05)
	{
		global.volumeMusic = global.volumeMusic - .05;
		with (obj_song)
		{
			audio_sound_gain(room_song,global.volumeMusic,1);
		}
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,36,210,52))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,192,34,20,20);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeMusic <= .95)
	{
		global.volumeMusic = global.volumeMusic + .05;
		with (obj_song)
		{
			audio_sound_gain(room_song,global.volumeMusic,1);
		}
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
	}
}
//Slider
var _volumeMusicPerc = (global.volumeMusic/1.00) * 100;
draw_healthbar(124,38,191,50,_volumeMusicPerc,c_black,c_white,c_white,0,true,true);


//Menu Volume
//Draw Sprites
draw_sprite_stretched(menu_sprite,2,106,54,16,16);
draw_sprite_stretched(menu_sprite,2,194,54,16,16);
//Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,54,122,70))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,104,52,20,20)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeMenu >= .02)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeMenu = global.volumeMenu - .02;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,54,210,70))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,192,52,20,20);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeMenu <= .38)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeMenu = global.volumeMenu + .02;
	}
}
//Slider
var _volumeMenuPerc = (global.volumeMenu/.4) * 100;
draw_healthbar(124,56,191,68,_volumeMenuPerc,c_black,c_white,c_white,0,true,true);


//Effects Volume
//Draw Sprites
draw_sprite_stretched(menu_sprite,2,106,72,16,16);
draw_sprite_stretched(menu_sprite,2,194,72,16,16);
//Buttons
if (point_in_rectangle(_mouseX,_mouseY,106,72,122,88))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,104,70,20,20)
	if(mouse_check_button_pressed(mb_left)) and (global.volumeEffects >= .04)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeEffects = global.volumeEffects - .04;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,194,72,210,88))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,192,70,20,20);
	if (mouse_check_button_pressed(mb_left)) and (global.volumeEffects <= .76)
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.volumeEffects = global.volumeEffects + .04;
	}
}
//Slider
var _volumeFXPerc = (global.volumeEffects/.8) * 100;
draw_healthbar(124,74,191,86,_volumeFXPerc,c_black,c_white,c_white,0,true,true);
}
//
//
//
//
//
//Player Controls 
function scr_menu_home_controls(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


if (page = 0)
{
	//Lines
	draw_line_width_color(102,40,102,110,1,c_black,c_black);	
	draw_line_width_color(102,40,240,40,1,c_black,c_black);
	draw_line_width_color(102,50,240,50,1,c_black,c_black);
	draw_line_width_color(102,60,240,60,1,c_black,c_black);
	draw_line_width_color(102,80,240,80,1,c_black,c_black);
	draw_line_width_color(102,100,240,100,1,c_black,c_black);
	draw_line_width_color(102,110,240,110,1,c_black,c_black);
	draw_line_width_color(240,40,240,110,1,c_black,c_black);
	
	//Text
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(105,42,"ESC - Open the game menu: settings, save, and quite.",.35,.35,0);
	draw_text_transformed(105,52,"Tab - Open the player menu: inventory, equipment, stats.",.35,.35,0);
	draw_text_transformed(105,62,"W,S,A,D - Up, Down, Left, Right. The direction the\nplayer is facing and moving.",.35,.35,0);
	draw_text_transformed(105,78,"Space - Roll and become briefly invincible.",.35,.35,0);
	draw_text_transformed(105,88,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(105,104,"E - Interact",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"ESC - Open the game menu: settings, save, and quite.",.35,.35,0);
	draw_text_transformed(104,52,"Tab - Open the player menu: inventory, equipment, stats.",.35,.35,0);
	draw_text_transformed(104,62,"W,S,A,D - Up, Down, Left, Right. The direction the\nplayer is facing and moving.",.35,.35,0);
	draw_text_transformed(104,78,"Space - Roll and become briefly invincible.",.35,.35,0);
	draw_text_transformed(104,88,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(104,104,"E - Interact",.35,.35,0);


}

if (page = 1)
{
	//Lines
	draw_line_width_color(102,40,102,80,1,c_black,c_black);	
	draw_line_width_color(102,40,240,40,1,c_black,c_black);
	draw_line_width_color(102,50,240,50,1,c_black,c_black);
	draw_line_width_color(102,60,240,60,1,c_black,c_black);
	draw_line_width_color(102,70,240,70,1,c_black,c_black);
	draw_line_width_color(102,80,240,80,1,c_black,c_black);
	draw_line_width_color(240,40,240,80,1,c_black,c_black);
	
	//Text
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_transformed(105,42,"L Mouse - Use magic skill. ",.35,.35,0);
	draw_text_transformed(105,52,"R Mouse - Use weapon skill.",.35,.35,0);
	draw_text_transformed(105,62,"Shift - Use special skill (if unlocked).",.35,.35,0);
	draw_text_transformed(105,72,"F - Switch magic skill (if unlocked)",.35,.35,0);
	draw_text_transformed(105,82,"Z - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"L Mouse - Use magic skill. ",.35,.35,0);
	draw_text_transformed(104,52,"R Mouse - Use weapon skill.",.35,.35,0);
	draw_text_transformed(104,62,"Shift - Use special skill (if unlocked).",.35,.35,0);
	draw_text_transformed(104,72,"F - Switch magic skill (if unlocked)",.35,.35,0);
	draw_text_transformed(104,82,"Z - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);

}
draw_sprite(spr_scroll_bar2,page,242,41)
if (point_in_rectangle(_mouseX,_mouseY,243,41,251,47))
{
	draw_sprite(spr_scroll_highlight,0,243,41);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,243,114,251,119))
{
	draw_sprite(spr_scroll_highlight,1,243,114);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 1) page = page + 1;
		else page = 0;
	}
}
}