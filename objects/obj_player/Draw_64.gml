//Draw Player HUD From Left to Right



if (scene = false) and (obj_game.textPaused = false)
{
	
	//Player Health and Crull Stones
	var _hpPerc = (hp/max_hp) * 100;
	draw_healthbar(22,166,64,169,_hpPerc,c_black,c_maroon,c_red,0,1,0);
	draw_sprite(spr_health_hud,(max_crull_stone - 1),4,156);
	for (var i = 0; i < crull_stone; i = i + 1)
	{
		var _xPos = 27 + 4*i;
		var _yPos = 164;
		draw_sprite_ext(spr_crull_tick,0,_xPos,_yPos,1.0,1.0,180,c_white,1.0);	
	}
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(8,166,hp,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(7,166,hp,.5,.5,0);

	//Day Cycle
	with (obj_game)
	{
		GameDayCycle();
	}

	//Beans
	draw_sprite(spr_bean_hud,0,50,6);
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(66,12,beans,.5,.5,0)
	draw_set_color(c_white);
	draw_text_transformed(65,12,beans,.5,.5,0)


	
	//Aggro (Below Weapons)
	if (obj_game.gamePaused = false)
	{
		//Aggro
		if (global.aggroCounter > 0) 
		{
			draw_sprite(spr_aggro_hud,0,160,5);
			draw_set_font(fnt_text)
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			draw_set_color(c_black);
			draw_text_transformed(164,20,global.aggroCounter,.5,.5,0);
			draw_set_color(c_white);
			draw_text_transformed(163,20,global.aggroCounter,.5,.5,0);
		}
		//if (global.bossCounter > 0) 
		//{
		//	draw_set_font(fnt_text)
		//	draw_set_halign(fa_right);
		//	draw_set_valign(fa_middle);
		//	draw_set_color(c_black);
		//	draw_text_transformed(164,26,global.bossCounter,.5,.5,0);
		//	draw_set_color(c_white);
		//	draw_text_transformed(163,26,global.bossCounter,.5,.5,0);
		//}
		//Active Quest
		draw_sprite(spr_activeQuest_hud,0,303,6);
		draw_set_font(fnt_text)
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
		draw_set_color(c_black);
		script_execute(tracking_quest);
	}



	//Meters
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	var _chargePerc = (charge/max_charge) * 100;
	draw_healthbar(196,168,232,171,_chargePerc,c_black,c_green,c_green,0,true,true);
	var _rollPerc = (stamina/max_stamina) * 100;
	draw_healthbar(238,168,274,171,_rollPerc,c_black,c_yellow,c_yellow,0,true,true);
	//if (obj_inventory.form_grid[# form, 8] > 0)
	//{
	var _magicSPerc = (special/max_special) * 100;
	draw_healthbar(280,168,316,171,_magicSPerc,c_black,c_white,c_white,0,true,true);
	//}
	draw_sprite(spr_hud_skills,1,192,154);
	draw_sprite(spr_weapons_allGame,form,240,160);
	if (magic_primary = true) draw_sprite(spr_magic_allGame,form,197,160);
	else draw_sprite(spr_magicAlt_allGame,form,197,160);
	draw_sprite(spr_special_allGame,form,282,160);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_black);
	draw_text_transformed(220,159,charge,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(219,159,charge,.5,.5,0);
	draw_set_color(c_black);
	draw_text_transformed(262,159,stamina,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(261,159,stamina,.5,.5,0);
	draw_set_color(c_black);
	draw_text_transformed(305,159,round(special/10),.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(304,159,round(special/10),.5,.5,0);

	
	
	//Status Effect
	script_execute(StatusEffectsGUI);

}
if (obj_game.textPaused = true) and (scene = false)
{
	//Beans
	draw_sprite(spr_bean_hud,0,50,6);
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(66,12,beans,.5,.5,0)
	draw_set_color(c_white);
	draw_text_transformed(65,12,beans,.5,.5,0)
}





