//Game Menus
//Game Menus will always be the grey stone sprites instead of brown.
//
//
//
//
//Game Pause Menu 
function GamePauseMenu(){
//obj_game > Press ESC

//Translate Mouse Position to GUI position
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
	
//Draw Sprites
draw_sprite_stretched(menu_sprite,0,64,32,192,96); //Background
draw_sprite_stretched(menu_sprite,2,68,36,56,88); //RESUME Button
draw_sprite_stretched(menu_sprite,2,132,36,56,88); //GAME SETTINGS Button
draw_sprite_stretched(menu_sprite,2,196,36,56,88); //SAVE & QUITE Button

	
//Set, Draw Text
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed(96,80,"RESUME\nGAME",.7,1,0);	
draw_text_transformed(160,80,"GAME\nSETTINGS",.7,1,0);
draw_text_transformed(224,80,"SAVE &\nQUIT",.7,1,0);
	

//Buttons Mechanics
//Resume
if (point_in_rectangle(_mouseX,_mouseY,68,36,124,124))
{
	draw_sprite(spr_highlight_button,0,66,34);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		obj_game.gamePaused = false;
		obj_game.menuPaused = false;
	}
}
//Settings
if (point_in_rectangle(_mouseX,_mouseY,132,36,188,124))
{
	draw_sprite(spr_highlight_button,0,130,34);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		pause_menu = GameSettingsMenu;
	}
}
//Save and Quite
if (point_in_rectangle(_mouseX,_mouseY,196,36,252,124))
{
	draw_sprite(spr_highlight_button,0,194,34);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
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
//Game Settings Menu
function GameSettingsMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Draw Sprites
draw_sprite_stretched(menu_sprite,0,64,32,192,96);
draw_sprite_stretched(menu_sprite,2,68,36,32,16);
draw_sprite_stretched(menu_sprite,2,68,54,32,16);
draw_sprite_stretched(menu_sprite,2,68,72,32,16);
draw_sprite_stretched(menu_sprite,2,68,90,32,16);
draw_sprite_stretched(menu_sprite,2,68,108,32,16);

//Set Text
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(64,28,"ESC to resume",.5,.5,0);
draw_text_transformed(84,44,"Volume",.35,.35,0);
draw_text_transformed(84,62,"Controls",.35,.35,0);
draw_text_transformed(84,116,"Return",.35,.35,0);

//Button Mechanics
//Volume
if (point_in_rectangle(_mouseX,_mouseY,68,36,100,52))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,34,36,20)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = GameVolumeMenu;
	}
}
//Controls
if (point_in_rectangle(_mouseX,_mouseY,68,54,100,70))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,52,36,20)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = PlayerControlsMenu;
	}
}
//Return
if (point_in_rectangle(_mouseX,_mouseY,68,108,100,124))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,106,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		script_execute(SaveGameSettings);
		pause_menu = GamePauseMenu;

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
function GameVolumeMenu(){
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
draw_text_transformed(114,44,"<",1,1,0);
draw_text_transformed(202,44,">",1,1,0);


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
function PlayerControlsMenu(){
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
	draw_text_transformed(105,82,"CTRL - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"L Mouse - Use magic skill. ",.35,.35,0);
	draw_text_transformed(104,52,"R Mouse - Use weapon skill.",.35,.35,0);
	draw_text_transformed(104,62,"Shift - Use special skill (if unlocked).",.35,.35,0);
	draw_text_transformed(104,72,"F - Switch magic skill (if unlocked)",.35,.35,0);
	draw_text_transformed(104,82,"CTRL - Switch melee aim style, face current direction\nor face cursor.",.35,.35,0);

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
//
//
//
//
//
//Game Home Menu
function GameHomeMenu(){
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
	

//draw_sprite_stretched(menu_sprite,0,4,128,56,32);
draw_set_font(fnt_title);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(161,20,"COURIER BRAVE",.5,.5,0);
draw_set_color(c_yellow);
draw_text_transformed(160,20,"COURIER BRAVE",.5,.5,0);

if (sub_menu = -1) 
{
	draw_set_font(fnt_text);
	draw_sprite_stretched(menu_sprite,2,4,128,56,32); //Settings 
	draw_set_color(c_black);
	draw_text_transformed(32,144,"SETTINGS/\nCONTROLS",.5,.5,0);
	script_execute(SaveSelectMenu)
	if (point_in_rectangle(_mouseX,_mouseY,4,128,60,160))//Settings Menu
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,2,126,60,36);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			sub_menu = GameHomeVolumeMenu;
			audio_stop_all();
		}
	}
}
else
{
	script_execute(GameHomeSettingsMenu);
	if (sub_menu != -1) script_execute(sub_menu);
}
}
}
//
//
//
//
//
//Save Select
function SaveSelectMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
//Draw Sprites

