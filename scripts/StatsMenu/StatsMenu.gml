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


//Menu Base and Buttons
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,88);
draw_sprite_stretched(spr_menu_beveled,3,80,127,39,16);
draw_sprite_stretched(spr_menu,8,39,35,120,16);

//Static Text
var _starOrbs = string(obj_inventory.star_orb);

draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text_transformed(102,38,"COURIER STATS",.6,.6,0);
draw_set_halign(fa_right);
draw_text_transformed(104,131,_starOrbs,.35,.35,0);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text_transformed(101,38,"COURIER STATS",.6,.6,0);
draw_set_halign(fa_right);
draw_text_transformed(103,131,_starOrbs,.35,.35,0);
draw_sprite(spr_starOrb,0,106,131);

//Left Side Button Grid
for(var i = 0; i < 8; i = i + 1)
{
	var _originX = 50 + (26 * (i mod 4));
	var _originY = 53 + (34 * (i div 4));
	draw_sprite_stretched(spr_menu_circle16,1,_originX,_originY,21,21);
	draw_sprite(spr_menu_player_stat,i,_originX + 3,_originY+ 3);
	if (point_in_rectangle(_mouseX,_mouseY,_originX,_originY,_originX+21,_originY+21))
	{
		draw_sprite_stretched(spr_highlight_circle,0,_originX - 1,_originY - 1,23,23);
		if (mouse_check_button_pressed(mb_left))
		{
			audio_sound_gain(snd_menu,global.volumeMenu,1);
			audio_play_sound(snd_menu,0,false);
			page = i;
		
		}
	}
	switch (i)
	{
		case 0: draw_sprite(spr_menu_playerStat_level,obj_player.vitality,_originX - 1,_originY + 22); break;
		case 1: draw_sprite(spr_menu_playerStat_level,obj_player.iteration,_originX - 1,_originY + 22); break;
		case 2: draw_sprite(spr_menu_playerStat_level,obj_player.conviction,_originX - 1,_originY + 22); break;
		case 3: draw_sprite(spr_menu_playerStat_level,obj_player.grace,_originX - 1,_originY + 22); break;
		case 4: draw_sprite(spr_menu_playerStat_level,obj_player.might,_originX - 1,_originY + 22); break;
		case 5: draw_sprite(spr_menu_playerStat_level,obj_player.divinity,_originX - 1,_originY + 22); break;
		case 6: draw_sprite(spr_menu_playerStat_level,obj_player.energy,_originX - 1,_originY + 22); break;
		case 7: draw_sprite(spr_menu_playerStat_level,obj_player.receptivity,_originX - 1,_originY + 22); break;
	}
}


//Right Side of Menu
DrawSelectedStat();


}
//
//
//
//
//
//Draw Selected Stat
function DrawSelectedStat(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _midX = 222;
var _leftX = 167;
var _titleY = 38;
var _descY = 56;
var _lvlY = 91;
var _statY = 112;
var _buttonY = 127;

draw_sprite(spr_menu_rope,3,176,77);
draw_sprite(spr_menu_rope,3,262,77);
draw_sprite(spr_menu_rope,3,176,99);
draw_sprite(spr_menu_rope,3,262,99);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,44);
draw_sprite_stretched(spr_menu_beveled,3,166,85,110,16);
draw_sprite_stretched(spr_menu_beveled,3,166,107,110,16);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_sprite_stretched(spr_menu_player_stat,page,260,35,16,16);
draw_sprite_stretched(spr_menu_circle16,3,167,127,50,16);
	

