//Draw
if (flash != 0)
{
	shader_set(sh_flash_white);
	shader_set_uniform_f(uni_flash,flash);
	if (flash > .4) and (flash < .6)
	{
		image_alpha = 0;
	}
	else image_alpha = 1;
}

//if (dead = false) draw_sprite(spr_player_shadow,0,x,y);
var _x1 = x - 4 + 4;
var _y1 = y - 8;
var _x2 = x + 4 + 4;
var _y2 = y - 8
var _x3 = x + 4;
var _y3 = y;
var _x4 = x - 4;
var _y4 = y;

gpu_set_fog(true,c_black,0,1);
draw_sprite_pos(sprite_index,image_index,_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4,.5)
gpu_set_fog(false,c_black,0,1);
event_inherited();
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);


if (shader_current != -1)
{
	shader_reset();
}

StatusEffectsDraw();
