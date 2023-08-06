// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_scene_00(){
sprite_index = spr_player_regaliare_idle;
image_index = 3;
image_speed = 0;
timer1 = timer1 + 1;
if (scene = false) 
{
	scene_script = -1;
	state_script = free_state;
	direction = 270;
	image_index = 3;
	timer1 = 0;
}
}
//
//
//
//
//
//Player Scene Text 01
function scr_player_scene_00_text(){
var _titleFade = (timer1/500);
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_white);
draw_sprite_ext(spr_home_title,0,80,42,1,1,0,c_white,min(_titleFade,1))
}