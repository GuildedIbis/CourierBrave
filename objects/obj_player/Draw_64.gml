//Draw Player HUD From Left to Right

if (scene = false) and (obj_game.textPaused = false)
{

	//Aggro (Top Center)
	if (obj_game.gamePaused = false)
	{
		//Aggro
		if (global.aggroCounter > 0) 
		{
			draw_sprite(spr_aggro_hud,0,160,5);
			draw_set_font(global.fnt_main_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			draw_set_color(c_white);
			draw_text_transformed(163,24,global.aggroCounter,.75,.75,0);
		}
		
	}

	//Health (Bottom Left)
	var _hpColor = make_color_rgb(255,127,246);
	var _osColor = make_color_rgb(109,208,247);
	draw_ring_healthbar(12,169,hp,max_hp,_hpColor,9,1,3);
	if (overshield > 0) draw_ring_healthbar(12,169,overshield,20,_osColor,9,1,3);
	draw_sprite(spr_hud_meter_round,0,0,245);
	draw_sprite(spr_formSelect_icons,form,12,170);
	
	//Stamina (Bottom Left)
	draw_ring_healthbar(36,169,stamina,max_stamina,c_yellow,9,1,3);
	draw_sprite(spr_hud_meter_round,0,24,245);
	draw_sprite(spr_weapons_allGame,form,20,160);
	if (weapon_aim = true) draw_sprite(spr_hud_weapon_aim,1,48,165);
	else draw_sprite(spr_hud_weapon_aim,0,48,165);
	
	
	//Skills (Bottom Right
	switch (form_type)
	{
		case 0:
			selected_primary = yellow_primary;
			selected_special = yellow_special;
			draw_ring_healthbar(286,260,yellow_primary,max_charge,c_yellow,9,1,3);
			draw_ring_healthbar(308,260,yellow_special,max_charge,c_yellow,9,1,3);
		break;
		
		case 1:
			selected_primary = orange_primary;
			selected_special = orange_special;
			draw_ring_healthbar(286,170,orange_primary,max_charge,c_orange,9,1,3);
			draw_ring_healthbar(308,170,orange_special,max_charge,c_orange,9,1,3);
		break;
		
		case 2:
			selected_primary = purple_primary;
			selected_special = purple_special;
			draw_ring_healthbar(286,170,purple_primary,max_charge,c_purple,9,1,3);
			draw_ring_healthbar(308,170,purple_special,max_charge,c_purple,9,1,3);
		break;
		
		case 3:
			selected_primary = blue_primary;
			selected_special = blue_special;
			draw_ring_healthbar(286,170,blue_primary,max_charge,c_blue,9,1,3);
			draw_ring_healthbar(308,170,blue_special,max_charge,c_blue,9,1,3);
		break;
		
		case 4:
			selected_primary = green_primary;
			selected_special = green_special;
			draw_ring_healthbar(286,170,green_primary,max_charge,c_green,9,1,3);
			draw_ring_healthbar(308,170,green_special,max_charge,c_green,9,1,3);
		break;
		
		case 5:
			selected_primary = red_primary;
			selected_special = red_special;
			draw_ring_healthbar(286,170,red_primary,max_charge,c_red,9,1,3);
			draw_ring_healthbar(308,170,red_special,max_charge,c_red,9,1,3);
		break;
		
	}
	
	draw_set_font(global.fnt_main_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_sprite(spr_hud_meter_round,0,432,245);
	draw_sprite(spr_hud_meter_round,0,456,245);
	if (magic_primary = true) draw_sprite(spr_primary_allGame,form,270,160);
	else draw_sprite(spr_primaryAlt_allGame,form,270,160);
	draw_sprite(spr_special_allGame,form,292,160);
	var _primaryUses = string(selected_primary div primary_cost)
	var _specialUses = string(selected_special div special_cost)
	draw_text_transformed(12,153,string(hp),.5,.5,0);
	draw_text_transformed(36,153,string(stamina),.5,.5,0);
	draw_text_transformed(286,153,_primaryUses,.5,.5,0);
	draw_text_transformed(309,153,_specialUses,.5,.5,0);

	
	
	//Status Effect
	scr_player_status_effects_gui();

}
if (scene_script != -1)
{
	script_execute(scene_script)
}





