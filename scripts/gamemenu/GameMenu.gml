//Game Menus
//
//
//
//
//
//Game Pause Menu 
function scr_menu_game_pause(){
//obj_game > Press ESC

//Translate Mouse Position to GUI position
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
//Draw Sprites
draw_sprite_stretched(spr_menu_beveled,3,64,28,192,100);
draw_sprite_stretched(spr_menu,8,59,14,202,20);
draw_sprite_stretched(spr_menu_circle16,1,69,37,56,86); //RESUME Button
draw_sprite_stretched(spr_menu_circle16,1,132,37,56,86); //GAME SETTINGS Button
draw_sprite_stretched(spr_menu_circle16,1,195,37,56,86); //SAVE & QUITE Button

	
//Set, Draw Text
draw_set_font(global.fnt_main_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed(160,26,"GAME PAUSED",1,1,0);
draw_text_transformed(96,80,"RESUME\nGAME",.75,.75,0);	
draw_text_transformed(160,80,"GAME\nSETTINGS",.75,.75,0);
draw_text_transformed(224,80,"SAVE &\nQUIT",.75,.75,0);
	

//Buttons Mechanics
//Resume
if (point_in_rectangle(_mouseX,_mouseY,69,37,125,122))
{
	draw_sprite_stretched(spr_highlight_circle,0,68,36,58,88);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		obj_game.gamePaused = false;
		obj_game.menuPaused = false;
	}
}
//Settings
if (point_in_rectangle(_mouseX,_mouseY,132,37,188,122))
{
	draw_sprite_stretched(spr_highlight_circle,0,131,36,58,88);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		pause_menu = scr_menu_game_settings;
		sub_menu = -1;
	}
}
//Save and Quite
if (point_in_rectangle(_mouseX,_mouseY,195,37,251,122))
{
	draw_sprite_stretched(spr_highlight_circle,0,194,36,58,88);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		script_execute(SaveGameSettings);
		script_execute(LoadGameSettings);
		if (global.current_save != -1) script_execute(global.current_save);
		game_restart();
	}
}
}
//
//
//
//
//
//Game Home Menu
function scr_menu_game_home(){
if (timer1 > 0)
{
	var alpha = 1
	if (timer1 <= 100)
	{
		alpha = timer1/100;
	}
	draw_sprite_ext(spr_guildedIbis2,0,160,80,.25,.25,0,c_white,alpha);
	//draw_text(version)
	timer1 = timer1 - 1;
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(4,176,string(version),.35,.35,0);
	draw_set_halign(fa_right);
	draw_text_transformed(308,176,"Developed by Guilded Ibis",.35,.35,0)
}
if (timer1 <= 0)
{
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	

draw_sprite_stretched(spr_menu_beveled,3,85,16,150,124);
draw_sprite_stretched(spr_menu,8,80,16,160,24);
draw_sprite_stretched(spr_menu_circle16,1,90,44,140,20);
draw_sprite_stretched(spr_menu_circle16,1,90,66,140,20);
draw_sprite_stretched(spr_menu_circle16,1,90,88,140,20);
draw_sprite_stretched(spr_menu_circle16,1,90,110,140,20);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text_transformed(160,20,"COURIER BRAVE",2,2,0);
draw_text_transformed(160,48,"ADVENTURE",1,1,0);
draw_text_transformed(160,70,"???",1,1,0);
draw_text_transformed(160,92,"???",1,1,0);
draw_text_transformed(160,114,"SETTINGS",1,1,0);
if (point_in_rectangle(_mouseX,_mouseY,90,44,230,64))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,43,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		home_menu = scr_menu_save_select;
		restart = false;
		restart2 = false;
		restart3 = false;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,90,66,230,86))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,65,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		//audio_sound_gain(snd_menu,global.volumeMenu,1);
		//audio_play_sound(snd_menu,0,false);
		//sub_menu = GameHomeVolumeMenu;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,90,88,230,108))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,87,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		//audio_sound_gain(snd_menu,global.volumeMenu,1);
		//audio_play_sound(snd_menu,0,false);
		//sub_menu = GameHomeVolumeMenu;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,90,110,230,130))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,109,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		home_menu = scr_menu_home_settings;
	}
}
//else
//{
//	if (sub_menu != -1) script_execute(sub_menu);
//}
}
}
//
//
//
//
//
//Save Select
function scr_menu_save_select(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Sprites
draw_sprite_stretched(spr_menu_beveled,3,13,16,90,78);
draw_sprite_stretched(spr_menu,8,8,16,100,24);
draw_sprite_stretched(spr_menu_beveled,3,115,16,90,78);
draw_sprite_stretched(spr_menu,8,110,16,100,24);
draw_sprite_stretched(spr_menu_beveled,3,217,16,90,78);
draw_sprite_stretched(spr_menu,8,212,16,100,24);
draw_sprite_stretched(spr_menu_beveled,3,13,96,90,20);
draw_sprite_stretched(spr_menu_beveled,3,115,96,90,20);
draw_sprite_stretched(spr_menu_beveled,3,217,96,90,20);	

//Time Played
var _timePlayed = "TIME:" + string(obj_game.time_played div 3600) + "h " + string((obj_game.time_played div 60) mod 60) + "m";
var _timePlayed2 = "TIME:" + string(obj_game.time_played2 div 3600) + "h " + string((obj_game.time_played2 div 60) mod 60) + "m";
var _timePlayed3 = "TIME:" + string(obj_game.time_played3 div 3600) + "h " + string((obj_game.time_played3 div 60) mod 60) + "m";
draw_text_transformed(58,101,_timePlayed,1,1,0);
draw_text_transformed(160,101,_timePlayed2,1,1,0);
draw_text_transformed(262,101,_timePlayed3,1,1,0);

//Set Text
draw_set_font(global.fnt_main_white)
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (restart = false)
{
	//Buttons and Text
	draw_sprite_stretched(spr_menu_circle16,1,18,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,18,66,80,20);
	draw_text_transformed(58,21,"SAVE 1",2,2,0);	
	draw_text_transformed(58,49,"RESUME",1,1,0);	
	draw_text_transformed(58,71,"RESTART",1,1,0);	
	if (point_in_rectangle(_mouseX,_mouseY,18,44,98,64))//Resume Game 1
	{
		draw_sprite_stretched(spr_highlight_circle,0,17,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 0;
			global.current_save = SaveGame;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			instance_create_layer(x,y,"Instances",obj_player);

			LoadGame();
			crull_ary[0] = 0;
			obj_player.hp = obj_player.max_hp;
			room_goto(global.lastCamp);
			obj_player.x = global.lastCampX;
			obj_player.y = global.lastCampY;
			audio_stop_all();
			
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,18,66,98,86))//New Game 1
	{
		draw_sprite_stretched(spr_highlight_circle,0,17,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart = true;
		}	
	}
}
else
{	
	
	draw_sprite_stretched(spr_menu_circle16,1,18,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,18,66,80,20);
	draw_text_transformed(58,21,"RESTART?",2,2,0);
	draw_text_transformed(58,49,"YES",1,1,0);	
	draw_text_transformed(58,71,"NO",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,18,44,98,64))//Restart Game 1
	{
		draw_sprite_stretched(spr_highlight_circle,0,17,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 0;
			obj_game.time_played = 0;
			global.current_save = SaveGame;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.dayPhase = 2;
			obj_game.night_fade = 1000;
			obj_game.day_timer = 17000;
			with (instance_create_layer(x,y,"Instances",obj_player))
			{
				scene = true;
				sprite_index = spr_player_regaliare_idle;
				image_index = 3;
				state_script = scr_player_scene_00;
				scene_script = scr_player_scene_00_text;
				timer1 = 0;
				crull_ary[0] = 0;
				x = 144;
				y = 160;
				image_speed = 1;
			}
		
			room_goto(rm_scene_00);
		
			SaveGame();
			audio_stop_all();
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,18,66,98,86))
	{
		draw_sprite_stretched(spr_highlight_circle,0,17,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart = false;
		}	
	}
}
if (restart2 = false)
{
	//Buttons and Text
	draw_sprite_stretched(spr_menu_circle16,1,120,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,120,66,80,20);
	draw_text_transformed(160,21,"SAVE 1",2,2,0);	
	draw_text_transformed(160,49,"RESUME",1,1,0);	
	draw_text_transformed(160,71,"RESTART",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,120,44,200,64))//Resume Game 1
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 1;
			global.current_save = SaveGame2;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			instance_create_layer(x,y,"Instances",obj_player);
			LoadGame2();
			crull_ary[0] = 0;
			obj_player.hp = obj_player.max_hp;
			room_goto(global.lastCamp);
			obj_player.x = global.lastCampX;
			obj_player.y = global.lastCampY;
			audio_stop_all();
			
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,120,66,200,86))//Restart Game 2
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart2 = true;
		}
	}
}
else
{
	draw_sprite_stretched(spr_menu_circle16,1,120,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,120,66,80,20);
	draw_text_transformed(160,21,"RESTART?",2,2,0);
	draw_text_transformed(160,49,"YES",1,1,0);	
	draw_text_transformed(160,71,"NO",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,120,44,200,64))//Confirm Restart
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 1;
			obj_game.time_played2 = 0;
			global.current_save = SaveGame2;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.dayPhase = 2;
			obj_game.night_fade = 1000;
			obj_game.day_timer = 17000;
			with (instance_create_layer(x,y,"Instances",obj_player))
			{
				scene = true;
				sprite_index = spr_player_regaliare_idle;
				image_index = 3;
				state_script = scr_player_scene_00;
				scene_script = scr_player_scene_00_text;
				crull_ary[0] = 0;
				timer1 = 0;
				x = 144;
				y = 160;
				image_speed = 1;
			}
		
			room_goto(rm_scene_00);
		
			SaveGame2();
			audio_stop_all();
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,120,66,200,686))
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart2 = false;
		}	
	}
}
if (restart3 = false)
{
	//Buttons and Text
	draw_sprite_stretched(spr_menu_circle16,1,222,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,222,66,80,20);
	draw_text_transformed(262,21,"SAVE 3",2,2,0);	
	draw_text_transformed(262,49,"RESUME",1,1,0);	
	draw_text_transformed(262,71,"RESTART",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,222,44,302,64))//Resume Game 3
	{
		draw_sprite_stretched(spr_highlight_circle,0,221,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 2;
			global.current_save = SaveGame3;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			instance_create_layer(x,y,"Instances",obj_player);
			LoadGame3();
			crull_ary[0] = 0;
			obj_player.hp = obj_player.max_hp;
			room_goto(global.lastCamp);
			obj_player.x = global.lastCampX;
			obj_player.y = global.lastCampY;
			audio_stop_all();	
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,222,66,302,86))//Restart Game 3
	{
		draw_sprite_stretched(spr_highlight_circle,0,221,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart3 = true;
		}
	}
}
else
{
	draw_sprite_stretched(spr_menu_circle16,1,222,44,80,20);
	draw_sprite_stretched(spr_menu_circle16,1,222,66,80,20);
	draw_text_transformed(262,21,"RESTART?",2,2,0);
	draw_text_transformed(262,49,"YES",1,1,0);	
	draw_text_transformed(262,71,"NO",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,222,44,302,64))//Confirm Restart 3
	{
		draw_sprite_stretched(spr_highlight_circle,0,221,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 2;
			obj_game.time_played3 = 0;
			global.current_save = SaveGame3;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.dayPhase = 2;
			obj_game.night_fade = 1000;
			obj_game.day_timer = 17000;
			with (instance_create_layer(x,y,"Instances",obj_player))
			{
				scene = true;
				sprite_index = spr_player_regaliare_idle;
				image_index = 3;
				state_script = scr_player_scene_00;
				scene_script = scr_player_scene_00_text;
				crull_ary[0] = 0;
				timer1 = 0;
				x = 144;
				y = 160;
				image_speed = 1;
			}
			room_goto(rm_scene_00);
			SaveGame3();
			audio_stop_all();
		}
	}
	if (point_in_rectangle(_mouseX,_mouseY,222,66,302,686))//Return
	{
		draw_sprite_stretched(spr_highlight_circle,0,221,65,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			restart3 = false;
		}	
	}
}

//Display Timers


//Home
draw_sprite_stretched(spr_menu_circle16,1,16,148,16,16);
if (point_in_rectangle(_mouseX,_mouseY,16,148,32,164))//Home
{
	draw_sprite_stretched(spr_highlight_circle,0,15,147,18,18);
	if (mouse_check_button_pressed(mb_left))
	{
		sub_menu = -1;
	}
}
}
	
