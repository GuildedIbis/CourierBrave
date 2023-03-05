//Draw Effect
if (shadow = true)
{
	gpu_set_fog(true,c_black,0,1);
	draw_sprite_pos(sprite_index,image_index,sx1,sy1,sx2,sy2,sx3,sy3,sx4,sy4,.5)
	gpu_set_fog(false,c_black,0,1);
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
