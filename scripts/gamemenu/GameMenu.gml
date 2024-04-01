//Game Menus
//
//
//
//
//
//Game Pause Menu 
function scr_menu_pause_main(){
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
		pause_menu = scr_menu_pause_settings;
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
		scr_game_save_settings();
		scr_game_load_settings();
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
	draw_sprite_ext(spr_guildedIbis2,0,240,135,.5,.5,0,c_white,alpha);
	//draw_text(version)
	timer1 = timer1 - 1;
	
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_left);
	draw_text_transformed(4,260,string(version),1,1,0);
	draw_set_halign(fa_right);
	draw_text_transformed(476,260,"Developed by Guilded Ibis",1,1,0)
}
if (timer1 <= 0)
{
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
draw_sprite_ext(spr_home_title,0,160,0,1.0,1.0,0,c_white,1.0)
//draw_sprite_stretched(spr_menu_beveled,3,85,16,150,124);
//draw_sprite_stretched(spr_menu,8,80,16,160,24);
//draw_sprite_stretched(spr_menu_circle16,1,90,44,140,20);
draw_sprite_stretched(spr_menu_circle16,1,170,86,140,20);
draw_sprite_stretched(spr_menu_circle16,1,170,108,140,20);
draw_sprite_stretched(spr_menu_circle16,1,170,130,140,20);
draw_sprite_stretched(spr_menu_circle16,1,170,152,140,20);
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
//draw_text_transformed(160,20,"COURIER BRAVE",2,2,0);
//draw_text_transformed(160,48,"ADVENTURE",1,1,0);
draw_text_transformed(240,92,"ADVENTURE",1,1,0);
draw_text_transformed(240,114,"ARCADE",1,1,0);
draw_text_transformed(240,136,"SETTINGS",1,1,0);
draw_text_transformed(240,158,"QUIT GAME",1,1,0);
if (point_in_rectangle(_mouseX,_mouseY,170,86,310,106))//Adventure Save Select
{
	draw_sprite_stretched(spr_highlight_circle,0,169,85,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		scr_game_load_settings();
		home_menu = scr_menu_save_select;
		restart = false;
		restart2 = false;
		restart3 = false;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,90,108,230,128))//Arcade Menu
{
	//draw_sprite_stretched(spr_highlight_circle,0,89,107,142,22);
	//if (mouse_check_button_pressed(mb_left))
	//{
		//audio_sound_gain(snd_menu,global.volumeMenu,1);
		//audio_play_sound(snd_menu,0,false);
		//global.home = false;
		//global.gameMode = 1;
		//with (instance_create_layer(x,y,"Instances",obj_player))
		//{
		//	sprite_index = spr_player_regaliare_idle;
		//	image_index = 3;
		//	x = 160;
		//	y = 90;
		//	image_speed = 1;
		//}
		//room_goto(rm_arcade_00);
	//}
}
if (point_in_rectangle(_mouseX,_mouseY,90,130,230,150))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,129,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		home_menu = scr_menu_home_settings;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,90,152,230,172))//Settings Menu
{
	draw_sprite_stretched(spr_highlight_circle,0,89,151,142,22);
	if (mouse_check_button_pressed(mb_left))
	{
		game_end();
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


if (obj_game.time_played > 0)
{
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
				global.current_save = scr_game_save_1;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
				instance_create_layer(x,y,"Instances",obj_player);
				scr_game_load_1();
				scr_player_reset();
				//crull_ary[0] = 0;
				obj_player.hp = obj_player.max_hp;
				room_goto(global.lastAltar);
				obj_player.x = global.lastAltarX;
				obj_player.y = global.lastAltarY;
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_audio_transition();
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
				global.current_save = scr_game_save_1;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
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
					//crull_ary[0] = 0;
					x = 144;
					y = 160;
					image_speed = 1;
				}
				room_goto(rm_scene_00);
				scr_game_save_1();
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_game_song_list_main();
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
}
else
{
	draw_sprite_stretched(spr_menu_circle16,1,18,44,80,20);
	draw_text_transformed(58,21,"NEW GAME",2,2,0);
	draw_text_transformed(58,49,"START",1,1,0);	
	if (point_in_rectangle(_mouseX,_mouseY,18,44,98,64))//Restart Game 1
	{
		draw_sprite_stretched(spr_highlight_circle,0,17,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 0;
			obj_game.time_played = 0;
			global.current_save = scr_game_save_1;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.gameMode = 0;
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
				//crull_ary[0] = 0;
				x = 144;
				y = 160;
				image_speed = 1;
			}
			room_goto(rm_scene_00);
			scr_game_save_1();
			audio_stop_all();
			obj_song.song_timer = 600;
			scr_game_song_list_main();
		}
	}
}
if (obj_game.time_played2 > 0)
{
	if (restart2 = false) and (obj_game.time_played2 > 0)
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
				global.current_save = scr_game_save_2;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
				instance_create_layer(x,y,"Instances",obj_player);
				scr_game_load_2();
				scr_player_reset();
				//crull_ary[0] = 0;
				obj_player.hp = obj_player.max_hp;
				room_goto(global.lastAltar);
				obj_player.x = global.lastAltarX;
				obj_player.y = global.lastAltarY;
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_audio_transition();
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
				global.current_save = scr_game_save_2;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
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
					//crull_ary[0] = 0;
					timer1 = 0;
					x = 144;
					y = 160;
					image_speed = 1;
				}
				room_goto(rm_scene_00);
				scr_game_save_2();
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_game_song_list_main();
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
}
else
{
	draw_sprite_stretched(spr_menu_circle16,1,120,44,80,20);
	//draw_sprite_stretched(spr_menu_circle16,1,120,66,80,20);
	draw_text_transformed(160,21,"NEW GAME",2,2,0);
	draw_text_transformed(160,49,"START",1,1,0);	
	//draw_text_transformed(160,71,"NO",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,120,44,200,64))//Confirm Start
	{
		draw_sprite_stretched(spr_highlight_circle,0,119,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 1;
			obj_game.time_played2 = 0;
			global.current_save = scr_game_save_2;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.gameMode = 0;
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
			scr_game_save_2();
			audio_stop_all();
			obj_song.song_timer = 600;
			scr_game_song_list_main();
		}
	}
}
if (obj_game.time_played3 > 0)
{
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
				global.current_save = scr_game_save_3;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
				instance_create_layer(x,y,"Instances",obj_player);
				scr_game_load_3();
				scr_player_reset();
				crull_ary[0] = 0;
				obj_player.hp = obj_player.max_hp;
				room_goto(global.lastAltar);
				obj_player.x = global.lastAltarX;
				obj_player.y = global.lastAltarY;
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_audio_transition();
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
				global.current_save = scr_game_save_3;
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				global.home = false;
				global.gameMode = 0;
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
				scr_game_save_3();
				audio_stop_all();
				obj_song.song_timer = 600;
				scr_game_song_list_main();
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
}
else
{
	draw_sprite_stretched(spr_menu_circle16,1,222,44,80,20);
	//draw_sprite_stretched(spr_menu_circle16,1,222,66,80,20);
	draw_text_transformed(262,21,"NEW GAME",2,2,0);
	draw_text_transformed(262,49,"START",1,1,0);	
	//draw_text_transformed(262,71,"NO",1,1,0);
	if (point_in_rectangle(_mouseX,_mouseY,222,44,302,64))//Confirm Restart 3
	{
		draw_sprite_stretched(spr_highlight_circle,0,221,43,82,22);
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.save_num = 2;
			obj_game.time_played3 = 0;
			global.current_save = scr_game_save_3;
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			global.home = false;
			global.gameMode = 0;
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
			scr_game_save_3();
			audio_stop_all();
			obj_song.song_timer = 600;
			scr_game_song_list_main();
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
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		home_menu = scr_menu_game_home;
	}
}
}
//
//
//
//
//
//Pause Open/Close
function scr_pause_toggle(){
if (keyboard_check_pressed(vk_escape)) and (global.home = false)
{
	if (textPaused = false) and (invPaused = false)
	{
		
		if (menuPaused = false) 
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
		}
		gamePaused = !gamePaused;
		menuPaused = !menuPaused;
		//global.gamePaused = !global.gamePaused;
		//global.menuPaused = !global.menuPaused;
		if (gamePaused)
		{
			scr_audio_pause_enemy();
			scr_audio_pause_player();
			with (all)
			{
				game_paused_image_speed = image_speed;
				image_speed = 0;
			}
		}
		else
		{
			//global.gamePaused = false;
			//global.menuPaused = false;
			scr_audio_resume_enemy();
			scr_audio_resume_player();
			scr_game_save_settings();
			with (all)
			{
				image_speed = game_paused_image_speed;
			}
		}
	}
}
}
