//Draw
if (bullet = true)
{
	draw_self();	
}
else
{
	
	////Draw Shadow
	//if (shadow != false)
	//{
	//	draw_sprite(spr_enemy_shadow,shadow,x,y);
	//}
	
	//Flash, Shader, Self
	
	var _castDir = (point_direction(x,y-7,obj_player.x,obj_player.y - 4));
	var _castDepth
	var _armY 
	if (_castDir > 315) or (_castDir <= 135)
	{
		_castDepth = true;
	}
	else _castDepth = false;
	if (_castDir >= 90) and (_castDir < 329)
	{
		_armY = -1;
	}
	else _armY = 1;
	if (casting = true) and (_castDepth = true)
	{
		draw_sprite_ext(enemy_arm,0,x + dir_offX,y + dir_offY,1.0,_armY,_castDir,c_white,1.0);
	}
	event_inherited();
	if (casting = true) and (_castDepth = false)
	{
		draw_sprite_ext(enemy_arm,0,x + dir_offX,y + dir_offY,1.0,_armY,_castDir,c_white,1.0);
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
	
	
}

scr_entity_status_effects_draw();
