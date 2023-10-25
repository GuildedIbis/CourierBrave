//Draw Enemy GUI

if (obj_game.gamePaused = false)
{
//Health
if (boss = true) and (targeted = true)
{
	//if (global.bossCounter <= 1)
	//{
		var _hpPerc = (hp/max_hp) * 100;
		draw_healthbar(90,8,230,13,_hpPerc,c_black,c_maroon,c_red,0,1,0);
		draw_sprite(spr_boss_health,0,86,5);
		draw_set_font(xfnt_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_text_transformed(95,10,string(hp),.25,.25,0);
		draw_text_transformed(90,18,name,.5,.5,0);
	//}
	//if (global.bossCounter >= 2)
	//{
	//	var _hpPerc = (hp/max_hp) * 100;
	//	draw_healthbar(90 + (74 * activate_args),8,153 + (73 * activate_args),13,_hpPerc,c_black,c_maroon,c_red,0,1,0);
	//	draw_sprite(spr_boss_health,0,86,5);
	//	draw_set_font(xfnt_text);
	//	if (activate_args = 0)
	//	{
	//		draw_set_halign(fa_left);
	//		draw_set_valign(fa_middle);
	//		draw_set_color(c_white);
	//		draw_text_transformed(95 ,10,string(hp),.25,.25,0);
	//		draw_text_transformed(90,18,name,.35,.35,0);
	//	}
	//	else
	//	{
	//		draw_set_halign(fa_right);
	//		draw_set_valign(fa_middle);
	//		draw_set_color(c_white);
	//		draw_text_transformed(225,10,string(hp),.25,.25,0);
	//		draw_text_transformed(230,18,name,.35,.35,0);
	//	}
	//}
}
}