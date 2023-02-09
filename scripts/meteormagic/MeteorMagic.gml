//Meteor Magic Scripts
//
//
//
//
//
//Metor Main
function MeteorMain(){
if (magic_main != MeteorMain)
{
	magic_main = MeteorMain;
	//max_magic_count = 3 + round(obj_inventory.magic_grid[# 0, 5]/2);
	max_magic_timer = 105 + round(15 * obj_inventory.magic_grid[# 0, 5]);
	max_magicS_timer = 600 - round(42 * obj_inventory.magic_grid[# 0, 6]);
}
if (keyboard_check_pressed(vk_shift))
{
	magic_main = MeteorMain;
	//max_magic_count = 3 + round(obj_inventory.magic_grid[# 0, 5]/2);
	max_magic_timer = 105 + round(15 * obj_inventory.magic_grid[# 0, 5]);
	max_magicS_timer = 600 - round(42 * obj_inventory.magic_grid[# 0, 6]);
	if (magicS_timer >= max_magicS_timer)  //Magic Special
	{
		with (obj_cursor)
		{
			damage = obj_player.magic + (obj_inventory.magic_grid[# 0, 4]*21) + obj_player.might;//Max 510
			sprite_index = seed_sprite;
			hit_by_attack = -1;
			local_frame = 0;
			seed_script = SeedStarfireSlam;
		}
		timer2 = 8;
		magicS_timer = 0;
		attack_script = AttackMeteorStarfireSlam;
		state_script = PlayerStateAttack;
	}
}
if (mouse_check_button_pressed(mb_right)) //Magic Main
{
	if (magic_timer >= 20)
	{
		timer2 = 0;
		attack_script = AttackMeteor;
		state_script = PlayerStateAttack;
	}
}	

}
//
//
//
//
//
//Attack Meteor (Right Click)
function AttackMeteor(){

attacking = true;
weapon_sprite = spr_spiritStone_meteor;


//Timers
if (hor_spd != 0) or (ver_spd != 0) //Walk Audio
{
	walk_snd_delay = walk_snd_delay - 1;
	if (walk_snd_delay <= 0)
	{
		walk_snd_delay = 15;
		audio_sound_gain(walk_snd,global.volumeEffects,1);
		audio_play_sound(walk_snd,1,false);
	}
}
if (timer2 > 0) timer2 = timer2 - 1;


//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);

//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = castRun_sprite;
}
else sprite_index = castMagic_sprite;
if (_oldSprite != sprite_index) local_frame = 0;

//Create Bullet at end timer - timer is length of weapon sprite animation
if (timer2 <= 0)
{	
	magic_timer = magic_timer - 20;
	with (instance_create_layer(obj_player.x,obj_player.y-10,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,0);
		break_object = obj_player.break_object;
		magic = true;
		follow_timer = 28;
		damage = obj_player.magic + (obj_inventory.magic_grid[# 0, 4]*(7 + obj_inventory.magic_grid[# 0, 4]));//Max 340
		projectile_sprite = spr_meteor;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
		speed = 3.5;
	}
	timer2 = 30;
}

//Animate
PlayerAnimation();

if (animation_end)
{
	if (mouse_check_button(mb_right) = false) or (magic_timer < 20)
	{
		attacking = false;
		state_script = PlayerStateFree;
		damage = 0;
		animation_end = false;
		atk_snd_delay = 0;
	}
}
}
//
//
//
//
//
//Player Script for Meteor Starfire Slam (Left Click) (3 Cost)
function AttackMeteorStarfireSlam(){
attacking = true;
weapon_sprite = spr_spiritStone_meteor;
if (timer2 > 0) timer2 = timer2 - 1;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 28;
}


//Attack Start
if (sprite_index != castMagic_sprite)
{
	//Start Animation From Beginning
	var _atkSpeed = round(15 * (1 + (obj_inventory.magic_grid[# 0, 5]/10)));
	sprite_index = castMagic_sprite;
	sprite_set_speed(sprite_index,_atkSpeed,spritespeed_framespersecond)
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	//if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	//ds_list_clear(hit_by_attack);
}




//Set Damage

//Calcuate Hit Entitites
//AttackCalculate(spr_kephraBlade_leafArc_hitbox);

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
//Seed Stone Script for Starfire Slam
function SeedStarfireSlam(){
//Attack Start
if (sprite_index != spr_spiritGuide_starFireSlam)
{
	//Start Animation From Beginning
	sprite_index = spr_spiritGuide_starFireSlam;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}



//Calcuate Hit Entitites
AttackCalculateAblaze(spr_spiritGuide_starFireSlam_hitbox,10);

//Animate
PlayerAnimation1();

if (animation_end)
{
	attacking = false;
	seed_script = MeteorCursor;
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
//Meteor Cursor
function MeteorCursor(){
cursPlay_sprite = spr_cursor_play;
sprite_index = cursPlay_sprite;
follow_x = mouse_x;
follow_y = mouse_y;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

depth = -100;
}
//
//
//
//
//
//Draw Kephra Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawTinkererMenu > _weaponDraw = DrawKephraUpgrade
function DrawMeteorUpgrade(){
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Meteor Magic",.5,.5,0);
draw_set_halign(fa_center);
if (page = 0) script_execute(MeteorPowerUpgrade);
//if (page = 1) script_execute(MeteorBalanceUpgrade);
//if (page = 2) script_execute(MeteorGraceUpgrade);
}
//
//
//
//
//
//Draw Meteor Stats
function DrawMeteorStats(){
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Draw Regular Fire Damage
var _damageStat = "St DMG:  " + string(obj_player.magic + (obj_inventory.magic_grid[# 0, 4]*(7 + obj_inventory.magic_grid[# 0, 4])));
draw_set_color(c_black);
draw_text_transformed(240,134,_damageStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,134,_damageStat,.5,.5,0);	
//Draw Max Energy
var _countStat = "ENRG:  " + string(105 + round(15 * obj_inventory.magic_grid[# 0, 5]))
draw_set_color(c_black);
draw_text_transformed(240,144,_countStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,144,_countStat,.5,.5,0);	
//Draw Cost Per Use
var _speedStat = "COST:  " + string(20)
draw_set_color(c_black);
draw_text_transformed(240,154,_speedStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,154,_speedStat,.5,.5,0);	
//Draw Special Fire Damage
var _specialStat = "Sp DMG:  " + string(obj_player.magic + (obj_inventory.magic_grid[# 0, 4]*21) + obj_player.might);
draw_set_color(c_black);
draw_text_transformed(240,164,_specialStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,164,_specialStat,.5,.5,0);	
//Draw Special Recovery
var _recoveryStat = "Sp TIME:  " + string(600 - round(42 * obj_inventory.magic_grid[# 0, 6]));
draw_set_color(c_black);
draw_text_transformed(240,174,_recoveryStat,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(239,174,_recoveryStat,.5,.5,0);	
}
//
//
//
//
//
//Meteor Power Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawAlterMenu > _magicDraw = DrawMeteorUpgrade
function MeteorPowerUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.magic_grid[# 0, 4])
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
						obj_inventory.magic_grid[# 0, 4] = 2;
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
						obj_inventory.magic_grid[# 0, 4] = 2;
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
				if (ItemCheckQuantity(obj_inventory,3, 3)) and (ItemCheckQuantity(obj_inventory,9,3))
				{
					if (ItemCheckQuantity(obj_inventory,17,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.magic_grid[# 0, 4] = 4;
						ItemRemove(obj_inventory, 3, 3);
						ItemRemove(obj_inventory, 9, 3);
						ItemRemove(obj_inventory, 17, 1);
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
		
		draw_sprite_stretched(spr_item_all,3,163,73,16,16);
		draw_text_transformed(181,82,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,163,90,16,16);
		draw_text_transformed(181,99,"3",.35,.35,0);
		draw_sprite_stretched(spr_item_all,17,163,107,16,16);
		draw_text_transformed(181,116,"1",.35,.35,0);	
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
						obj_inventory.magic_grid[# 0, 4] = 5;
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
						obj_inventory.magic_grid[# 0, 4] = 6;
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
						obj_inventory.magic_grid[# 0, 4] = 7;
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
						obj_inventory.magic_grid[# 0, 4] = 8;
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
						obj_inventory.magic_grid[# 0, 4] = 9;
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
						obj_inventory.magic_grid[# 0, 4] = 10;
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
var _magicExplain = "Power affects the attack damage\ndone with Meteor magic. It's\ndamage is the players magic stat added\nto Meteors power multiplied by 9.\n\nDamage:" + string(obj_player.magic + (9 * obj_inventory.magic_grid[# 0, 4])) + "(" + string(obj_player.magic) + "+" + string(9 * obj_inventory.weapon_grid[# 0, 4]) + ")";
draw_text_transformed(141,80,_magicExplain,.35,.35,0);
draw_set_halign(fa_center);
}
//
//
//
//
//
//Meteor Balance Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawAlterMenu > _magicDraw = DrawMeteorUpgrade
function MeteorBalanceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.magic_grid[# 0, 5])
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
					if (ItemCheckQuantity(obj_inventory,7,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.magic_grid[# 0, 5] = 2;
						ItemRemove(obj_inventory, 1, 5);
						ItemRemove(obj_inventory, 3, 1);
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
		draw_sprite_stretched(spr_item_all,3,129,90,16,16);
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
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,3,2))
				{
					if (ItemCheckQuantity(obj_inventory,7,20))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.magic_grid[# 0, 5] = 3;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 3, 2);
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
		draw_sprite_stretched(spr_item_all,3,146,90,16,16);
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
				if (ItemCheckQuantity(obj_inventory,1, 15)) and (ItemCheckQuantity(obj_inventory,3,3))
				{
					if (ItemCheckQuantity(obj_inventory,9,10))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.magic_grid[# 0, 5] = 4;
						ItemRemove(obj_inventory, 1, 15);
						ItemRemove(obj_inventory, 3, 3);
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
		draw_sprite_stretched(spr_item_all,3,163,90,16,16);
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
				if (ItemCheckQuantity(obj_inventory,1, 1)) and (ItemCheckQuantity(obj_inventory,3,1))
				{
					if (ItemCheckQuantity(obj_inventory,5,1))
					{
						audio_play_sound(snd_text02,0,false);
						obj_inventory.magic_grid[# 0, 5] = 5;
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
						obj_inventory.magic_grid[# 0, 5] = 6;
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
						obj_inventory.magic_grid[# 0, 5] = 7;
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
						obj_inventory.magic_grid[# 0, 5] = 8;
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
						obj_inventory.magic_grid[# 0, 5] = 9;
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
						obj_inventory.magic_grid[# 0, 5] = 10;
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
//Meteor Grace Upgrade
//Path: obj_text > Draw GUI event > text_script = DrawAlterMenu > _magicDraw = DrawMeteorUpgrade
function MeteorGraceUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	


switch (obj_inventory.magic_grid[# 0, 6])
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
						obj_inventory.magic_grid[# 0, 6] = 2;
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
						obj_inventory.magic_grid[# 0, 6] = 3;
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
						obj_inventory.magic_grid[# 0, 6] = 4;
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
						obj_inventory.magic_grid[# 0, 6] = 5;
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
						obj_inventory.magic_grid[# 0, 6] = 6;
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
						obj_inventory.magic_grid[# 0, 6] = 7;
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
						obj_inventory.magic_grid[# 0, 6] = 8;
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
						obj_inventory.magic_grid[# 0, 6] = 9;
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
						obj_inventory.magic_grid[# 0, 6] = 10;
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
var _graceExplain ="Grace affects the damage of\nthe magics special attack. It's\ndamage is the players magic plus\n3 multiplied by the weapons Grace\nstat squared.\n\nDamage:" + string(obj_player.magic + ((3 *obj_inventory.weapon_grid[# 0, 6]) * obj_inventory.weapon_grid[# 0, 6])) + "(" + string(obj_player.magic) + "+ 3 x" + string(obj_inventory.weapon_grid[# 0, 6]) + " x " + string(obj_inventory.weapon_grid[# 0, 6])+ ")";
draw_text_transformed(38,80,_graceExplain,.35,.35,0);
draw_set_halign(fa_center);
}

