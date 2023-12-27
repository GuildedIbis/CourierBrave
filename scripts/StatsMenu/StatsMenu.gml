//Stats Menu
//
//
//
//
//
//Stats Menu GUI
function scr_menu_stats(){
//Get mouse location on GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Set
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Base and Title
draw_sprite_stretched(spr_menu_beveled,3,87,35,146,98);
draw_sprite_stretched(spr_menu,8,82,35,156,16);
draw_text_transformed(160,39,"COURIER STATS",1,1,0);

//Stat Buttons
draw_sprite_stretched(spr_menu_circle16,1,99,55,36,36);
draw_sprite(spr_menu_stat_vitality,obj_player.vitality,101,57);
if (point_in_rectangle(_mouseX,_mouseY,99,55,135,91))
{
	draw_sprite_stretched(spr_highlight_circle,0,98,54,38,38);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 0;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,142,55,36,36);
draw_sprite(spr_menu_stat_energy,obj_player.energy,144,57);
if (point_in_rectangle(_mouseX,_mouseY,142,55,178,91))
{
	draw_sprite_stretched(spr_highlight_circle,0,141,54,38,38);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 1;
	}
}
draw_sprite_stretched(spr_menu_circle16,1,185,55,36,36);
draw_sprite(spr_menu_stat_conviction,obj_player.conviction,187,57);
if (point_in_rectangle(_mouseX,_mouseY,185,55,221,91))
{
	draw_sprite_stretched(spr_highlight_circle,0,184,54,38,38);
	if (mouse_check_button_pressed(mb_left))
	{
		page = 2;
	}
}

//Select Stat Info
switch(page)
{
	case 0: 
		draw_set_halign(fa_left);
		var _maxHP = 200 + (25 * obj_player.vitality)
		var _nextHP = 200 + (25 * (obj_player.vitality + 1))
		var _describe = "Increases max health by 25.\n"+ string(_maxHP) + " > " + string(_nextHP);
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"VITALITY",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 1:
		draw_set_halign(fa_left);
		var _maxEN = 200 + (25 * obj_player.energy)
		var _nextEN = 200 + (25 * (obj_player.energy + 1))
		var _describe = "Increases max stamina by 25.\n"+ string(_maxEN) + " > " + string(_nextEN)
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"ENERGY",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
	
	case 2: 
		draw_set_halign(fa_left);
		var _maxCV = 200 + (25 * obj_player.conviction);
		var _nextCV = 200 + (25 * (obj_player.conviction + 1));
		var _describe = "Increases max charge by 25.\n"+ string(_maxCV) + " > " + string(_nextCV);
		draw_sprite_stretched(spr_menu,8,97,94,92,16);
		draw_text_transformed(101,98,"CONVICTION",1,1,0);
		draw_text_transformed(101,111,_describe,.5,.5,0);
	break;
}

//Purchase
if (page != -1)
{
	draw_set_halign(fa_center);
	draw_sprite_stretched(spr_menu,8,197,94,24,16);
	draw_sprite(spr_starOrb,0,209,98);
	draw_text_transformed(206,101,string(star_orb),.5,.5,0);
	if (star_orb > 0)
	{
		draw_sprite_stretched(spr_menu_circle16,1,193,112,32,16);
		draw_text_transformed(209,115,"PURCHASE\nLEVEL",.5,.5,0);
		if (point_in_rectangle(_mouseX,_mouseY,193,112,229,128))
		{
			draw_sprite_stretched(spr_highlight_circle,0,192,111,34,18);
			if (mouse_check_button_pressed(mb_left))
			{
				switch(page)
				{
					case 0: 
						obj_player.vitality = obj_player.vitality + 1;
						star_orb = star_orb - 1;
						scr_player_reset();
					break;
				
					case 1: 
						obj_player.energy = obj_player.energy + 1;
						star_orb = star_orb - 1;
						scr_player_reset();
					break;
				
					case 2: 
						obj_player.conviction = obj_player.conviction + 1;
						star_orb = star_orb - 1;
						scr_player_reset();
					break;
				}
			}
		}
	}
}
}

