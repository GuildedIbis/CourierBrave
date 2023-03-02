//Regaliare
//
//
//
//
//
//Regaliare Set (create)
function RegaliareSet(){
form = 0;
home_state = RegaliareSet;
free_state = RegaliareFree;
state_script = RegaliareFree;
magicP_script = RegaliareGoldBurst;
magicA_script = RegaliareHeavyBurst;
magic_primary = true;
idle_sprite = spr_player_regaliare_idle;
roll_sprite = spr_player_regaliare_roll;
crull_sprite = spr_player_regaliare_crull;
recharge_sprite = spr_player_regaliare_recharge;
obj_cursor.curs_script = RegaliareCursor;

melee_draw = DrawRegaliareSlashUpgrade;
magic_draw = DrawRegaliareMagicUpgrade;
armor_draw = DrawRegaliareArmorUpgrade;
special_draw = DrawRegaliareSpecialUpgrade;



//Dynamic Variables
weapon_count = -1;
max_weapon_count = -1;
magic_timer = 0;
walk_spd = 1.75;
armor = 12 + (6 * (obj_inventory.form_grid[# 0, 6] -1));
max_magic_count = 20 + (obj_inventory.form_grid[# 0, 7] * 2);
magic_count = 0;
special_count = -1;
max_special_count = -1;
if (magic_count > max_magic_count) magic_count = max_magic_count;
max_special_timer = 600 - round(42 * obj_inventory.form_grid[# 0, 8]);
}
//
//
//
//
//
//Regaliare Free (home) state
function RegaliareFree(){
walk_spd = 1.75;
//Movement 1: Set
hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);


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
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (charge < max_charge) and (watervice = false)//charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0)
{
	magic_timer = magic_timer - 1;
}
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (special_timer < max_special_timer)
	{
		special_timer = special_timer + 1;
	}
}


//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_regaliare_run;
}
else sprite_index = spr_player_regaliare_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attackW)
{
	if (thundux = false) and (stamina >= 20)
	{
		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 20;
		attack_script = RegaliareSlash;
		state_script = PlayerStateAttack;
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (charge >= 5)
		{
			timer2 = 0;
			//max_magic_count = 20 + (obj_inventory.form_grid[# 0, 7] * 2);
			max_charge = 50 + (3 * grace);
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (charge >= 10)
		{
			timer2 = 0;
			//max_magic_count = 20 + (obj_inventory.form_grid[# 0, 7] * 2);
			max_charge = 50 + (3 * grace);
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (key_attackS) and (special_timer >= max_special_timer)
	{
		if (watervice = false)
		{
			special_timer = 0;
			attack_script = RegaliareSpecial;
			state_script = PlayerStateAttack;
		}
	}
}

//Roll State
if (key_ability) and (stamina >= 50)
{
	if (thundux = false)
	{
		audio_sound_gain(snd_player_roll,global.volumeEffects,1);
		audio_play_sound(snd_player_roll,0,false);
		stamina = stamina - 50;
		state_script = PlayerStateRoll;
		remain_dist = roll_dist;
	}
}

//Recharge Magic State
if (keyboard_check_pressed(ord("R"))) and (magic_count < max_magic_count)
{
	audio_sound_gain(snd_player_crull,global.volumeEffects,1);
	audio_play_sound(snd_player_crull,0,false);
	magic_count = max_magic_count;
	state_script = PlayerStateRecharge;	
}

//Crull Stone State
if (keyboard_check_pressed(ord("C"))) and (crull_stone >= 1)
{
	audio_sound_gain(snd_player_crull,global.volumeEffects,1);
	audio_play_sound(snd_player_crull,0,false);
	crull_stone = crull_stone - 1;
	hp = hp + 100;
	if (hp > max_hp) hp = max_hp;
	state_script = PlayerStateCrull;
	
}

//Switch Magic Fire Mode
if (keyboard_check_pressed(ord("Q"))) or (keyboard_check_pressed(ord("F")))
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
	}
}

}
//
//
//
//
//
//Regaliare Slash State
function RegaliareSlash(){
attacking = true;
damage = might + (11 * obj_inventory.form_grid[# 0, 5]);
//weapon_sprite = spr_weapon_fayaniBlade;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	//audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0,global.volumeEffects)
	atk_snd_delay = 28;
}
if (special_timer < max_special_timer) and (watervice = false)
{
	special_timer = special_timer + 1;
}


//Attack Start
if (sprite_index != spr_player_regaliare_slash)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_regaliare_slash;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculateStatus(spr_fayaniBlade_hitbox,obj_player,1.5,-1,-1,-1,-1,-1);

//Animate
PlayerAnimation();

if (animation_end)
{
	attacking = false;
	state_script = free_state;
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
//Regaliare Magic State
function RegaliareGoldBurst(){
walk_spd = 1.2;
attacking = true;
//weapon_sprite = spr_spiritStone_meteor;


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
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//} //2/1/23


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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = -4;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -3;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = 5;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (timer2 <= 0)
{	
	//magic_count = magic_count - 1;
	charge = charge - 5;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_goldBullet,0,0);
		break_object = obj_player.break_object;
		magic = true;
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));//
		projectile_sprite = spr_goldBullet;
		projectile_script = RegaliareGoldBullet;
		idle_sprite = spr_goldBullet;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-6,6);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
	}
	timer2 = 10;
	magic_timer = 10;
}

//Animate
PlayerAnimation();

if (mouse_check_button(mb_left) = false) or (charge < 5)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
	magic_timer = 10;
}
}
//
//
//
//
//
//Regaliare Gold Bullet Projectile Script
function RegaliareGoldBullet(){
//Step
if (follow_timer > 0) follow_timer = follow_timer - 1;
if (inv_timer > 0) inv_timer = inv_timer - 1;
speed = projectile_speed;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculate(projectile_sprite);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) and (inv_timer <= 0)
{
	instance_destroy();
}

}
//
//
//
//
//
//Regaliare Heavy Burst Magic
function RegaliareHeavyBurst(){
walk_spd = 1.2;
attacking = true;
//weapon_sprite = spr_spiritStone_meteor;


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
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//} //2/1/23


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
	sprite_index = spr_player_regaliare_runCast;
}
else sprite_index = spr_player_regaliare_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
var _dirPos = round(obj_player.direction/90);
switch(_dirPos)
{
	case 0:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 4:
		dir_offX = 3;
		dir_offY = -14;
	break;
		
	case 1:
		dir_offX = -4;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -3;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = 5;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (timer2 <= 0)
{	
	//magic_count = magic_count - 2;
	charge = charge - 10;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_goldBullet,0,0);
		break_object = obj_player.break_object;
		magic = true;
		//follow_timer = 28; //2/1/23
		fragment_count = 2;
		fragment = obj_fragGold;
		damage = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));//
		projectile_sprite = spr_heavyBullet;
		projectile_script = RegaliareHeavyBullet;
		idle_sprite = spr_heavyBullet;
		hit_by_attack = -1;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-6,6);
		if (direction < 135) and (direction > 45)
		{
			inv_timer = 0;
		}
		else inv_timer = 15;
		image_angle = direction;
		projectile_speed = 4.0;
	}
	timer2 = 15;
	magic_timer = 15;
}

