//Zerkrift Weapon Scripts
//
//
//
//
//
//Zerkrift Main
function ZerkriftMain(){
if (melee_main != ZerkriftMain)
{
	melee_main = ZerkriftMain;
	max_melee_count = 3 + round(obj_inventory.weapon_grid[# 1, 5]/2);
	max_melee_timer = 55 - round(3 * obj_inventory.weapon_grid[# 1, 5]);
	max_meleeS_timer = 300 - round(12 * obj_inventory.weapon_grid[# 1, 6]);
}
if (key_attack1) //and (melee_count > 0)
{
	melee_main = ZerkriftMain;
	max_melee_count = 3 + round(obj_inventory.weapon_grid[# 1, 5]/2);
	max_melee_timer = 55 - round(3 * obj_inventory.weapon_grid[# 1, 5]);
	max_meleeS_timer = 300 - round(12 * obj_inventory.weapon_grid[# 1, 6]);
	if (meleeS_timer >= max_meleeS_timer) and (keyboard_check(ord("Q"))) //Melee Special
	{
		damage = (4 * magic) + ((10 *obj_inventory.weapon_grid[# 1, 6]) * obj_inventory.weapon_grid[# 1, 6]);
		meleeS_timer = 0;
		attack_script = AttackZerkriftFourRiftThrust;
		state_script = PlayerStateAttack;
	}
	else //Melee Main
	{
		melee_count = melee_count - 1;
		damage = might + (8 * obj_inventory.weapon_grid[# 1, 4]);
		attack_script = AttackZerkrift;
		state_script = PlayerStateAttack;
	}
}	
}
//
//
//
//
//
//Zerkrift Jab
function AttackZerkrift(){
attacking = true;
weapon_sprite = spr_weapon_zerkriftHook;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 28;
}


//Attack Start
if (sprite_index != jab_sprite)
{
	//Start Animation From Beginning
	var _atkSpeed = round(15 * (1.25 + (obj_inventory.weapon_grid[# 1, 5]/10)));
	sprite_index = jab_sprite;
	sprite_set_speed(sprite_index,_atkSpeed,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Set Damage

//Calcuate Hit Entitites
AttackCalculate(spr_zerkriftHook_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
	image_speed = 1;
	attacking = false;
	state_script = PlayerStateFree;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
}
//
//
//
//
//
//Zerkrift Four Rift Thrust
function AttackZerkriftFourRiftThrust(){
attacking = true;
weapon_sprite = spr_weapon_zerkriftHook_fourRift;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 8;
}
//if (roll_count != max_roll_count)
//{
//	if (roll_timer < max_roll_timer) roll_timer = roll_timer + 1;
//	if (roll_timer >= max_roll_timer) 
//	{
//		roll_count = roll_count + 1;
//		roll_timer = 0;
//	}
//}

//Attack Start
if (sprite_index != castJab_sprite)
{
	//Start Animation From Beginning
	sprite_index = castJab_sprite;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//Set Damage


//Calcuate Hit Entitites
AttackCalculate(spr_zerkriftHook_fourRift_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
	image_speed = 1;
	attacking = false;
	state_script = PlayerStateFree;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
}
}
//
//
//
//
//
//Draw Weapon Stats
//Path: obj_inventory > Draw GUI event > inv_gui = EquipmentMenuGUI > DrawSelectedGear > selected_info = DrawKephraStats
function DrawZerkriftStats(){
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Draw Damage
var _damageStat = "DAMAGE:  " + string(obj_player.might + (11 * obj_inventory.weapon_grid[# 1, 4]));
draw_set_color(c_black);
draw_text_transformed(240,134,_damageStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,134,_damageStat,.5,.5,0);	
//Draw Count
var _countStat = "COUNT:  " + string(3 + round(obj_inventory.weapon_grid[# 1, 5]/2))
draw_set_color(c_black);
draw_text_transformed(240,144,_countStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,144,_countStat,.5,.5,0);	
//Draw Speed
var _speedStat = "SPEED:  " + string(1.00 + (obj_inventory.weapon_grid[# 1, 5]/20))
draw_set_color(c_black);
draw_text_transformed(240,154,_speedStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,154,_speedStat,.5,.5,0);	
//Draw Recovery
var _recoverStat = "RECOVERY:  " + string(60 - round(3 * obj_inventory.weapon_grid[# 1, 5]))
draw_set_color(c_black);
draw_text_transformed(240,164,_recoverStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,164,_recoverStat,.5,.5,0);	
//Draw Recovery
var _magicStat = "MAGIC:  " + string(obj_player.magic + ((3 *obj_inventory.weapon_grid[# 1, 6]) * obj_inventory.weapon_grid[# 0, 6]))
draw_set_color(c_black);
draw_text_transformed(240,174,_magicStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,174,_magicStat,.5,.5,0);	
}
//
//
//
//
//
//Draw Zerkrift Upgrade
function DrawZerkriftUpgrade(){
draw_text_transformed(74,73,"Zerkrift Hook",.5,.5,0);
if (page = 0) script_execute(ZerkriftPowerUpgrade);
if (page = 1) script_execute(ZerkriftBalanceUpgrade);
if (page = 2) script_execute(ZerkriftGraceUpgrade);
}
//
//
//
//
//
//Zerkrift Power Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawZerkriftUpgrade
function ZerkriftPowerUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 1, 4])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,130,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,130,61,144,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,131,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,3)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 2;
						ItemRemove(obj_inventory, 1, 3);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,142,78,10,7);
		draw_sprite_stretched(spr_menu,3,142,95,10,7);
		draw_sprite_stretched(spr_menu,3,142,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,129,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,129,73,16,16);
		draw_text_transformed(147,82,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,129,90,16,16);
		draw_text_transformed(147,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,129,107,16,16);
		draw_text_transformed(147,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,147,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,147,61,161,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,148,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 3;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,159,78,10,7);
		draw_sprite_stretched(spr_menu,3,159,95,10,7);
		draw_sprite_stretched(spr_menu,3,159,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,146,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,146,73,16,16);
		draw_text_transformed(164,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,146,90,16,16);
		draw_text_transformed(164,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,146,107,16,16);
		draw_text_transformed(164,116,"1",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 4;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,176,78,10,7);
		draw_sprite_stretched(spr_menu,3,176,95,10,7);
		draw_sprite_stretched(spr_menu,3,176,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,163,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,163,73,16,16);
		draw_text_transformed(181,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,163,90,16,16);
		draw_text_transformed(181,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,163,107,16,16);
		draw_text_transformed(181,116,"1",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 5;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,193,78,10,7);
		draw_sprite_stretched(spr_menu,3,193,95,10,7);
		draw_sprite_stretched(spr_menu,3,193,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,180,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,180,73,16,16);
		draw_text_transformed(198,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,180,90,16,16);
		draw_text_transformed(198,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,180,107,16,16);
		draw_text_transformed(198,116,"1",.35,.35,0);	
	break;
	
	case 5:
		draw_sprite_stretched(spr_menu,1,198,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,198,61,209,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,199,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 6;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,210,78,10,7);
		draw_sprite_stretched(spr_menu,3,210,95,10,7);
		draw_sprite_stretched(spr_menu,3,210,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,197,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,197,73,16,16);
		draw_text_transformed(215,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,197,90,16,16);
		draw_text_transformed(215,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,197,107,16,16);
		draw_text_transformed(215,116,"1",.35,.35,0);	
	break;
	
	case 6:
		draw_sprite_stretched(spr_menu,1,215,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,215,61,226,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,216,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 7;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,227,78,10,7);
		draw_sprite_stretched(spr_menu,3,227,95,10,7);
		draw_sprite_stretched(spr_menu,3,227,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,214,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,214,73,16,16);
		draw_text_transformed(232,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,214,90,16,16);
		draw_text_transformed(232,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,214,107,16,16);
		draw_text_transformed(232,116,"1",.35,.35,0);	
	break;
	
	case 7:
		draw_sprite_stretched(spr_menu,1,232,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,232,61,243,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,233,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 8;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,244,78,10,7);
		draw_sprite_stretched(spr_menu,3,244,95,10,7);
		draw_sprite_stretched(spr_menu,3,244,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,231,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,231,73,16,16);
		draw_text_transformed(249,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,231,90,16,16);
		draw_text_transformed(249,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,231,107,16,16);
		draw_text_transformed(249,116,"1",.35,.35,0);	
	break;
	
	case 8:
		draw_sprite_stretched(spr_menu,1,249,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,249,61,260,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,250,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 9;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,261,78,10,7);
		draw_sprite_stretched(spr_menu,3,261,95,10,7);
		draw_sprite_stretched(spr_menu,3,261,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,248,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,248,73,16,16);
		draw_text_transformed(266,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,248,90,16,16);
		draw_text_transformed(266,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,248,107,16,16);
		draw_text_transformed(266,116,"1",.35,.35,0);	
	break;
	
	case 9:
		draw_sprite_stretched(spr_menu,1,266,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,266,61,277,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,265,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 1, 4] = 10;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,278,78,10,7);
		draw_sprite_stretched(spr_menu,3,278,95,10,7);
		draw_sprite_stretched(spr_menu,3,278,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,265,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,265,73,16,16);
		draw_text_transformed(283,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,265,90,16,16);
		draw_text_transformed(283,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,265,107,16,16);
		draw_text_transformed(283,116,"1",.35,.35,0);	
	break;

	case 10:
	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,95+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(103+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(272,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
var _powerExplain = "Damage:";
draw_text_transformed(38,98,_powerExplain,.35,.35,0);
draw_set_halign(fa_center);
}
//
//
//
//
//
//Zerkrift Balance Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawZerkriftUpgrade
function ZerkriftBalanceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 1, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,130,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,130,61,144,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,131,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,3)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 2;
						ItemRemove(obj_inventory, 1, 3);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,142,78,10,7);
		draw_sprite_stretched(spr_menu,3,142,95,10,7);
		draw_sprite_stretched(spr_menu,3,142,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,129,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,129,73,16,16);
		draw_text_transformed(147,82,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,129,90,16,16);
		draw_text_transformed(147,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,129,107,16,16);
		draw_text_transformed(147,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,147,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,147,61,161,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,148,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 3;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,159,78,10,7);
		draw_sprite_stretched(spr_menu,3,159,95,10,7);
		draw_sprite_stretched(spr_menu,3,159,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,146,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,146,73,16,16);
		draw_text_transformed(164,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,146,90,16,16);
		draw_text_transformed(164,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,146,107,16,16);
		draw_text_transformed(164,116,"1",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 4;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,176,78,10,7);
		draw_sprite_stretched(spr_menu,3,176,95,10,7);
		draw_sprite_stretched(spr_menu,3,176,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,163,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,163,73,16,16);
		draw_text_transformed(181,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,163,90,16,16);
		draw_text_transformed(181,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,163,107,16,16);
		draw_text_transformed(181,116,"1",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 5;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,193,78,10,7);
		draw_sprite_stretched(spr_menu,3,193,95,10,7);
		draw_sprite_stretched(spr_menu,3,193,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,180,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,180,73,16,16);
		draw_text_transformed(198,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,180,90,16,16);
		draw_text_transformed(198,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,180,107,16,16);
		draw_text_transformed(198,116,"1",.35,.35,0);	
	break;
	
	case 5:
		draw_sprite_stretched(spr_menu,1,198,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,198,61,209,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,199,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 6;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,210,78,10,7);
		draw_sprite_stretched(spr_menu,3,210,95,10,7);
		draw_sprite_stretched(spr_menu,3,210,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,197,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,197,73,16,16);
		draw_text_transformed(215,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,197,90,16,16);
		draw_text_transformed(215,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,197,107,16,16);
		draw_text_transformed(215,116,"1",.35,.35,0);	
	break;
	
	case 6:
		draw_sprite_stretched(spr_menu,1,215,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,215,61,226,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,216,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 7;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,227,78,10,7);
		draw_sprite_stretched(spr_menu,3,227,95,10,7);
		draw_sprite_stretched(spr_menu,3,227,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,214,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,214,73,16,16);
		draw_text_transformed(232,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,214,90,16,16);
		draw_text_transformed(232,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,214,107,16,16);
		draw_text_transformed(232,116,"1",.35,.35,0);	
	break;
	
	case 7:
		draw_sprite_stretched(spr_menu,1,232,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,232,61,243,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,233,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 8;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,244,78,10,7);
		draw_sprite_stretched(spr_menu,3,244,95,10,7);
		draw_sprite_stretched(spr_menu,3,244,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,231,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,231,73,16,16);
		draw_text_transformed(249,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,231,90,16,16);
		draw_text_transformed(249,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,231,107,16,16);
		draw_text_transformed(249,116,"1",.35,.35,0);	
	break;
	
	case 8:
		draw_sprite_stretched(spr_menu,1,249,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,249,61,260,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,250,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 9;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,261,78,10,7);
		draw_sprite_stretched(spr_menu,3,261,95,10,7);
		draw_sprite_stretched(spr_menu,3,261,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,248,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,248,73,16,16);
		draw_text_transformed(266,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,248,90,16,16);
		draw_text_transformed(266,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,248,107,16,16);
		draw_text_transformed(266,116,"1",.35,.35,0);	
	break;
	
	case 9:
		draw_sprite_stretched(spr_menu,1,266,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,266,61,277,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,267,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 5] = 10;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,278,78,10,7);
		draw_sprite_stretched(spr_menu,3,278,95,10,7);
		draw_sprite_stretched(spr_menu,3,278,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,265,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,265,73,16,16);
		draw_text_transformed(283,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,265,90,16,16);
		draw_text_transformed(283,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,265,107,16,16);
		draw_text_transformed(283,116,"1",.35,.35,0);	
	break;
	
	case 10:
	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,95+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(103+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(272,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
var _balanceExplain = "Balance:";
draw_text_transformed(38,98,_balanceExplain,.35,.35,0);
draw_set_halign(fa_center);
}
//
//
//
//
//
//Zerkrift Grace Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawZerkriftUpgrade
function ZerkriftGraceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 1, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,130,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,130,61,144,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,131,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,3)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 2;
						ItemRemove(obj_inventory, 1, 3);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,142,78,10,7);
		draw_sprite_stretched(spr_menu,3,142,95,10,7);
		draw_sprite_stretched(spr_menu,3,142,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,129,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,129,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,129,73,16,16);
		draw_text_transformed(147,82,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,129,90,16,16);
		draw_text_transformed(147,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,129,107,16,16);
		draw_text_transformed(147,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,147,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,147,61,161,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,148,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 3;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,159,78,10,7);
		draw_sprite_stretched(spr_menu,3,159,95,10,7);
		draw_sprite_stretched(spr_menu,3,159,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,146,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,146,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,146,73,16,16);
		draw_text_transformed(164,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,146,90,16,16);
		draw_text_transformed(164,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,146,107,16,16);
		draw_text_transformed(164,116,"1",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 4;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,176,78,10,7);
		draw_sprite_stretched(spr_menu,3,176,95,10,7);
		draw_sprite_stretched(spr_menu,3,176,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,163,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,163,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,163,73,16,16);
		draw_text_transformed(181,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,163,90,16,16);
		draw_text_transformed(181,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,163,107,16,16);
		draw_text_transformed(181,116,"1",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 5;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,193,78,10,7);
		draw_sprite_stretched(spr_menu,3,193,95,10,7);
		draw_sprite_stretched(spr_menu,3,193,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,180,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,180,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,180,73,16,16);
		draw_text_transformed(198,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,180,90,16,16);
		draw_text_transformed(198,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,180,107,16,16);
		draw_text_transformed(198,116,"1",.35,.35,0);	
	break;
	
	case 5:
		draw_sprite_stretched(spr_menu,1,198,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,198,61,209,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,199,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 6;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,210,78,10,7);
		draw_sprite_stretched(spr_menu,3,210,95,10,7);
		draw_sprite_stretched(spr_menu,3,210,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,197,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,197,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,197,73,16,16);
		draw_text_transformed(215,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,197,90,16,16);
		draw_text_transformed(215,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,197,107,16,16);
		draw_text_transformed(215,116,"1",.35,.35,0);	
	break;
	
	case 6:
		draw_sprite_stretched(spr_menu,1,215,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,215,61,226,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,216,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 7;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,227,78,10,7);
		draw_sprite_stretched(spr_menu,3,227,95,10,7);
		draw_sprite_stretched(spr_menu,3,227,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,214,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,214,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,214,73,16,16);
		draw_text_transformed(232,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,214,90,16,16);
		draw_text_transformed(232,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,214,107,16,16);
		draw_text_transformed(232,116,"1",.35,.35,0);	
	break;
	
	case 7:
		draw_sprite_stretched(spr_menu,1,232,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,232,61,243,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,233,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 8;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,244,78,10,7);
		draw_sprite_stretched(spr_menu,3,244,95,10,7);
		draw_sprite_stretched(spr_menu,3,244,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,231,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,231,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,231,73,16,16);
		draw_text_transformed(249,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,231,90,16,16);
		draw_text_transformed(249,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,231,107,16,16);
		draw_text_transformed(249,116,"1",.35,.35,0);	
	break;
	
	case 8:
		draw_sprite_stretched(spr_menu,1,249,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,249,61,260,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,250,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 9;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,261,78,10,7);
		draw_sprite_stretched(spr_menu,3,261,95,10,7);
		draw_sprite_stretched(spr_menu,3,261,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,248,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,248,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,248,73,16,16);
		draw_text_transformed(266,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,248,90,16,16);
		draw_text_transformed(266,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,248,107,16,16);
		draw_text_transformed(266,116,"1",.35,.35,0);	
	break;
	
	case 9:
		draw_sprite_stretched(spr_menu,1,266,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,266,61,277,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,267,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						obj_inventory.weapon_grid[# 1, 6] = 10;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 5, 1);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,278,78,10,7);
		draw_sprite_stretched(spr_menu,3,278,95,10,7);
		draw_sprite_stretched(spr_menu,3,278,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,265,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,265,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,265,73,16,16);
		draw_text_transformed(283,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,265,90,16,16);
		draw_text_transformed(283,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,265,107,16,16);
		draw_text_transformed(283,116,"1",.35,.35,0);	
	break;
	
	case 10:
	
	break;
}
for (var i = 2; i < 11; i = i + 1) //Draw Upper Row of levels
{
	draw_sprite_stretched(spr_menu_circle16,1,95+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(103+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(272,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
var _graceExplain = "Damage:" + string(obj_player.might + (11 * obj_inventory.weapon_grid[# 1, 6])) + "(" + string(obj_player.might) + "+" + string(11 * obj_inventory.weapon_grid[# 0, 4]) + ")\n\n" + "Power plays a factor in the damage\ndone with Kephras blade. It's\ndamage is the players might added\nto Kephras power multiplied by 11.";
draw_text_transformed(38,98,_graceExplain,.35,.35,0);
draw_set_halign(fa_center);
}
