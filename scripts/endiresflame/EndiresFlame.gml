//Endires Flame
//
//
//
//
//
//Endire Main
//Path: obj_player > Step event > state_script = PlayerStateFree > script_execute(melee_main) > melee_main = KephraMain
function EndiresFlameMain(){
if (melee_main != EndiresFlameMain)
{
	melee_id = 2;
	melee_main = EndiresFlameMain;
	max_melee_count = 3 + round(obj_inventory.weapon_grid[# 2, 5]/2);
	max_melee_timer = 60 - round(3 * obj_inventory.weapon_grid[# 2, 5]);
	max_meleeS_timer = 300 - round(12 * obj_inventory.weapon_grid[# 2, 6]);
}
if (key_attack1) //and (melee_count > 0)
{
	melee_id = 2;
	melee_main = EndiresFlameMain;
	max_melee_count = 3 + round(obj_inventory.weapon_grid[# 2, 5]/2);
	max_melee_timer = 60 - round(3 * obj_inventory.weapon_grid[# 2, 5]);
	max_meleeS_timer = 300 - round(12 * obj_inventory.weapon_grid[# 2, 6]);
	if (meleeS_timer >= max_meleeS_timer) and (keyboard_check(ord("Q"))) //Melee Special
	{
		timer2 = 36;
		meleeS_timer = 0;
		damage = might + (11 * obj_inventory.weapon_grid[# 2, 4]);
		attack_script = AttackEndiresFlameSpinFlame;
		state_script = PlayerStateAttack;
	}
	else //Melee Main
	{
		melee_count = melee_count - 1;
		damage = might + (11 * obj_inventory.weapon_grid[# 2, 4]);
		attack_script = AttackEndiresFlame;
		state_script = PlayerStateAttack;
	}
}	
}
//
//
//
//
//
//Endires Flame Slash
//Path: obj_player > Step event > state_script = PlayerStateFree > script_execute(melee_main) > melee_main = KephraMain
function AttackEndiresFlame(){

attacking = true;
weapon_sprite = spr_weapon_endiresFlame;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 28;
}


//Attack Start
if (sprite_index != slash_sprite)
{
	//Start Animation From Beginning
	var _atkSpeed = round(15 * (1 + (obj_inventory.weapon_grid[# 2, 5]/10)));
	sprite_index = slash_sprite;
	sprite_set_speed(sprite_index,_atkSpeed,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculate(spr_endiresFlame_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
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
//Endires Flame Spin Flame
//Path: obj_player > Step event > state_script = PlayerStateFree > script_execute(melee_main) > melee_main = KephraMain
function AttackEndiresFlameSpinFlame(){
attacking = true;
weapon_sprite = spr_weapon_endiresFlame_spinFlame;
if (timer2 > 0) timer2 = timer2 - 1;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 20;
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
if (sprite_index != castSlash_sprite)
{
	//Start Animation From Beginning
	sprite_index = castSlash_sprite;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

if (timer2 <= 0)
{	
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		projectile_script = PlayerProjectileSpinFlame;
		break_object = obj_player.break_object;
		damage = obj_player.magic + ((3 *obj_inventory.weapon_grid[# 2, 6]) * obj_inventory.weapon_grid[# 2, 6]);
		projectile_sprite = spr_spinFlame;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (floor(other.direction/90))*90;
		image_angle = direction;
		speed = 2;
	}
	timer2 = 20;
}

//Calcuate Hit Entitites
AttackCalculate(spr_endiresFlame_spinFlame_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
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
function DrawEdiresStats(){
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Draw Damage
var _damageStat = "DAMAGE:  " + string(obj_player.might + (11 * obj_inventory.weapon_grid[# 2, 4]));
draw_set_color(c_black);
draw_text_transformed(240,134,_damageStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,134,_damageStat,.5,.5,0);	
//Draw Count
var _countStat = "COUNT:  " + string(3 + round(obj_inventory.weapon_grid[# 2, 5]/2))
draw_set_color(c_black);
draw_text_transformed(240,144,_countStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,144,_countStat,.5,.5,0);	
//Draw Speed
var _speedStat = "SPEED:  " + string(1.00 + (obj_inventory.weapon_grid[# 2, 5]/20))
draw_set_color(c_black);
draw_text_transformed(240,154,_speedStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,154,_speedStat,.5,.5,0);	
//Draw Recovery
var _recoverStat = "RECOVERY:  " + string(60 - round(3 * obj_inventory.weapon_grid[# 2, 5]))
draw_set_color(c_black);
draw_text_transformed(240,164,_recoverStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,164,_recoverStat,.5,.5,0);	
//Draw Recovery
var _magicStat = "MAGIC:  " + string(obj_player.magic + ((3 *obj_inventory.weapon_grid[# 2, 6]) * obj_inventory.weapon_grid[# 2, 6]))
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
//Draw Kephra Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawKephraUpgrade
function DrawEndiresUpgrade(){
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Endire's Flame",.5,.5,0);
draw_set_halign(fa_center);
if (page = 0) script_execute(EndiresPowerUpgrade);

}
//
//
//
//
//
//Fayani Power Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawKephraUpgrade
function EndiresPowerUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 2, 4])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,5)) and (ItemCheckQuantity(obj_inventory,5,1))
				{
					if (ItemCheckQuantity(obj_inventory,6,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 4] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 10);
						ItemRemove(obj_inventory, 6, 3);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,107,78,10,7);
		draw_sprite_stretched(spr_menu,3,107,95,10,7);
		draw_sprite_stretched(spr_menu,3,107,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,94,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,94,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,1,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
		draw_text_transformed(112,116,"3",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,15,5)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,15,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 4] = 2;
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 15, 5);
					}
				}
			}
		}
		draw_sprite_stretched(spr_menu,3,124,78,10,7);
		draw_sprite_stretched(spr_menu,3,124,95,10,7);
		draw_sprite_stretched(spr_menu,3,124,112,10,7);
		draw_sprite_stretched(spr_menu_circle16,1,111,73,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,90,16,16);
		draw_sprite_stretched(spr_menu_circle16,1,111,107,16,16);
		//draw items and quantity needed
		
		draw_sprite_stretched(spr_item_all,15,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 15)) and (ItemCheckQuantity(obj_inventory,10,3))
				{
					if (ItemCheckQuantity(obj_inventory,6,10))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 4] = 4;
						ItemRemove(obj_inventory, 1, 15);
						ItemRemove(obj_inventory, 10, 3);
						ItemRemove(obj_inventory, 6, 10);
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
		draw_text_transformed(181,82,"15",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,163,90,16,16);
		draw_text_transformed(181,99,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,163,107,16,16);
		draw_text_transformed(181,116,"10",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 20)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,10,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 4] = 5;
						ItemRemove(obj_inventory, 1, 20);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 10, 10);
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
		draw_text_transformed(198,82,"20",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,180,90,16,16);
		draw_text_transformed(198,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,180,107,16,16);
		draw_text_transformed(198,116,"10",.35,.35,0);	
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
						obj_inventory.weapon_grid[# 2, 4] = 6;
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
						obj_inventory.weapon_grid[# 2, 4] = 7;
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
						obj_inventory.weapon_grid[# 2, 4] = 8;
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
						obj_inventory.weapon_grid[# 2, 4] = 9;
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
						obj_inventory.weapon_grid[# 2, 4] = 10;
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
	draw_sprite_stretched(spr_menu_circle16,1,60+(17*i),56,16,16);
	if (i < 10) draw_text_transformed(68+(17*i),64,i,.75,.75,0);
	else draw_text_transformed(238,64,"10",.75,.75,0);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _powerExplain = "Level " + string(obj_inventory.weapon_grid[# 2, 4]) + ":" + string(obj_player.might + (11 * obj_inventory.weapon_grid[# 2, 4])) + "> Level" + string(obj_inventory.weapon_grid[# 2, 4] + 1) + ": " + string(obj_player.might + (11 * (obj_inventory.weapon_grid[# 2, 4]+1)));
draw_text_transformed(141,44,_powerExplain,.5,.5,0);
draw_set_halign(fa_center);
}
//
//
//
//
//
//Fayani Balance Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawKephraUpgrade
function EndiresBalanceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 2, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,130,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,130,61,144,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,131,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,5)) and (ItemCheckQuantity(obj_inventory,10,1))
				{
					if (ItemCheckQuantity(obj_inventory,7,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 2;
						ItemRemove(obj_inventory, 1, 5);
						ItemRemove(obj_inventory, 10, 1);
						ItemRemove(obj_inventory, 7, 10);
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
		draw_text_transformed(147,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,129,90,16,16);
		draw_text_transformed(147,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,7,129,107,16,16);
		draw_text_transformed(147,116,"10",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,147,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,147,61,161,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,148,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,10,2))
				{
					if (ItemCheckQuantity(obj_inventory,7,20))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 3;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 10, 2);
						ItemRemove(obj_inventory, 7, 20);
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
		draw_text_transformed(164,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,146,90,16,16);
		draw_text_transformed(164,99,"2",.35,.35,0);
		draw_sprite_stretched(spr_item_all,7,146,107,16,16);
		draw_text_transformed(164,116,"20",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 15)) and (ItemCheckQuantity(obj_inventory,10,3))
				{
					if (ItemCheckQuantity(obj_inventory,9,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 4;
						ItemRemove(obj_inventory, 1, 15);
						ItemRemove(obj_inventory, 10, 3);
						ItemRemove(obj_inventory, 8, 10);
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
		draw_text_transformed(181,82,"15",.35,.35,0);
		draw_sprite_stretched(spr_item_all,10,163,90,16,16);
		draw_text_transformed(181,99,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,8,163,107,16,16);
		draw_text_transformed(181,116,"10",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,11,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 5;
						ItemRemove(obj_inventory, 1, 20);
						ItemRemove(obj_inventory, 11, 1);
						ItemRemove(obj_inventory, 12, 10);
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
		draw_text_transformed(198,82,"20",.35,.35,0);
		draw_sprite_stretched(spr_item_all,11,180,90,16,16);
		draw_text_transformed(198,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,12,180,107,16,16);
		draw_text_transformed(198,116,"10",.35,.35,0);	
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 6;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 7;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 8;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 9;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 5] = 10;
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
draw_set_valign(fa_top);
var _balanceExplain = "Balance affects the attack count,\nspeed, and recharge time.\n\nCount +1 every other level.\nSpeed +5% (fixed) every level.\nRecharge -5% (fixed) every level.";
draw_text_transformed(38,80,_balanceExplain,.35,.35,0);
draw_set_halign(fa_center);
}
//
//
//
//
//
//Fayani Power Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawKephraUpgrade
function EndiresGraceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.weapon_grid[# 2, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,130,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,130,61,144,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,131,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,5)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,2,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 2;
						ItemRemove(obj_inventory, 1, 5);
						ItemRemove(obj_inventory, 3, 1);
						ItemRemove(obj_inventory, 2, 10);
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
		draw_text_transformed(147,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,129,90,16,16);
		draw_text_transformed(147,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,2,129,107,16,16);
		draw_text_transformed(147,116,"10",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,147,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,147,61,161,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,148,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,3,2))
				{
					if (ItemCheckQuantity(obj_inventory,2,20))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 3;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 3, 2);
						ItemRemove(obj_inventory, 2, 20);
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
		draw_text_transformed(164,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,146,90,16,16);
		draw_text_transformed(164,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,2,146,107,16,16);
		draw_text_transformed(164,116,"20",.35,.35,0);	
	break;
	
	case 3:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,164,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,164,61,175,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,165,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1, 15)) and (ItemCheckQuantity(obj_inventory,3,3))
				{
					if (ItemCheckQuantity(obj_inventory,9,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 4;
						ItemRemove(obj_inventory, 1, 15);
						ItemRemove(obj_inventory, 3, 3);
						ItemRemove(obj_inventory, 9, 10);
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
		draw_text_transformed(181,82,"15",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,163,90,16,16);
		draw_text_transformed(181,99,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,163,107,16,16);
		draw_text_transformed(181,116,"10",.35,.35,0);	
	break;
		
	case 4:
		draw_sprite_stretched(spr_menu,1,181,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,181,61,192,111)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,182,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,12, 1)) and (ItemCheckQuantity(obj_inventory,12,1))
				{
					if (ItemCheckQuantity(obj_inventory,12,1))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 5;
						ItemRemove(obj_inventory, 1, 1);
						ItemRemove(obj_inventory, 12, 1);
						ItemRemove(obj_inventory, 12, 1);
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
		
		draw_sprite_stretched(spr_item_all,12,180,73,16,16);
		draw_text_transformed(198,82,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,3,180,90,16,16);
		draw_text_transformed(198,99,"1",.12,.35,0);
		draw_sprite_stretched(spr_item_all,12,180,107,16,16);
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 6;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 7;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 8;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 9;
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
						audio_play_sound(snd_text02,0,false);
						obj_inventory.weapon_grid[# 2, 6] = 10;
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
draw_set_valign(fa_top);
var _graceExplain ="Grace affects the damage of\nthe weapons special attack. It's\ndamage is the players magic plus\n3 multiplied by the weapons Grace\nstat squared.\n\nDamage:" + string(obj_player.magic + ((3 *obj_inventory.weapon_grid[# 2, 6]) * obj_inventory.weapon_grid[# 2, 6])) + "(" + string(obj_player.magic) + "+ 3 x" + string(obj_inventory.weapon_grid[# 2, 6]) + " x " + string(obj_inventory.weapon_grid[# 2, 6])+ ")";
draw_text_transformed(38,80,_graceExplain,.35,.35,0);
draw_set_halign(fa_center);
}

