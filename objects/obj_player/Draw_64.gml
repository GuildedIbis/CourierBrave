//Draw Player HUD From Left to Right



if (scene = false) and (obj_game.textPaused = false)
{
	
	//Player Health, Crull Stones, and Rolling
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
	
	var _rollPerc = (stamina/max_stamina) * 100;
	draw_healthbar(23,173,35,175,_rollPerc,c_black,c_yellow,c_yellow,0,1,0);
	draw_sprite(spr_roll_hud,energy,4,156);
	//draw_set_color(c_black);
	//draw_text_transformed(262,159,stamina,.5,.5,0);
	//draw_set_color(c_white);
	//draw_text_transformed(261,159,stamina,.5,.5,0);

	//Day Cycle
	with (obj_game)
	{
		GameDayCycle();
	}

	//Beans
	draw_sprite(spr_bean_hud,0,302,6);
	draw_set_font(fnt_text)
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	draw_text_transformed(300,12,beans,.5,.5,0)
	draw_set_color(c_white);
	draw_text_transformed(299,12,beans,.5,.5,0)


	
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
		//draw_sprite(spr_activeQuest_hud,0,303,6);
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
	switch (form_type)
	{
		case 0:
			//var _chargePerc = (yellow_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_yellow,c_yellow,0,true,true);
			//var _specialPerc = (yellow_special/max_special) * 100;
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = yellow_crystal;
			selected_special = yellow_special;
			draw_ring_healthbar(286,170,yellow_crystal,max_charge,c_yellow,9,1,3);
			draw_ring_healthbar(308,170,yellow_special,max_charge,c_yellow,9,1,3);
		break;
		
		case 1:
			//var _chargePerc = (blue_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_blue,c_blue,0,true,true);
			//var _specialPerc = (blue_special/max_special) * 100;
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = blue_crystal;
			selected_special = blue_special;
			draw_ring_healthbar(286,170,blue_crystal,max_charge,c_blue,9,1,3);
			draw_ring_healthbar(308,170,blue_special,max_charge,c_blue,9,1,3);
		break;
		
		case 2:
			//var _chargePerc = (purple_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_purple,c_purple,0,true,true);
			//var _specialPerc = round((purple_special/max_special) * 100);
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = purple_crystal;
			selected_special = purple_special;
			draw_ring_healthbar(286,170,purple_crystal,max_charge,c_purple,9,1,3);
			draw_ring_healthbar(308,170,purple_special,max_charge,c_purple,9,1,3);
		break;
		
		case 3:
			//var _chargePerc = (red_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_red,c_red,0,true,true);
			//var _specialPerc = round((red_special/max_special) * 100);
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = red_crystal;
			selected_special = red_special;
			draw_ring_healthbar(286,170,red_crystal,max_charge,c_red,9,1,3);
			draw_ring_healthbar(308,170,red_special,max_charge,c_red,9,1,3);
		break;
		
		case 4:
			//var _chargePerc = (green_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_green,c_green,0,true,true);
			//var _specialPerc = (green_special/max_special) * 100;
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = green_crystal;
			selected_special = green_special;
			draw_ring_healthbar(286,170,green_crystal,max_charge,c_green,9,1,3);
			draw_ring_healthbar(308,170,green_special,max_charge,c_green,9,1,3);
		break;
		
		case 5:
			//var _chargePerc = (orange_charge/max_charge) * 100;
			//draw_healthbar(196,168,232,171,_chargePerc,c_black,c_orange,c_orange,0,true,true);
			//var _specialPerc = (orange_special/max_special) * 100;
			//draw_healthbar(280,168,316,171,_specialPerc,c_black,c_white,c_white,0,true,true);
			selected_crystal = orange_crystal;
			selected_special = orange_special;
			draw_ring_healthbar(286,170,orange_crystal,max_charge,c_orange,9,1,3);
			draw_ring_healthbar(308,170,orange_special,max_charge,c_orange,9,1,3);
		break;
	}
	
	//draw_healthbar(238,168,274,171,_rollPerc,c_black,c_yellow,c_yellow,0,true,true);
	draw_sprite(spr_hud_skills,1,192,154);
	draw_sprite(spr_weapons_allGame,form,249,160);
	if (magic_primary = true) draw_sprite(spr_magic_allGame,form,270,160);
	else draw_sprite(spr_magicAlt_allGame,form,270,160);
	draw_sprite(spr_special_allGame,form,292,160);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_black);
	draw_text_transformed(282,152,selected_crystal,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(281,152,selected_crystal,.5,.5,0);
	draw_set_color(c_black);
	draw_text_transformed(305,152,selected_special,.5,.5,0);
	draw_set_color(c_white);
	draw_text_transformed(304,152,selected_special,.5,.5,0);

	
	
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





