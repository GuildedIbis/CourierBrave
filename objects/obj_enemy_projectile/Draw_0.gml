//Draw
//
//
//
//
//
if (special_draw != -1) 
{
	script_execute(special_draw)
}
if (bullet = true)
{
	draw_self();	
}
else
{
	//Draw Shadow
	if (shadow != -1) draw_sprite(spr_enemy_shadow,shadow,x,y);
	
	//Health
	if (healthbar = true)
	{
		var _hpPerc = (hp/max_hp) * 100;
		if (hp < max_hp) and (boss = false)
		{
			draw_healthbar(x-6,y + 1,x+6,y+2,_hpPerc,c_black,c_maroon,c_maroon,0,1,0);
			draw_text_transformed(x+7,y+2,string(hp),.25,.25,0)
		}
	}
	//Flash, Shader, Self
	event_inherited();
}

StatusEffectsDraw();
