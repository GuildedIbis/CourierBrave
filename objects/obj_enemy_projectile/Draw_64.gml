//Draw Enemy GUI

	
//Health
if (boss = true) and (targeted = true)
{
	var _hpPerc = (hp/max_hp) * 100;
	draw_healthbar(16,166,304,175,_hpPerc,c_black,c_maroon,c_red,0,1,0);
	draw_set_font(xfnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_transformed(308,170,string(hp),.25,.25,0);
	draw_text_transformed(16,160,name,.5,.5,0);
}