//Animate
PlayerAnimation();

if (mouse_check_button(mb_left) = false) or (charge < 10)
{
	attacking = false;
	state_script = free_state;
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
//Regaliare Heavy Bullet Projectile Script
function RegaliareHeavyBullet(){
//Step
if (inv_timer > 0) inv_timer = inv_timer - 1;
speed = projectile_speed;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	AttackCalculate(projectile_sprite);
}
if (place_meeting(x,y,break_object)) and (inv_timer <= 0)
{
	instance_destroy();
}

}
//
//
//
//
//
//Regaliare Special State
function RegaliareSpecial(){
//
//Timers
if (timer2 > 0) timer2 = timer2 - 1;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 20;
}
//
//State
attacking = true;
if (sprite_index != spr_player_regaliare_cast)
{
	//Start Animation From Beginning
	sprite_index = spr_player_regaliare_cast;
	//sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
//
//Animation
PlayerAnimation();
if (animation_end)
{
	inv_dur_timer = 120;
	invincible = true;
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldArcs,global.volumeEffects,1);
		audio_play_sound(snd_goldArcs,0,0);
		timer1 = 120;
		break_object = obj_player.break_object;
		damage = obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8] - 1));
		idle_sprite = spr_goldArc;
		projectile_sprite = spr_goldArc;
		projectile_script = RegaliareGoldArcs;
		hit_by_attack = -1;
		direction = (floor(other.direction/90))*90;
		image_angle = direction;
	}
	attacking = false;
	state_script = free_state;
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
//Regaliare Gold Arcs Projectile Script
function RegaliareGoldArcs(){
//
//Timers
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
//
//State
x = obj_player.x;
y = obj_player.y - 6;
if (sprite_index != spr_goldArc)
{
	//Start Animation From Beginning
	timer1 = 120;
	sprite_index = spr_goldArc;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{	
	AttackCalculateStatus(spr_goldArc,obj_player,3,-1,-1,-1,-1,-1);
}
if (timer2 <= 0)
{
	timer2 = 15;
	ds_list_clear(hit_by_attack);
}
if (timer1 <= 0)
{
	instance_destroy();
}
}

//
//
//
//
//
//Draw Regaliare's Sword Upgrade at Smith NPC's
function DrawRegaliareSlashUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Regal Blade",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 6, 1);
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
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
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
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 3;
						ItemRemove(obj_inventory, 15, 5);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 4, 5);
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
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
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
var _damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])
var _damage1 = obj_player.might + (11 * (obj_inventory.form_grid[# 0, 5]+1))
var _weaponExplain = "Level " + string(obj_inventory.form_grid[# 0, 5]) + ": " + string(_damage) + " > Level " + string(_damage1);
draw_text_transformed(141,44,_weaponExplain,.5,.5,0);
draw_set_halign(fa_center);
//damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])

}
//
//
//
//
//
//Draw Regaliare's Armor Upgrade at Smith NPC's
function DrawRegaliareArmorUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Armor",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,5,5))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 6, 1);
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
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,5,94,90,16,16);
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,6,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
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
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
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
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 6]) + ": " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6] -1))) + " > Level " + string(obj_inventory.form_grid[# 0, 6] + 1) + ": " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6])));
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//obj_player.armor = 6 + (12 * (obj_inventory.form_grid[# 0, 6] -1))
}
//
//
//
//
//
//Draw Regaliare's Magic Upgrade at Browi NPC
function DrawRegaliareMagicUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Gold Seed",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 7])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,2,5))
				{
					if (ItemCheckQuantity(obj_inventory,9,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 5);
						ItemRemove(obj_inventory, 9, 1);
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
		draw_sprite_stretched(spr_item_all,2,94,90,16,16);
		draw_text_transformed(112,99,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 7] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
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
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
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
var _damage = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));
var _damage1 = round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7])*(5));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 7]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 7] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Draw Regaliare Special Upgrade at Browi NPC
function DrawRegaliareSpecialUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Gold Arc",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 0, 8])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,15,1))
				{
					if (ItemCheckQuantity(obj_inventory,9,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 9, 1);
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
		
		draw_sprite_stretched(spr_item_all,7,94,73,16,16);
		draw_text_transformed(112,82,"10",.35,.35,0);
		draw_sprite_stretched(spr_item_all,15,94,90,16,16);
		draw_text_transformed(112,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,9,94,107,16,16);
		draw_text_transformed(112,116,"1",.35,.35,0);	
	break;
	
	case 2:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,112,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,111,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,113,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,4,5)) and (ItemCheckQuantity(obj_inventory,4,1))
				{
					if (ItemCheckQuantity(obj_inventory,4,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 8] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 4, 5);
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
		
		draw_sprite_stretched(spr_item_all,4,111,73,16,16);
		draw_text_transformed(129,82,"5",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,90,16,16);
		draw_text_transformed(129,99,"1",.35,.35,0);
		draw_sprite_stretched(spr_item_all,4,111,107,16,16);
		draw_text_transformed(129,116,"5",.35,.35,0);	
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
var _damage = obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8] - 1));
var _damage1 = obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8]));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 8]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 8] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Regliare Selected
function RegaliareSelected(){
//Convert Mouse to GUI
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

//Draw Selected Form Menu Sprites (Right Hand Side) //Drawn Regardless if form is selected
draw_sprite_stretched(spr_menu_circle16,1,70,42,32,32);
draw_sprite_stretched(spr_menu,3,70,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,70,76,32,32);
draw_sprite_stretched(spr_menu,3,70,97,32,11);
draw_sprite_stretched(spr_menu_circle16,1,162,42,32,32);
draw_sprite_stretched(spr_menu,3,162,63,32,11);
draw_sprite_stretched(spr_menu_circle16,1,162,76,32,32);
draw_sprite_stretched(spr_menu,3,162,97,32,11);
draw_sprite_stretched(spr_menu,3,70,110,90,16);
draw_sprite_stretched(spr_menu,3,162,110,32,16);
draw_sprite_stretched(spr_menu,3,196,110,32,16);

//Draw the selected form

//Draw it's four levelable features //weapon, armor, magic, special
draw_sprite(spr_weapons_allGame,0,70,42);
draw_sprite(spr_armor_allGame,0,70,76);
draw_sprite(spr_magic_allGame,0,162,42);
draw_sprite(spr_special_allGame,0,162,76);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 5]-1,70,63);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 6]-1,70,97);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 7]-1,162,63);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 0, 8]-1,162,97);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(115,118,"REGALIARE",.35,.35,0);
draw_text_transformed(178,118,"EQUIP",.35,.35,0);
draw_text_transformed(212,118,"BACK",.35,.35,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _weaponText = "WEAPON: L-CLICK\nA quick slash that does\n" + string(obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])) + " damage per hit.\nCan hit multiple targets."
draw_text_transformed(104,42,_weaponText,.35,.35,0);
var _armorText = "ARMOR: PASSIVE\nBlock " + string(12 + (6 * (obj_inventory.form_grid[# 0, 6] -1))) + " incoming\ndamage."
draw_text_transformed(104,76,_armorText,.35,.35,0);
var _magicText = "MAGIC: R-CLICK\nRapidly fire small\ngolden projectiles that\nbreak on inpact and deal\n" + string(round(obj_player.grace/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5))) + " damage per hit."
draw_text_transformed(196,42,_magicText,.35,.35,0);
var _specialText = "SPECIAL: SHIFT\n2 gold arcs that\nspin around the player,\ndealing " + string(obj_player.grace + (6 * (obj_inventory.form_grid[# 0, 8] - 1))) + " damage\nper hit with knockback."
draw_text_transformed(196,76,_specialText,.35,.35,0);



//Equip the form
if (point_in_rectangle(_mouseX,_mouseY,162,110,194,126))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,160,108,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		with (obj_player) 
		{
			form = 0;
			script_execute(obj_inventory.form_grid[# form, 2]);
		}
	}
}
//Return to Select
if (point_in_rectangle(_mouseX,_mouseY,196,110,228,126))
{
	draw_sprite_stretched(spr_highlight_nineslice,0,194,108,36,20);
	if (mouse_check_button_pressed(mb_left))
	{
		audio_sound_gain(snd_menu,global.volumeMenu,1);
		audio_play_sound(snd_menu,0,false);
		inv_gui = FormMenuGUI;
	}
}

}
	//
//
//
//
//
//RegaliareCursor
function RegaliareCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 0;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 3.5;
if (obj_player.magic_primary = false) spread = 3.5;
if (obj_game.gamePaused = false)
{
	var _xClampF = clamp(window_mouse_get_x(),16,window_get_width()-32);
	var _yClampF = clamp(window_mouse_get_y(),16,window_get_height()-32);
	window_mouse_set(_xClampF,_yClampF)

	curs_width = 8 + (point_distance(x,y,obj_player.x,obj_player.y)/spread);
	curs_height = 8 + (point_distance(x,y,obj_player.x,obj_player.y)/spread);

}


depth = -5000;
}
