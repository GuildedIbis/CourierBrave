//Draw Event

//Draw Shadow
if (shadow = true)
{
	draw_sprite(spr_entity_shadow,shadow_size,x,y);
	//gpu_set_fog(true,c_black,0,1);
	//if (shadow_sprite != -1) draw_sprite_pos(shadow_sprite,image_index,sx1,sy1,sx2,sy2,sx3,sy3,sx4,sy4,.5)
	//else draw_sprite_pos(sprite_index,image_index,sx1,sy1,sx2,sy2,sx3,sy3,sx4,sy4,.5)
	//gpu_set_fog(false,c_white,0,0);
}

//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
