//Draw Entity

//Set Flash Shader
if (flash != 0)
{
	shader_set(sh_flash_white);
	shader_set_uniform_f(uni_flash,flash);
}

//Draw Shadow
if (shadow = true)
{
	gpu_set_fog(true,c_black,0,1);
	if (shadow_sprite != -1) draw_sprite_pos(shadow_sprite,image_index,sx1,sy1,sx2,sy2,sx3,sy3,sx4,sy4,.5)
	else draw_sprite_pos(sprite_index,image_index,sx1,sy1,sx2,sy2,sx3,sy3,sx4,sy4,.5)
	gpu_set_fog(false,c_white,0,0);
}

//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//??? Investigate
if (shader_current != -1)
{
	shader_reset();
}
