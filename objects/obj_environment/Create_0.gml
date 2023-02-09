/// @description Insert description here
image_speed = 0;
game_paused_image_speed = 0;
if (environment_sprite != -1) sprite_index = environment_sprite;
if (environment_variations != 0) image_index = irandom_range(0,environment_variations - 1);
if (shift = true)
{
	x = x + (irandom_range(-4,4));
	y = y + (irandom_range(-4,4));
}
