//Draw Entity

//Set Flash Shader
if (flash != 0)
{
	shader_set(sh_flash_white);
	shader_set_uniform_f(uni_flash,flash);
}


//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//??? Investigate
if (shader_current != -1)
{
	shader_reset();
}
