//Evarel
//
//
//
//
//
//Evarel Set (create)
function EvarelSet(){
form = 4;
home_state = EvarelSet;
free_state = EvarelFree;
state_script = EvarelFree;
idle_sprite = spr_player_evarel_idle;
roll_sprite = spr_player_evarel_roll;
crull_sprite = spr_player_evarel_crull;
//recharge_sprite = spr_player_halofire_recharge;
arm_sprite = spr_player_evarel_castArm;
magicP_script = HalofireMeteorSling;
magicA_script = HalofireFirespitCast;
magic_primary = true;
//weapon_aim = false
obj_cursor.curs_script = HalofireCursor;

weapon_draw = HalofireHamaxeMenu;
magic_draw = HalofireMeteorMenu;
armor_draw = HalofireFirewardArmorMenu;
special_draw = HalofireSpecialMenu;



//Dynamic Variables
weapon_count = -1;
max_weapon_count = -1;
magic_timer = 0;
attack_counter = 0;
max_attack_counter = 0;
walk_spd = 1.75;
special_count = -1;
max_special_count = -1;
armor = 7 + (4 * (obj_inventory.form_grid[# 3, 6] -1));
max_charge = 50 + (3* (grace + round(grace/15)));
max_stamina = 50 + (3* (might + round(might/15)));
max_hp = 150 + (3* (vitality + round(vitality/15)));
}
//
//
//
//
//
//Evarel Free (home) state
function EvarelFree(){
//Set
walk_spd = 1.75;
attacking = false;
casting = false;

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
}

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
if (charge < max_charge) and (watervice = false)//Charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between projectiles
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0) //Weapon time between attacks
{
	weapon_timer = weapon_timer - 1;
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
	sprite_index = spr_player_evarel_run;
}
else sprite_index = spr_player_evarel_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Weapon Attack
if (key_attackW)
{
	if (thundux = false) and (stamina >= 25)
	{
		if (weapon_aim = true) direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 25;
		attack_script = HalofireHamaxe;
		state_script = PlayerStateAttack;
		
	}
}

//Magic Attack
if (key_attackM)
{
	if (magic_timer <= 0)
	{
		if (magic_primary = true) and (charge >= 12)
		{
			max_charge = 100 + (grace + round(grace/15));
			attack_script = EvarelBristlerodCast;
			state_script = PlayerStateAttack;
		}
		if (magic_primary = false) and (charge >= 5)
		{
			max_charge = 100 + (grace + round(grace/15));
			max_attack_counter = floor(charge/20);
			attack_script = HalofireFirespitCast;
			state_script = PlayerStateAttack;
		}
	}
}

//Special Attack
if (key_attackS) and (special >= 500)
{
	if (watervice = false)
	{
		special = special - 500;
		attack_script = HalofireSpecial;
		state_script = PlayerStateAttack;
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

//Potion State
if (keyboard_check_pressed(ord("R"))) 
{

}

//Crull Stone State
if (keyboard_check_pressed(ord("C"))) and (crull_stone >= 1)
{
	audio_sound_gain(snd_player_crull,global.volumeEffects,1);
	audio_play_sound(snd_player_crull,0,false);
	state_script = PlayerStateCrull;
	
}

//Switch Magic Fire
if (keyboard_check_pressed(ord("F"))) and (obj_inventory.quest_grid[# 13, 3] = true)
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

//Switch Weapon Aim Style
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
}
//
//
//
//
//
//Evarel Bristlerod State
function EvarelBristlerodCast(){
//Set
walk_spd = 1.2;
attacking = true;
casting = true;

//Standard Timers
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
if (special < max_special) //Special Recharge
{
	if (special_timer > 0) special_timer = special_timer - 1;
	if (special_timer <= 0)
	{
		special_timer = 5;
		special = special + 1;
	}
}
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (weapon_timer > 0)//Time between weapon uses
{
	weapon_timer = weapon_timer - 1;
}
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//} //2/1/23

//Movement 1: Speed
if (knockback = false)
{
	hor_spd = lengthdir_x(input_mag * walk_spd, input_dir);
	ver_spd = lengthdir_y(input_mag * walk_spd, input_dir);
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
	sprite_index = spr_player_evarel_runCast;
}
else sprite_index = spr_player_evarel_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Bullet Spawn Position
PlayerBulletSpawnPosition();


//Create Bullet at end timer - timer is length of weapon sprite animation
if (magic_timer <= 0)
{	
	//magic_count = magic_count - 1;
	charge = charge - 12;
	with (instance_create_layer(ldX + dir_offX, ldY + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_goldBullet,global.volumeEffects,1);
		audio_play_sound(snd_goldBullet,0,0);
		break_object = other.break_object;
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
		image_angle = direction;
		projectile_speed = 4.0;
	}
	magic_timer = 10;
}

//Animate
PlayerAnimationCast();

//Restart or Return to Free
if (mouse_check_button(mb_left) = false) or (charge < 5)
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
//Evarel Cursor
function EvarelCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 3;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;

if (obj_player.magic_primary = true) spread = 4;
if (obj_player.magic_primary = false) spread = 4;
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