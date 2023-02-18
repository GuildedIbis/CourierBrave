//Draw
//
//
//
//
//
if (bullet = true)
{
	draw_self();	
}
else
{
	//Draw Shadow
	if (shadow != -1)
	{
		//var _x1 = x - (sprite_width/2) + 6;
		//var _y1 = y - (sprite_height)
		//var _x2 = x + (sprite_width/2) + 6;
		//var _y2 = y - (sprite_height)
		//var _x3 = x + (sprite_width/2);
		//var _y3 = y;
		//var _x4 = x - (sprite_width/2);
		//var _y4 = y;

		//gpu_set_fog(true,c_black,0,1);
		//draw_sprite_pos(sprite_index,image_index,_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4,.5)
		//gpu_set_fog(false,c_black,0,1);
	}
	
	
	
	//Health
	if (healthbar = true)
	{
		var _hpPerc = (hp/max_hp) * 100;
		if (hp < max_hp)// and (boss = false)
		{
			draw_healthbar(x-6,y + 1,x+6,y+2,_hpPerc,c_black,c_maroon,c_maroon,0,1,0);
			draw_text_transformed(x+7,y+2,string(hp),.25,.25,0)
		}
	}
	//Flash, Shader, Self
	event_inherited();
}

StatusEffectsDraw();
