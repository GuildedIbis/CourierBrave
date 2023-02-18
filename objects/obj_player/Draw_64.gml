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
			draw_sprite(spr_aggro_hud,0,161,6);
			draw_set_font(fnt_text)
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			draw_set_color(c_black);
			draw_text_transformed(160,12,global.aggroCounter,.5,.5,0);
			draw_set_color(c_white);
			draw_text_transformed(159,12,global.aggroCounter,.5,.5,0);
		}
	
		//Active Quest
		draw_sprite(spr_activeQuest_hud,0,303,6);
		draw_set_font(fnt_text)
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(c_black);
		script_execute(tracking_quest);
	}



	//Stamina Meter
	
	//draw_sprite(spr_stamina_hud,0,64,0);
	draw_set_font(fnt_text)
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	//draw_set_color(c_black);
	//draw_text_transformed(70,12,stamina,.5,.5,0);
	//draw_set_color(c_white);
	//draw_text_transformed(69,12,stamina,.5,.5,0);

	//Charge and Energy Meters
	var _chargePerc = (charge/max_charge) * 100;
	draw_healthbar(198,168,241,171,_chargePerc,c_black,c_green,c_green,1,true,true);
	var _rollPerc = (stamina/max_stamina) * 100;
	draw_healthbar(270,168,313,171,_rollPerc,c_black,c_yellow,c_yellow,0,true,true);
	draw_sprite(spr_hud_skills,1,192,154);
	draw_sprite(spr_weapons_allGame,form,246,160);
	draw_sprite(spr_magic_allGame,form,232,160);
	//draw_set_font(fnt_text)
	//draw_set_halign(fa_left);
	//draw_set_valign(fa_middle);
	//draw_set_color(c_black);
	//draw_text_transformed(70,12,stamina,.5,.5,0);
	//draw_set_color(c_white);
	//draw_text_transformed(69,12,stamina,.5,.5,0);

	//Form HUD
	//draw_sprite(spr_ability_hud,0,192,6);
	//draw_sprite(spr_ability_hud,0,214,6);
	
	//var _magicCount = string(magic_count) + "/" + string(max_magic_count)
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_middle);
	//draw_set_color(c_white);
	//draw_text_transformed(222,26,string(_magicCount),.35,.35,0);
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