switch(page)
{
	case -1:
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		draw_set_color(c_black);
		draw_text_transformed(167,42,"SELECT A STAT",.5,.5,0);
		draw_text_transformed(167,56,"Level up your stats with Star Orbs",.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(166,42,"SELECT A STAT",.5,.5,0);
		draw_text_transformed(166,56,"Level up your stats with Star Orbs",.35,.35,0); 
	break;
	
	case 0:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _level = "Level: " + string(obj_player.vitality) + " > " + string(obj_player.vitality+1);
		var _stat = "Max health: " + string(200 + (20 * (obj_player.vitality))) + ">" + string(200 + (20 * (obj_player.vitality + 1)));
		var _title = "VITALITY";
		var _describe = "Increases max health by 20.\nBase health 200.";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_stat,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_stat,.35,.35,0);
	
		//Cost Button
		if (obj_player.vitality < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.vitality + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.vitality + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.vitality)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.vitality + 1);
					obj_player.vitality = obj_player.vitality + 1;
					if (obj_player.vitality > 10) obj_player.vitality = 1;
					obj_player.max_hp = 200 + (20 * obj_player.vitality);
					obj_player.hp = obj_player.max_hp;
		
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 1:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _level = "Level: " + string(obj_player.iteration) + " > " + string(obj_player.iteration+1);
		var _stat = "Crull Stone Uses: " + string(obj_player.iteration + 1) + ">" + string(obj_player.iteration + 2);
		var _title = "ITERATION";
		var _describe = "Increases the number of times the Crull\nStone can be used.\nVisit Alters to refill the uses.";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_stat,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_stat,.35,.35,0);
	
		//Cost Button
		if (obj_player.iteration < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.iteration + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.iteration + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.iteration)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.iteration + 1);
					obj_player.iteration = obj_player.iteration + 1;
					obj_player.max_crull_stone = obj_player.max_crull_stone + 1;
					obj_player.crull_stone = obj_player.crull_stone + 1;
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 2:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _level = "Level: " + string(obj_player.conviction) + " > " + string(obj_player.conviction+1);
		var _stat = "Max charge: " + string(100 + ((obj_player.conviction) * 10)) + ">" + string(100 + ((obj_player.conviction + 1) * 10));
		var _title = "CONVICTION";
		var _describe = "Increases the max amount of charge\nfor using crystal and special attacks.";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_stat,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_stat,.35,.35,0);
	
		//Cost Button
		if (obj_player.conviction < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.conviction + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.conviction + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.conviction)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.conviction + 1);
					obj_player.conviction = obj_player.conviction + 1;
					obj_player.max_charge = 100 + (obj_player.conviction * 10)
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;

	
	case 3:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _level = "Level: " + string(obj_player.grace) + " > " + string(obj_player.grace+1);
		var _stat = "Selected Crystal Damage: " + "???" + ">" + "???";
		var _title = "GRACE";
		var _describe = "Increases the amount of damage\ndone with crystal attacks.\n(LEFT CLICK)";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_stat,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_stat,.35,.35,0);
	
		//Cost Button
		if (obj_player.grace < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.grace + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.grace + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.grace)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.grace + 1);
					obj_player.grace = obj_player.grace + 1;
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 4:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _level = "Level: " + string(obj_player.might) + " > " + string(obj_player.might+1);
		var _stat = "Selected Weapon Damage: " + "???" + ">" + "???";;
		var _title = "MIGHT";
		var _describe = "Increases the amount of damage\ndone with weapon attacks.\n(RIGHT CLICK)";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_stat,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_level,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_stat,.35,.35,0);
	
		//Cost Button
		if (obj_player.might < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.might + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.might + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.might)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.might + 1);
					obj_player.might = obj_player.might + 1;
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 5:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _vitLevel = "Level: " + string(obj_player.divinity) + " > " + string(obj_player.divinity+1);
		var _health = "Selected Special Damage: " + "???" + ">" + "???";;
		var _title = "DIVINITY";
		var _describe = "Increases the amount of damage\ndone with special attacks\n(LEFT SHIFT)";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_health,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_health,.35,.35,0);
	
		//Cost Button
		if (obj_player.divinity < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.divinity + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.divinity + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.divinity)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.divinity + 1);
					obj_player.divinity = obj_player.divinity + 1;
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 6:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _vitLevel = "Level: " + string(obj_player.energy) + " > " + string(obj_player.energy+1);
		var _health = "Max Stamina: " + string(100 + (obj_player.energy * 50)) + ">" + string(100 + ((obj_player.energy + 1) * 50));
		var _title = "ENERGY";
		var _describe = "Increases the Courier's max stamina.\nEach roll costs 50 stamina.\nBase stamina 100.";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_health,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_health,.35,.35,0);
	
		//Cost Button
		if (obj_player.energy < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.energy + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.energy + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.energy)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.energy + 1);
					obj_player.energy = obj_player.energy + 1;
					obj_player.max_stamina = 100 + (obj_player.energy * 50);
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
	
	case 7:
		//Main Text
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(fnt_text);
		var _vitLevel = "Level: " + string(obj_player.receptivity) + " > " + string(obj_player.receptivity+1);
		var _health = "Crull Stone heal amount: " + string(100 + (obj_player.receptivity * 25)) + ">" + string(100 + ((obj_player.receptivity + 1) * 25));
		var _title = "RECEPTIVITY";
		var _describe = "Increases the amount of health\nrestored by the Crull Stone.";
		draw_set_color(c_black);
		draw_text_transformed(_midX+1,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX+1,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX+1,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX+1,_statY,_health,.35,.35,0); 
		draw_set_color(c_white);
		draw_text_transformed(_midX,_titleY,_title,.6,.6,0);
		draw_text_transformed(_midX,_descY,_describe,.35,.35,0); 
		draw_text_transformed(_midX,_lvlY,_vitLevel,.35,.35,0); 
		draw_text_transformed(_midX,_statY,_health,.35,.35,0);
	
		//Cost Button
		if (obj_player.receptivity < 10)
		{
			draw_sprite_stretched(spr_menu_beveled,3,252,127,24,16);
			draw_sprite(spr_starOrb,0,265,131);
			draw_set_halign(fa_right);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_leftX + 40,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_leftX + 39,_buttonY + 5,"LEVEL UP",.35,.35,0);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(264,133,string(obj_player.receptivity + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(263,133,string(obj_player.receptivity + 1)+"\n("+string(obj_inventory.star_orb)+")",.35,.35,0);
			if (point_in_rectangle(_mouseX,_mouseY,_leftX,_buttonY,_leftX+50,_buttonY + 16))//Level
			{
				draw_sprite_stretched(spr_highlight_circle,0,_leftX-1,_buttonY - 1,52,18);
				if (mouse_check_button_pressed(mb_left)) and (obj_inventory.star_orb > obj_player.receptivity)
				{
					audio_sound_gain(snd_menu,global.volumeMenu,1);
					audio_play_sound(snd_menu,0,false);
					obj_inventory.star_orb = obj_inventory.star_orb - (obj_player.receptivity + 1);
					obj_player.receptivity = obj_player.receptivity + 1;
				}
			}
		}
		else
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_black);
			draw_text_transformed(_midX,_buttonY + 5,"Max Level",.35,.35,0);
			draw_set_color(c_white);
			draw_text_transformed(_midX - 1,_buttonY + 5,"Max Level",.35,.35,0);
		}
	break;
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