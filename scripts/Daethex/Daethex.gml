//Daethex
//
//
//
//
//
//Daethex Set (create)
function scr_player_daethex_set(){
form = 5;
form_type = 5;
home_state = scr_player_daethex_set;
free_state = scr_player_daethex_free;
state_script = scr_player_daethex_free;
idle_sprite = spr_player_daethex_idle;
roll_sprite = spr_player_daethex_roll;
//crystal_sprite = spr_player_daethex_crystal;
//recharge_sprite = spr_player_daethex_recharge;
arm_sprite = spr_player_daethex_castArm;
magicP_script = scr_player_daethex_bloodNeedle;
magicA_script = scr_player_daethex_bloodNeedle;
magic_primary = true;
obj_cursor.curs_script = scr_cursor_daethex;


//Dynamic Variables
base_spread = 12;
projectile_spread = 12;
magic_timer = 0;
melee_timer = 0;
walk_spd = 1.25;
armor = 6;
max_charge = 200 + (25 * conviction);
max_stamina = 200 + (25 * energy);
max_hp = 200 + (25 * vitality);
primary_cost = 8;
special_cost = 40;
overshield = 0;
}
//
//
//
//
//
//Daethex Free (home) state
function scr_player_daethex_free(){
//Set
walk_spd = 1.25;
attacking = false;
casting = false;

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Standard Timers
scr_player_standard_timers(16,true,true,true,true,base_spread);

//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_daethex_run;
}
else sprite_index = spr_player_daethex_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
scr_player_animation();

//Melee Attack
//var _weaponCost
//if (obj_inventory.form_grid[# 3, 5] = false)
//{
//	_weaponCost = 15;
//}
//else
//{
//	_weaponCost = 0;
//}
//if (key_attackW) and (stamina >= _weaponCost)
//{
//	if (thundux = false) and (weapon_count >= 1)
//	{
//		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
//		timer1 = 15;
//		attack_script = scr_player_daethex_boomerang;
//		state_script = scr_player_attack;
//	}
//}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		//Blood Needle
		if (magic_primary = true) and (red_primary >= 8)
		{
			attack_script = magicP_script;
			state_script = scr_player_attack;
			base_spread = 12;
			projectile_spread = 12;
		}
		//Dynorb
		if (magic_primary = false) and (red_primary >= 8)
		{
			attack_script = magicA_script;
			state_script = scr_player_attack;
			base_spread = 12;
			projectile_spread = 12;
		}
	}

}

//Special Attack 
//if (key_attackS) and (blue_special >= 40)
//{
//	if (watervice = false)
//	{
//		attack_script = scr_player_daethex_steelorb;
//		state_script = scr_player_attack;
//	}
//}
////Roll State
//if (key_ability) and (stamina >= 50)
//{
//	if (thundux = false)
//	{
//		audio_sound_gain(snd_player_roll,global.volumeEffects,1);
//		audio_play_sound(snd_player_roll,0,false);
//		stamina = stamina - 50;
//		state_script = scr_player_roll;
//		remain_dist = roll_dist;
//	}
//}

//Switch Magic Fire
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.form_grid[# 5, 7] = true)
{
	if (magic_primary = true)
	{
		magic_primary = false;
		attack_script = magicA_script;
		primary_cost = 8;
		projectile_spread = 12;
		base_spread = 12;
	}
	else
	{
		magic_primary = true;
		attack_script = magicP_script;
		primary_cost = 8;
		projectile_spread = 12;
		base_spread = 12;
	}
}

//Switch Weapon Aim
if (keyboard_check_pressed(ord("Z")))
{
	if (weapon_aim = true)
	{
		weapon_aim = false;
	}
	else
	{
		weapon_aim = true;
	}
}
//End Daethex Free State
}
//
//
//
//
//
//Adavio Void Cycle State
function scr_player_daethex_bloodNeedle(){
//Set
walk_spd = 1.1;
attacking = true;
casting = true;

///Standard Timers
scr_player_standard_timers(20,true,true,true,true,-1);


//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

//Movement 2: Collision
scr_player_collision();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_daethex_runCast;
}
else sprite_index = spr_player_daethex_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
scr_player_projectile_spawn();

//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	scr_camera_screen_shake(1,5);
	red_primary = red_primary - 8;
	//audio_sound_gain(snd_adavio_voidBits,global.volumeEffects,1);
	//audio_play_sound(snd_adavio_voidBits,0,0);
	for (var i = 0; i < 7; i = i + 1)
	{
		with (instance_create_layer(x+dir_offX,y+dir_offY,"Instances",obj_projectile))
		{
			break_object = obj_player.break_object;
			magic = true;
			fragment_count = 1;
			fragment = obj_fragRed;
			damage = 7; //+ (6 * obj_player.grace) + ((obj_inventory.form_grid[# 2, 7])*8);//
			projectile_sprite = spr_projectile_daethex_bloodNeedle;
			projectile_script = scr_projectile_daethex_bloodNeedle;
			timer1 = 10;
			idle_sprite = spr_projectile_daethex_bloodNeedle;
			hit_by_attack = -1;
			direction = (point_direction(x,y,mouse_x,mouse_y) - 15 + (5 * i)) + irandom_range(-1,1);
			image_angle = direction;
			projectile_speed = 4.0;
		}
	}
	magic_timer = 15;
}

//Animate
scr_player_animation_cast();

//Reset or return to free state
if (mouse_check_button(mb_left) = false) or (red_primary < 8)
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
//Cursor and Porjectiles
//
//
//
//
//
//Daethex Cursor
function scr_cursor_daethex(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 5;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 1.5;
if (obj_player.magic_primary = false) spread = 24;
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
//
//
//
//
//
//
function scr_projectile_daethex_bloodNeedle(){
//Set
lit = true;
speed = projectile_speed;
if (timer1 > 0) timer1 = timer1 - 1;
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

//Collision
if (place_meeting(x,y,obj_enemy)) 
{
	
	scr_player_attack_calculate_magic(projectile_sprite,self,-1,-1,-1,-1,-1,-1,1);
	//instance_destroy();
}
if (place_meeting(x,y,break_object)) or (timer1 <= 0)
{
	instance_destroy();
}
}//
//
//
//
//
//Daethex Cursor Draw
function xDaethexCursorDraw(){
if (curs_width > 8) or (curs_height > 8)
{
	var xOff = ((curs_width/2))
	var yOff = ((curs_height/2))
}
else 
{
	var xOff = 0
	var yOff = 0
}
draw_sprite_stretched(spr_cursor_play,curs_form,x-xOff,y-yOff,curs_width,curs_height);
}