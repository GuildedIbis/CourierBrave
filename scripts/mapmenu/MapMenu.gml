//Map
//
//
//
//
//
//Maps
function MapsCreate(){
map_selected = LenkoMapMenuDraw;
map_grid = ds_grid_create(6,3);
region_grid = ds_grid_create(6,3);
region_grid[# 0, 0] = "Lenko Woodlands"
region_grid[# 0, 1] = true;
region_grid[# 0, 2] = LenkoMapMenuDraw;
region_grid[# 1, 0] = "Lenko Woodlands"
region_grid[# 1, 1] = false;
region_grid[# 1, 2] = LenkoMapMenuDraw;
region_grid[# 2, 0] = "Lenko Woodlands"
region_grid[# 2, 1] = false;
region_grid[# 2, 2] = LenkoMapMenuDraw;
region_grid[# 3, 0] = "Lenko Woodlands"
region_grid[# 3, 1] = false;
region_grid[# 3, 2] = LenkoMapMenuDraw;
region_grid[# 4, 0] = "Lenko Woodlands"
region_grid[# 4, 1] = false;
region_grid[# 4, 2] = LenkoMapMenuDraw;
region_grid[# 5, 0] = "Lenko Woodlands"
region_grid[# 5, 1] = false;
region_grid[# 5, 2] = LenkoMapMenuDraw;


map_grid[# 0, 0] = "Farway Road"
map_grid[# 0, 1] = false;
map_grid[# 0, 2] = Idle;
map_grid[# 1, 0] = "Lake Path"
map_grid[# 1, 1] = false;
map_grid[# 1, 2] = Idle;
map_grid[# 2, 0] = "Greyrock"
map_grid[# 2, 1] = false;
map_grid[# 2, 2] = Idle;
map_grid[# 3, 0] = "Habraf Lake"
map_grid[# 3, 1] = false;
map_grid[# 3, 2] = Idle;
map_grid[# 4, 1] = "Yakflower Path";
map_grid[# 4, 1] = false;
map_grid[# 4, 2] = Idle;
map_grid[# 5, 0] = "Beaowire Fortress";
map_grid[# 5, 1] = true;
map_grid[# 5, 2] = Idle;
}
//
//
//
//
//
//Map GUI
function MapMenuGUI(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


//Slider
draw_sprite(spr_scroll_bar1b,page,68,43);
//if (point_in_rectangle(_mouseX,_mouseY,69,41,77,47))
//{
//	draw_sprite(spr_scroll_highlight,0,69,41);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (page > 0) page = page - 1;
//		else page = 1;
//	}
//}
//if (point_in_rectangle(_mouseX,_mouseY,69,114,77,119))
//{
//	draw_sprite(spr_scroll_highlight,1,69,114);
//	if (mouse_check_button_pressed(mb_left))
//	{
//		if (page < 1) page = page + 1;
//		else page = 0;
//	}
//}

//Buttons
//draw_sprite_stretched(button_sprite,2,70,41,14,14);
//draw_sprite_stretched(button_sprite,2,70,57,14,14);
//draw_sprite_stretched(button_sprite,2,70,73,14,14);
//draw_sprite_stretched(button_sprite,2,70,89,14,14);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_sprite_stretched(menu_sprite,3,103,41,147,86);
draw_sprite_part(spr_mapBackground,0,0,55,139,78,107,45);

for (var i = 0; i < 5; i = i + 1)
{
	draw_sprite_stretched(button_sprite,3,80,42 + (i * 17),15,15);
	if (obj_inventory.region_grid[# i, 1] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_ext(spr_map_button,i,80,42+(i*17),1.0,1.0,0,c_white,1.0);
		if (point_in_rectangle(_mouseX,_mouseY,80,42 + (i * 15),94,57 + (i * 15)))
		{
			draw_sprite_stretched(spr_highlight_nineslice,0,78,40 + (i * 17),19,19);
			if (mouse_check_button_pressed(mb_left))
			{
				audio_sound_gain(snd_menu,global.volumeMenu,1);
				audio_play_sound(snd_menu,0,false);
				map_selected = obj_inventory.region_grid[# i, 2];
			}
		}
	}
	else draw_sprite_ext(spr_lock,1,85,50+(i*17),1,1,0,c_white,1.0);
}
if (map_selected != -1)
{
	//draw_sprite_ext(spr_map,obj_inventory.map_selected,107,45,1.0,1.0,0,c_white,1);
	script_execute(map_selected)
}
if (room_num != -1)
{
	var _x = (107 + obj_inventory.room_ary[room_num][1])
	var _y = (45 + obj_inventory.room_ary[room_num][2])
	draw_sprite(spr_map_pointer,0,_x,_y);
}








}
//
//
//
//
//
//Lenk Map Menu Draw
function LenkoMapMenuDraw(){
//var _mouseX = device_mouse_x_to_gui(0);
//var _mouseY = device_mouse_y_to_gui(0);
//0 Camp
//1 Lair
//2 Dungeon
//3 Chest
//4 Moon Chest
//5 Mini-Boss
//6	Lair Boss
//7 Main Boss
//Camps

for (var i = 0; i < 6; i = i + 1)
{
	//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
	if (obj_inventory.map_grid[# i, 1] = true)
	{
		//draw_sprite_ext(spr_map,i,107,45,1.0,1.0,0,c_white,1.0);
		draw_sprite_part(spr_map,i,0,55,139,78,107,45);
		
	}
}
//if (obj_inventory.camp_grid[# 0, 3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,0,160,48,1,1,0,c_white,1);
//	if (point_in_rectangle(_mouseX,_mouseY,156,44,164,52))
//	{
//		draw_sprite_stretched(spr_menu_beveled,3,258,36,60,96);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_middle);
//		draw_set_color(c_white);
//		draw_set_font(fnt_text);
//		draw_text_transformed(262,32,"CAMP",.5,.5,0);
//		draw_text_transformed(262,44,"- Kovalad's Smithy",.35,.35,0);
//		draw_text_transformed(262,54,"- Kovalad the Smith",.35,.35,0);
//		draw_text_transformed(262,64,"- Nisma the Browi",.35,.35,0);
//		draw_text_transformed(262,74,"- Courier Crash Site",.35,.35,0);
//	}
//}
//if (obj_inventory.camp_grid[# 1, 3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,0,215,48,1,1,0,c_white,1);
//	if (point_in_rectangle(_mouseX,_mouseY,211,44,219,52))
//	{
//		draw_sprite_stretched(spr_menu_beveled,3,258,36,60,96);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_middle);
//		draw_set_color(c_white);
//		draw_set_font(fnt_text);
//		draw_text_transformed(262,32,"CAMP",.5,.5,0);
//		draw_text_transformed(262,44,"- Yakflower Path",.35,.35,0);
//		draw_text_transformed(262,54,"- Unknown the Browi",.35,.35,0);
//		draw_text_transformed(262,64,"- Yakflower Path\nlair",.35,.35,0);
//	}
//}
//if (obj_inventory.camp_grid[# 2, 3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,0,122,119,1,1,0,c_white,1);
//	if (point_in_rectangle(_mouseX,_mouseY,118,115,126,123))
//	{
//		draw_sprite_stretched(spr_menu_beveled,3,258,36,60,96);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_middle);
//		draw_set_color(c_white);
//		draw_set_font(fnt_text);
//		draw_text_transformed(262,32,"CAMP",.5,.5,0);
//		draw_text_transformed(262,44,"- Habraf Lake",.35,.35,0);
//		draw_text_transformed(262,54,"- Andor the Browi",.35,.35,0);
//		draw_text_transformed(262,64,"- Habraf Lake lair",.35,.35,0);
//	}
//}
//if (obj_inventory.camp_grid[# 3, 3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,0,160,100,1,1,0,c_white,1);
//	if (point_in_rectangle(_mouseX,_mouseY,156,96,164,104))
//	{
//		draw_sprite_stretched(spr_menu_beveled,3,258,36,60,96);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_middle);
//		draw_set_color(c_white);
//		draw_set_font(fnt_text);
//		draw_text_transformed(262,32,"CAMP",.5,.5,0);
//		draw_text_transformed(262,44,"- Zerwerk's Hideout",.35,.35,0);
//	}
//}

//if (obj_inventory.quest_grid[# 8,0] = true) 
//{
//	draw_sprite_ext(spr_map_icon,1,240,140,1,1,0,c_white,1);
//}
//if (obj_inventory.quest_grid[# 8,3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,1,250,140,1,1,0,c_white,1);
//}
//if (obj_inventory.quest_grid[# 8,3] = true) 
//{
//	draw_sprite_ext(spr_map_icon,1,260,140,1,1,0,c_white,1);
//}
}