//Quest Menu
//
//
//
//
//
//Draw Stats
function QuestMenuGUI(){
//Does not include mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Slider
draw_sprite(spr_scroll_bar2b,page,68,43);
if (point_in_rectangle(_mouseX,_mouseY,69,43,77,49))
{
	draw_sprite(spr_scroll_highlight,0,69,43);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 1;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,69,116,77,121))
{
	draw_sprite(spr_scroll_highlight,1,69,116);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 1) page = page + 1;
		else page = 0;
	}
}

//Buttons Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

//Button Surface Sprites
draw_sprite_stretched(spr_menu,3,80,42,79,15);
draw_sprite_stretched(spr_menu,3,80,59,79,15);
draw_sprite_stretched(spr_menu,3,80,76,79,15);
draw_sprite_stretched(spr_menu,3,80,93,79,15);
draw_sprite_stretched(spr_menu,3,80,110,79,15);

//Button Mechanics
for (var i = 0; i < 5; i = i + 1)
{
	var _iPage = i + (5*page);
	if (obj_inventory.quest_grid[# _iPage, 0] = true)
	{
		draw_text_transformed(86,46+(17*i),obj_inventory.quest_grid[# _iPage, 6],.35,.35,0);
		if (point_in_rectangle(_mouseX,_mouseY,80,42+(17*i),159,59+(17*i)))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,78,40+(17*i),83,19);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				selected_info = obj_inventory.quest_grid[# _iPage, 5];
			}
		}
	}
	else draw_text_transformed(86,46+(17*i),"???",.35,.35,0);
}

//Draw Selected Quest
script_execute(selected_info);

}	