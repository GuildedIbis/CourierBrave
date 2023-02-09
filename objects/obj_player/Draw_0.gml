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

if (dead = false) draw_sprite(spr_player_shadow,0,x,y);

draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);


if (shader_current != -1)
{
	shader_reset();
}

StatusEffectsDraw();
