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
	draw_sprite(spr_entity_shadow,shadow_size,x,y);
}
//Draw Self
draw_sprite_ext(sprite_index,image_index,x,y-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

if (obj_game.gamePaused = false)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,interact)) and (interact != -1)
	{
		interact_timer = interact_timer - 1;
		if (interact_timer <= 0)
		{
			interact_index = interact_index + 1;
			interact_timer = 15;
			if (interact_index > 7)
			{
				interact_index = 0;
			}
		}
		draw_sprite(spr_player_interact,interact_index,x,y-interact);
	}
}
//??? Investigate
if (shader_current != -1)
{
	shader_reset();
}
