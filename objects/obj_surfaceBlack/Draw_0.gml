/// @description Insert description here
if (!surface_exists(black_surf))
{
	black_surf = surface_create(room_width,room_height);
}
if (surface_exists(black_surf))
{
	draw_surface(black_surf,0,0);
}
if (surface_exists(obj_surfaceBlack.black_surf))
{
	surface_set_target(obj_surfaceBlack.black_surf);
	//draw_clear_alpha(c_white,0);
	
	draw_set_color(c_black);
	draw_sprite_stretched(spr_lighting_box_black,0,0,0,room_width,room_height);
	draw_set_color(c_white);
	
	with (obj_player)
	{
		gpu_set_blendmode(bm_subtract);
		draw_circle(x,y-4,48,false);
		gpu_set_blendmode(bm_normal);
			
	}
	
	with (obj_light)
	{
	
		if (solar = false)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,48,false);
			gpu_set_blendmode(bm_normal);
		}
		else
		{
			if (global.dayPhase != 2)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,48,false);
				gpu_set_blendmode(bm_normal);
			}
		}
	}
	draw_set_color(c_black);
	draw_sprite_stretched(spr_lighting_box_black,0,0,0,room_width,room_height);
	draw_set_color(c_white);
	
	with (obj_player)
	{
		gpu_set_blendmode(bm_subtract);
		draw_circle(x,y-4,40,false);
		gpu_set_blendmode(bm_normal);
			
	}
	
	with (obj_light)
	{
		if (solar = false)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,40,false);
			gpu_set_blendmode(bm_normal);
		}
		else
		{
			if (global.dayPhase != 2)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,40,false);
				gpu_set_blendmode(bm_normal);
			}
		}
	}
	
	surface_reset_target();
}
else night_surf = surface_create(room_width,room_height)




