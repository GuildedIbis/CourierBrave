//Draw Player HUD From Left to Right



if (scene = false)
{
	
	//Player Health and Crull Stones
	var _hpPerc = (hp/max_hp) * 100;
	draw_healthbar(17,11,60,14,_hpPerc,c_black,c_maroon,c_red,0,1,0);
	draw_sprite(spr_health_hud,(max_crull_stone - 1),0,0);
	for (var i = 0; i < crull_stone; i = i + 1)
	{
		var _xPos = 20 + 4*i;
		var _yPos = 16;
		draw_sprite(spr_crull_tick,0,_xPos,_yPos);	
	}
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(6,12,hp,.5,.5,0);

	draw_set_color(c_white);
	draw_text_transformed(5,12,hp,.5,.5,0);


	//Beans
	draw_sprite(spr_bean_hud,0,303,6);
	draw_set_font(fnt_text)
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(302,12,beans,.5,.5,0)
	draw_set_color(c_white);
	draw_text_transformed(301,12,beans,.5,.5,0)

	
	//Aggro (Below Weapons)
	if (obj_game.gamePaused = false)
	{
	
		//Aggro
		if (global.aggroCounter <= 0) draw_sprite(spr_aggro_hud,0,303,42);
		else draw_sprite(spr_aggro_hud,1,303,42);
		draw_set_font(fnt_text)
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(c_black);
		draw_text_transformed(302,48,global.aggroCounter,.5,.5,0);
		draw_set_color(c_white);
		draw_text_transformed(301,48,global.aggroCounter,.5,.5,0);
	
		//Active Quest
		draw_sprite(spr_activeQuest_hud,0,303,24);
		draw_set_font(fnt_text)
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(c_black);
		script_execute(tracking_quest);
	}



	//Roll Timer
	var _rollPerc = (stamina/max_stamina) * 100;
	draw_healthbar(81,11,124,14,_rollPerc,c_black,c_yellow,c_yellow,0,true,true);
	draw_sprite(spr_stamina_hud,0,64,0);
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(70,12,stamina,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(69,12,stamina,.5,.5,0);



	//Form HUD
	draw_sprite(spr_ability_hud,0,192,6);
	draw_sprite(spr_ability_hud,0,214,6);
	draw_sprite(spr_weapons_allGame,form,184,4);
	draw_sprite(spr_magic_allGame,form,206,4);
	var _magicCount = string(magic_count) + "/" + string(max_magic_count)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_transformed(222,26,string(_magicCount),.35,.35,0);
	if (obj_inventory.form_grid[# form, 8] > 0)
	{
		var _magicSPerc = (special_timer/max_special_timer) * 100;
		draw_healthbar(240,8,266,20,_magicSPerc,c_black,c_white,c_white,0,true,true);
		draw_sprite(spr_ability_hud3,0,238,6);
		draw_sprite(spr_special_allGame,form,238,4);
		if (max_special_count != -1)
		{
			var _specialCount = string(special_count) + "/" + string(max_special_count)
			draw_text_transformed(254,26,string(_specialCount),.35,.35,0);
		}
	}

}





