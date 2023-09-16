//Quest Menu
//
//
//
//
//
//Draw Stats
function scr_menu_quest(){
//Does not include mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Buttons Alignment
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Menu Base and Buttons
draw_sprite_stretched(spr_menu_beveled,3,44,35,110,96);
draw_sprite_stretched(spr_menu,8,39,35,120,16);
draw_set_color(c_white);
draw_text_transformed(101,43,"QUESTS",1,1,0);


//Slider
draw_sprite(spr_scroll_bar5b,page,139,52);
if (point_in_rectangle(_mouseX,_mouseY,139,52,147,58))
{
	draw_sprite(spr_scroll_highlight,0,139,51);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page > 0) page = page - 1;
		else page = 4;
	}
}
if (point_in_rectangle(_mouseX,_mouseY,139,120,147,126))
{
	draw_sprite(spr_scroll_highlight,1,139,119);
	if (mouse_check_button_pressed(mb_left))
	{
		if (page < 4) page = page + 1;
		else page = 0;
	}
}



//Button Mechanics
for (var i = 0; i < 20; i = i + 1)
{
	var _originX = 50 + (18 * (i mod 5));
	var _originY = 53 + (18 * (i div 5));
	draw_sprite_stretched(spr_menu_circle16,1,_originX,_originY,16,16);
	var _iPage = i + (20*page);
	if (obj_inventory.quest_grid[# _iPage, 0] = true)
	{
		if (obj_inventory.quest_grid[# _iPage, 3] = true)
		{
			draw_set_color(c_white);
			draw_text_transformed(_originX + 9,_originY + 9,"V",1,1,0);
		}
		else
		{
			draw_set_color(c_green);
			draw_text_transformed(_originX + 9,_originY + 9,"O",1,1,0);
		}
		if (point_in_rectangle(_mouseX,_mouseY,_originX,_originY,_originX+16,_originY+16))
		{
			draw_sprite_stretched(spr_highlight_circle,0,_originX-1,_originY-1,18,18);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				slot = _iPage
				//selected_info = obj_inventory.quest_grid[# _iPage, 5];
			}
		}
	}
	//else draw ?
	else
	{
		draw_set_color(c_red);
		draw_text_transformed(_originX + 9,_originY + 9,"?",1,1,0);
	}
}

//Draw Selected Quest
//script_execute(selected_info);
scr_menu_quest_selected(slot);

}	
//
//
//
//
//
//Quest Selected
function scr_menu_quest_selected(_questNum){
//mouse conversion to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _midX = 222;
var _leftX = 167;
var _titleY = 38;
var _descY = 56;
var _compY = 111;

//Draw
draw_set_font(global.fnt_main_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu_beveled,3,166,35,110,96);
draw_sprite_stretched(spr_menu,8,161,35,120,16);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (slot = -1)
{
	var _headerText = "SELECT A QUEST"
	var _desc = "\"O\" marks a quest you've started,\n\"V\" marks a quest you've completed."

}
else
{
	
	var _headerText = quest_grid[# _questNum, 6]
	var _desc = quest_grid[# _questNum, 5]
}

draw_set_color(c_white);
draw_text_transformed(_midX-1,_titleY,_headerText,1,1,0);
draw_text_transformed(_midX-1,_descY,_desc,.5,.5,0);
//draw_text_transformed(168,114,"TRACK",.35,.35,0);

//if(point_in_rectangle(_mouseX,_mouseY,162,110,194,123))
//{
//	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,17);
//	obj_player.tracking_quest = TheCourierActiveDraw;
//}
}