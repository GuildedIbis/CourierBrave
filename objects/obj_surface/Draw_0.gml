/// @description Insert description here
if (global.dayPhase = 2)
{
	if (surface_exists(night_surf))
	{
		draw_surface(night_surf,0,0);
	}
	if (surface_exists(obj_surface.night_surf))
	{
		surface_set_target(obj_surface.night_surf);
		//draw_clear_alpha(c_white,0);
	
		draw_set_color(c_black);
		draw_sprite_stretched(spr_lighting_box2,0,0,0,room_width,room_height);
		draw_set_color(c_white);
	
		with (obj_player)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,36,false);
			gpu_set_blendmode(bm_normal);
			
		}
	
		with (obj_npc)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,36,false);
				gpu_set_blendmode(bm_normal);
			}
		}
		draw_set_color(c_black);
		draw_sprite_stretched(spr_lighting_box2,0,0,0,room_width,room_height);
		draw_set_color(c_white);
	
		with (obj_player)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,28,false);
			gpu_set_blendmode(bm_normal);
			
		}
	
		with (obj_npc)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,28,false);
				gpu_set_blendmode(bm_normal);
			}
		}
	
		surface_reset_target();
	}
	else night_surf = surface_create(room_width,room_height)
}



