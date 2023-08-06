// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_scene_00(){
sprite_index = spr_player_regaliare_idle;
image_index = 3;
image_speed = 0;
if (scene = false) 
{
	scene_script = -1;
	state_script = free_state;
}

}
//
//
//
//
//
//Player Scene Text 01
function scr_player_scene_00_text(){
draw_set_font(fnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(c_white);

}