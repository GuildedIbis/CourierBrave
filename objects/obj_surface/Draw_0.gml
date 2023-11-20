/// @description Insert description here
if (global.dayPhase = 2)
{
	var _nightFade = min((obj_game.night_fade/1000),1)
	if (!surface_exists(night_surf))
	{
		night_surf = surface_create(room_width,room_height);
	}
	if (surface_exists(night_surf))
	{
		draw_surface(night_surf,0,0);
	}
	if (surface_exists(obj_surface.night_surf))
	{
		surface_set_target(obj_surface.night_surf);
		//draw_clear_alpha(c_white,0);
	
		draw_set_color(c_black);
		draw_sprite_stretched_ext(spr_lighting_box2,0,0,0,room_width,room_height,c_white,_nightFade);
		draw_set_color(c_white);
	
		with (obj_player)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,36,false);
			gpu_set_blendmode(bm_normal);
			
		}
	
		with (obj_projectile)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y,max(24,sprite_width+4),false);
				gpu_set_blendmode(bm_normal);
			}
		}
		
		with (obj_interactable)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,light_size+4,false);
				gpu_set_blendmode(bm_normal);
			}
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
		draw_sprite_stretched_ext(spr_lighting_box2,0,0,0,room_width,room_height,c_white,_nightFade);
		draw_set_color(c_white);
	
		with (obj_player)
		{
			gpu_set_blendmode(bm_subtract);
			draw_circle(x,y-4,28,false);
			gpu_set_blendmode(bm_normal);
			
		}
	
		with (obj_projectile)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y,max(20,sprite_width),false);
				gpu_set_blendmode(bm_normal);
			}
		}
		
		with (obj_interactable)
		{
			if (lit = true)
			{
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y-4,light_size,false);
				gpu_set_blendmode(bm_normal);
			}
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
}