draw_sprite_stretched(menu_sprite,2,68,36,56,88);
draw_sprite_stretched(menu_sprite,2,68,128,56,32);
draw_sprite_stretched(menu_sprite,2,132,36,56,88);
draw_sprite_stretched(menu_sprite,2,132,128,56,32);
draw_sprite_stretched(menu_sprite,2,196,36,56,88);
draw_sprite_stretched(menu_sprite,2,196,128,56,32);
	
//Set Text
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw Text
draw_text_transformed(96,80,"RESUME\nGAME 1",.7,1,0);	
draw_text_transformed(96,144,"RESTART\nGAME 1",.5,.5,0);	
draw_text_transformed(160,80,"RESUME\nGAME 2",.7,1,0);
draw_text_transformed(160,144,"RESTART\nGAME 2",.5,.5,0);
draw_text_transformed(224,80,"RESUME\nGAME 3",.7,1,0);
draw_text_transformed(224,144,"RESTART\nGAME 3",.5,.5,0);

	
//Mechanics
if (point_in_rectangle(_mouseX,_mouseY,68,36,124,124))//Resume Game 1
{
	draw_sprite(spr_highlight_button,0,66,34);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		instance_create_layer(x,y,"Instances",obj_player);

		LoadGame();
		obj_player.hp = obj_player.max_hp;
		room_goto(global.lastCamp);
		obj_player.x = global.lastCampX;
		obj_player.y = global.lastCampY;
		audio_stop_all();
		show_debug_message(obj_player.crull_level);
			
	}
}
if (point_in_rectangle(_mouseX,_mouseY,68,128,124,160))//New Game 1
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,126,60,36);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		with (instance_create_layer(x,y,"Instances",obj_player))
		{
			sprite_index = spr_player_scene01;
			state_script = PlayerScene01;
			image_speed = 1;
		}

		room_goto(rm_scene01);
		
		SaveGame();
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			text_script = PlayerSceneText01;
		}
		obj_game.scene = true;
		obj_player.scene = true;
		obj_game.gamePaused = true;
		obj_game.textPaused = true;
		gamePaused = true;
		textPaused = true;
		
		obj_player.x = 159;
		obj_player.y = 63;
		audio_stop_all();
	}
}
if (point_in_rectangle(_mouseX,_mouseY,132,36,188,124))//Resume Game 2
{
	draw_sprite(spr_highlight_button,0,130,34);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame2;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		instance_create_layer(x,y,"Instances",obj_player);
		LoadGame2();
		obj_player.hp = obj_player.max_hp;
		room_goto(global.lastCamp);
		obj_player.x = global.lastCampX;
		obj_player.y = global.lastCampY;
		audio_stop_all();
			
	}
}
if (point_in_rectangle(_mouseX,_mouseY,132,128,188,160))//New Game 2
{
	draw_sprite_stretched(spr_highlight_nineslice,0,130,126,60,36);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame2;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		with (instance_create_layer(x,y,"Instances",obj_player))
		{
			sprite_index = spr_player_scene01;
			state_script = PlayerScene01;
			image_speed = 1;
		}
		room_goto(rm_scene01);
		
		SaveGame2();
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			text_script = PlayerSceneText01;
		}
		obj_game.scene = true;
		obj_player.scene = true;
		obj_game.gamePaused = true;
		obj_game.textPaused = true;
		gamePaused = true;
		textPaused = true;
		
		obj_player.x = 159;
		obj_player.y = 63;
		audio_stop_all();
	}
}
if (point_in_rectangle(_mouseX,_mouseY,196,36,252,124))//Resume Game 3
{
	draw_sprite(spr_highlight_button,0,194,34);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame3;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		instance_create_layer(x,y,"Instances",obj_player);
		LoadGame3();
		obj_player.hp = obj_player.max_hp;
		room_goto(global.lastCamp);
		obj_player.x = global.lastCampX;
		obj_player.y = global.lastCampY;
		audio_stop_all();	
	}
}
if (point_in_rectangle(_mouseX,_mouseY,196,128,252,160))//new Game 3
{
	show_debug_message(string(instance_number(obj_inventory)));
	show_debug_message(string(instance_number(obj_text)));
	draw_sprite_stretched(spr_highlight_nineslice,0,194,126,60,36);
	if (mouse_check_button_pressed(mb_left))
	{
		global.current_save = SaveGame3;
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		global.home = false;
		with (instance_create_layer(x,y,"Instances",obj_player))
		{
			sprite_index = spr_player_scene01;
			state_script = PlayerScene01;
			image_speed = 1;
		}
		
		room_goto(rm_scene01);
		
		SaveGame3();
		with (obj_text)
		{
			text_string = ""
			string_counter = 0;
			text_script = PlayerSceneText01;
		}
		obj_game.scene = true;
		obj_player.scene = true;
		obj_game.gamePaused = true;
		obj_game.textPaused = true;
		gamePaused = true;
		textPaused = true;
		
		obj_player.x = 159;
		obj_player.y = 63;
		audio_stop_all();
	}
}

}
//
//
//
//
//
//Game Home Settings Menu
function GameHomeSettingsMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
//Draw Sprites
draw_sprite_stretched(menu_sprite,0,64,32,192,96);
draw_sprite_stretched(menu_sprite,2,68,36,32,16);
draw_sprite_stretched(menu_sprite,2,68,54,32,16);
draw_sprite_stretched(menu_sprite,2,68,72,32,16);
draw_sprite_stretched(menu_sprite,2,68,90,32,16);
draw_sprite_stretched(menu_sprite,2,68,108,32,16);

