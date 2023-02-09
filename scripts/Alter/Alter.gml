//Alter
//Where the player levels their character stats
//
//
//
//
//
//Alter Create
function AlterCreate(){
entity_step = AlterStep;
sound = snd_text01;
}
//
//
//
//
//
//Alter Step
function AlterStep(){
sprite_index = spr_alter;
}
//
//
//
//
//
//Alter Text
function AlterText(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Courier Shrine"

//Draw Based on String Counter
var _SubString
if (string_counter = 0)
{
	speaker = 1;
	text_string = "Offer Beans, and be blessed with greater skills." 
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}

if (string_counter >= 1)
{
	text_script = AlterMenu;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_alter36,0,258+6,136+6);
}
//
//
//
//
//
//Alter Menu
function AlterMenu(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
draw_sprite_stretched(menu_sprite,3,258,136,48,48);
var _name = "Courier Shrine"
draw_text_transformed(259,130,_name,.35,.35,0);
draw_sprite(spr_npc_alter36,0,258+6,136+6);

//Draw Based on String Counter
//Get mouse location on GUI


//draw_text_transformed(68,28,"Press E to Exit",.5,.5,0);

//Lefthand Buttons
draw_sprite_stretched(menu_sprite,3,70,142,88,15);
draw_sprite_stretched(menu_sprite,3,164,142,88,15);
draw_sprite_stretched(menu_sprite,3,70,163,88,15);
draw_sprite_stretched(menu_sprite,3,164,163,88,15);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(114,149,"VITALITY",.5,.5,0);
draw_text_transformed(208,149,"ENERGY",.5,.5,0);
draw_text_transformed(114,170,"MIGHT",.5,.5,0);
draw_text_transformed(208,170,"GRACE",.5,.5,0);
//draw_text_transformed(40,158,"x(ARMOR)x",.5,.5,0);


if (point_in_rectangle(_mouseX,_mouseY,70,142,158,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		text_gui = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,142,252,157))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,140,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		text_gui = 2;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,70,163,158,177))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,68,161,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		text_gui = 3;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,164,163,252,177))//Select magic menu 
{
	draw_sprite_stretched(spr_highlight_nineslice,0,162,161,92,19);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text01,global.volumeMenu,1);
		audio_play_sound(snd_text01,0,false);
		text_gui = 4;
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
if (text_gui = 0) 
{
	
	draw_text_transformed(72,128,"Press E to Exit",.5,.5,0);
}
if (text_gui = 1) 
{
	draw_sprite_stretched(menu_sprite,3,80,36,160,96);
	draw_text_transformed(82,28,"Press E to Exit",.5,.5,0);
	DrawVitalityMenu();
}
if (text_gui = 2) 
{
	draw_sprite_stretched(menu_sprite,3,80,36,160,96);
	draw_text_transformed(82,28,"Press E to Exit",.5,.5,0);
	DrawEnergyMenu();
}
if (text_gui = 3) 
{
	draw_sprite_stretched(menu_sprite,3,80,36,160,96);
	draw_text_transformed(82,28,"Press E to Exit",.5,.5,0);
	DrawMightMenu();
}
if (text_gui = 4) 
{
	draw_sprite_stretched(menu_sprite,3,80,36,160,96);
	draw_text_transformed(82,28,"Press E to Exit",.5,.5,0);
	DrawGraceMenu();
}

if (keyboard_check_pressed(ord("E")))
{
	text_gui = 0;
	text_string = ""
	string_counter = 0;
	audio_sound_gain(snd_menu,global.volumeMenu,1);
	audio_play_sound(snd_menu,0,false);
	//_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
		
}

}


	
