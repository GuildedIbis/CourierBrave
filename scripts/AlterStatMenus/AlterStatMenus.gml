//Alter Stat Menus
//
//
//
//
//Draw Vitatity Menu
function DrawVitalityMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Buttons (Draw) 
var _cost = (obj_player.vitality * round(obj_player.vitality/2)) + obj_player.might + obj_player.grace;
draw_sprite_stretched(menu_sprite,3,140,106,40,13);
draw_sprite(spr_bean,0,147,113);

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _vitLevel = "Level: " + string(obj_player.vitality) + " > " + string(obj_player.vitality+1);
var _health = "Increases max health (NEXT: " + string(150 + (3* ((obj_player.vitality + 1) + round((obj_player.vitality+1)/15)))) + ")";
draw_set_color(c_black);
draw_text_transformed(161,46,"VITALITY",1.0,1.0,0);
draw_text_transformed(161,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(161,84,_vitLevel,.6,.6,0); 
draw_text_transformed(161,96,_health,.6,.6,0); 
draw_text_transformed(161,113,_cost,.6,.6,0)
draw_set_color(c_white);
draw_text_transformed(160,46,"VITALITY",1.0,1.0,0);
draw_text_transformed(160,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(160,84,_vitLevel,.6,.6,0); 
draw_text_transformed(160,96,_health,.6,.6,0);
draw_text_transformed(160,113,_cost,.6,.6,0)


//Buttons Mechanics
if (point_in_rectangle(_mouseX,_mouseY,140,106,180,119))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,138,104,44,17);
	if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
	{
		audio_sound_gain(snd_text02,global.volumeEffects,1);
		audio_play_sound(snd_text02,0,false);
		obj_player.beans = obj_player.beans - _cost;
		obj_player.vitality = obj_player.vitality + 1;
		obj_player.max_hp = 150 + (3* (obj_player.vitality + round(obj_player.vitality/15)));
		obj_player.hp = obj_player.max_hp;
		//Reset Buy/Sell Menu
	}
	draw_text_transformed(160,126,"Level Up!",.5,.5,0)
}
}
//
//
//
//
//Draw Energy Menu
function DrawEnergyMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Buttons (Draw) 
var _cost = (obj_player.energy * round(obj_player.energy/2)) + obj_player.vitality + obj_player.might + obj_player.grace;
draw_sprite_stretched(menu_sprite,3,140,106,40,13);
draw_sprite(spr_bean,0,147,113);

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _energyLevel = "Level: " + string(obj_player.energy) + " > " + string(obj_player.energy+1);
var _timer = "Increases max stamina (NEXT: " + string(50 + (3* ((obj_player.energy+1) + round((obj_player.energy+1)/15)))) + ")";
draw_set_color(c_black);
draw_text_transformed(161,46,"ENERGY",1.0,1.0,0);
draw_text_transformed(161,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(161,84,_energyLevel,.6,.6,0); 
draw_text_transformed(161,96,_timer,.6,.6,0); 
draw_text_transformed(161,113,_cost,.6,.6,0)
draw_set_color(c_white);
draw_text_transformed(160,46,"ENERGY",1.0,1.0,0);
draw_text_transformed(160,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(160,84,_energyLevel,.6,.6,0); 
draw_text_transformed(160,96,_timer,.6,.6,0);
draw_text_transformed(160,113,_cost,.6,.6,0)


//Buttons Mechanics
if (point_in_rectangle(_mouseX,_mouseY,140,106,180,119))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,138,104,44,17);
		if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
		{
			audio_sound_gain(snd_text02,global.volumeEffects,1);
			audio_play_sound(snd_text02,0,false);
			obj_player.beans = obj_player.beans - _cost;
			obj_player.energy = obj_player.energy + 1;	
			obj_player.max_stamina = 50 + (3* (obj_player.energy + round(obj_player.energy/15)))
			//Reset Buy/Sell Menu
		}
		draw_text_transformed(160,126,"Level Up!",.5,.5,0)
	}
}
//
//
//
//
//Draw Might Menu
function DrawMightMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Buttons (Draw) 
var _cost = (obj_player.might * round(obj_player.might/2)) + obj_player.vitality + obj_player.grace;
draw_sprite_stretched(menu_sprite,3,140,106,40,13);
draw_sprite(spr_bean,0,147,113);

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _mightLevel = "Level: " + string(obj_player.might) + " > " + string(obj_player.might+1);
var _might = "Applies to weapon skills.";
draw_set_color(c_black);
draw_text_transformed(161,46,"MIGHT",1.0,1.0,0);
draw_text_transformed(161,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(161,84,_mightLevel,.6,.6,0); 
draw_text_transformed(161,96,_might,.6,.6,0); 
draw_text_transformed(161,113,_cost,.6,.6,0)
draw_set_color(c_white);
draw_text_transformed(160,46,"MIGHT",1.0,1.0,0);
draw_text_transformed(160,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(160,84,_mightLevel,.6,.6,0); 
draw_text_transformed(160,96,_might,.6,.6,0);
draw_text_transformed(160,113,_cost,.6,.6,0)


//Buttons Mechanics
if (point_in_rectangle(_mouseX,_mouseY,140,106,180,119))
	{
		draw_sprite_stretched(spr_highlight_nineslice,0,138,104,44,17);
		if (mouse_check_button_pressed(mb_left)) and (obj_player.beans >= _cost)
		{
			audio_sound_gain(snd_text02,global.volumeEffects,1);
			audio_play_sound(snd_text02,0,false);
			obj_player.beans = obj_player.beans - _cost;
			obj_player.might = obj_player.might + 1;
			//Reset Buy/Sell Menu
		}
		draw_text_transformed(160,126,"Level Up!",.5,.5,0)
	}
}
//
//
//
//
//Draw Grace Menu
function DrawGraceMenu(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Buttons (Draw) 
var _cost = (obj_player.grace* round(obj_player.grace/2)) + obj_player.vitality + obj_player.might;
draw_sprite_stretched(menu_sprite,3,140,106,40,13);
draw_sprite(spr_bean,0,147,113);

//Text
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _graceLevel = "Level: " + string(obj_player.grace) + " > " + string(obj_player.grace+1);
var _grace = "Increases max charge (NEXT: " + string(50 + (3* ((obj_player.grace+1) + round((obj_player.grace+1)/15)))) + ")";;
draw_set_color(c_black);
draw_text_transformed(161,46,"GRACE",1.0,1.0,0);
draw_text_transformed(161,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(161,84,_graceLevel,.6,.6,0); 
draw_text_transformed(161,96,_grace,.6,.6,0); 
draw_text_transformed(161,113,_cost,.6,.6,0)
draw_set_color(c_white);
draw_text_transformed(160,46,"GRACE",1.0,1.0,0);
draw_text_transformed(160,72,"NOW > NEXT",.75,.75,0); 
draw_text_transformed(160,84,_graceLevel,.6,.6,0); 
draw_text_transformed(160,96,_grace,.6,.6,0);
draw_text_transformed(160,113,_cost,.6,.6,0)



//Buttons Mechanics
if (point_in_rectangle(_mouseX,_mouseY,140,106,180,119))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,138,104,44,17);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_text02,global.volumeEffects,1);
		audio_play_sound(snd_text02,0,false);
		if (obj_player.beans >= _cost)
		{
			obj_player.beans = obj_player.beans - _cost;
			obj_player.grace = obj_player.grace + 1;
			obj_player.max_charge = 50 + (3* (obj_player.grace + round(obj_player.grace/15)))
			//obj_player.magic = obj_player.magic - 1;
		}
		//Reset Buy/Sell Menu
	}
	draw_text_transformed(160,126,"Level Up!",.5,.5,0)
}
}