//Set Text
draw_set_font(fnt_text);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	
//Draw Text
draw_text_transformed(84,44,"Volume",.35,.35,0);
draw_text_transformed(84,62,"Controls",.35,.35,0);
draw_text_transformed(84,116,"Return",.35,.35,0);

//Mechanics
if (point_in_rectangle(_mouseX,_mouseY,68,36,100,52))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,34,36,20)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		sub_menu = GameHomeVolumeMenu;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,68,54,100,70))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,52,36,20)
	if(mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		page = 0;
		sub_menu = PlayerHomeControlsMenu;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,68,108,100,124))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,66,106,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		script_execute(SaveGameSettings);
		sub_menu = -1;

	}
}
}
//
//
//
//
//
//Game Home Volume Menu
function GameHomeVolumeMenu(){
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
draw_text_transformed(114,44,"<",1,1,0);
draw_text_transformed(202,44,">",1,1,0);

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
function PlayerHomeControlsMenu(){
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
	draw_text_transformed(105,82,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(105,102,"R - Recharge magic skill",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"ESC - Open the game menu: settings, save, and quite.",.35,.35,0);
	draw_text_transformed(104,52,"Tab - Open the player menu: inventory, equipment, stats.",.35,.35,0);
	draw_text_transformed(104,62,"W,S,A,D - Up, Down, Left, Right. The direction the\nplayer is facing and moving.",.35,.35,0);
	draw_text_transformed(104,82,"C - Use a Crull Stone to restore 100 health. Return to a\ncamp to restore Crull stones and health.",.35,.35,0);
	draw_text_transformed(104,102,"R - Recharge magic skill",.35,.35,0);


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
	draw_text_transformed(105,42,"L Mouse - Use weapon. ",.35,.35,0);
	draw_text_transformed(105,52,"R Mouse - Use magic.",.35,.35,0);
	draw_text_transformed(105,62,"Shift - Use special.",.35,.35,0);
	draw_text_transformed(105,72,"Space - Roll.",.35,.35,0);
	draw_set_color(c_white);
	draw_text_transformed(104,42,"L Mouse - Use weapon.",.35,.35,0);
	draw_text_transformed(104,52,"R Mouse - Use magic.",.35,.35,0);
	draw_text_transformed(104,62,"Shift - Use special.",.35,.35,0);
	draw_text_transformed(104,72,"Space - Roll",.35,.35,0);

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