//Ceriver
//
//
//
//
//
//Ceriver Set (create)
function CeriverSet(){
form = 1;
home_state = CeriverSet;
free_state = CeriverFree;
state_script = CeriverFree;
idle_sprite = spr_player_ceriver_idle;
roll_sprite = spr_player_ceriver_roll;
crull_sprite = spr_player_ceriver_crull;
recharge_sprite = spr_player_ceriver_recharge;
magicP_script = CeriverPolyorbCast;
magicA_script = CeriverDynorbCast;
magic_primary = true;
obj_cursor.curs_script = CeriverCursor;

melee_draw = DrawCeriverBoomerangUpgrade;
magic_draw = DrawCeriverDynorbUpgrade;
armor_draw = DrawCeriverArmorUpgrade;
special_draw = DrawCeriverSpecialUpgrade;



//Dynamic Variables
weapon_count = 3;
max_weapon_count = 3;
magic_timer = 0;
timer1 = 0;
walk_spd = 1.75;
armor = 9 + (5 * (obj_inventory.form_grid[# 1, 6] -1));
max_magic_count = 20 + (obj_inventory.form_grid[# 1, 7] * 2);
magic_count = 0;
if (magic_count > max_magic_count) magic_count = max_magic_count;
special_count = 0;
max_special_count = 3;
max_special_timer = 600 - round(42 * obj_inventory.form_grid[# 1, 8]);
}
//
//
//
//
//
//Ceriver Free (home) state
function CeriverFree(){
//Movement 1: Set
walk_spd = 1.75;
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
if (stamina < max_stamina) //Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
if (charge < max_charge) //charge Recharge
{
	if (charge_timer > 0) charge_timer = charge_timer - 1;
	if (charge_timer <= 0) 
	{
		charge_timer = 5;
		charge = charge + 1;
	}
}
if (magic_timer > 0) and (voidsick = false)
{
	magic_timer = magic_timer - 1;
}
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (special_timer < max_special_timer) and (watervice = false)
	{
		if (special_count < max_special_count) special_timer = special_timer + 1;
	}
	if (special_timer >= max_special_timer) and (special_count < max_special_count)
	{
		special_timer = 0;
		special_count = special_count + 1;
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
	sprite_index = spr_player_ceriver_run;
}
else sprite_index = spr_player_ceriver_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attackW) and (weapon_count >= 1)
{
	if (thundux = false) and (stamina >= 15)
	{
		direction = round(point_direction(x,y,mouse_x,mouse_y)/90) * 90;
		stamina = stamina - 15;
		timer1 = 15;
		attack_script = CeriverBoomerang;
		state_script = PlayerStateAttack;
	}
}

//Magic Attack
if (key_attackM) and (voidsick = false)
{
	if (magic_timer <= 0)
	{
		//Polyorb
		if (magic_primary = true) and (charge >= 8)
		{
			timer2 = 0;
			//max_magic_count = 24 + (obj_inventory.form_grid[# 1, 7] * 2);
			attack_script = magicP_script;
			state_script = PlayerStateAttack;
		}
		//Dynorb
		if (magic_primary = false) and (charge >= 5)
		{
			timer2 = 0;
			//max_magic_count = 24 + ((obj_inventory.form_grid[# 1, 7]*2));
			attack_script = magicA_script;
			state_script = PlayerStateAttack;
			with (instance_create_layer(obj_player.x,obj_player.y-10,"Instances",obj_projectile))
			{
				timer2 = 30;
				damage = 0;
				dir_offX = 0;
				dir_offY = 0;
				break_object = obj_player.break_object;
				magic = true;
				cast = false;
				fragment_count = 1;
				fragment = obj_fragWater;
				projectile_sprite = spr_ceriver_dynorb;
				projectile_script = CeriverDynorbFree;
				idle_sprite = spr_ceriver_dynorb;
				hit_by_attack = -1;
				//script_execute(LeafArcCreate);
				direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
				image_angle = direction;
				projectile_speed = 4.0;
				speed = 0;
				image_speed = 0;
			}
			timer2 = 10;
			magic_timer = 10;
		}
	}

}

//Special Attack
if (obj_inventory.form_grid[# form, 8] > 0)
{
	if (key_attackS) and (special_count > 0)
	{
		if (watervice = false)
		{
			magic_timer = 30;
			attack_script = CeriverDrainDartCast;
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
	if (voidsick = false)
	{
		audio_sound_gain(snd_player_crull,global.volumeEffects,1);
		audio_play_sound(snd_player_crull,0,false);
		magic_count = max_magic_count;
		state_script = PlayerStateRecharge;	
	}
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

//Switch Magic Fire
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
//Ceriver Boomerang State
function CeriverBoomerang(){
//Set
attacking = true;
damage = round(might/2) + (13 * obj_inventory.form_grid[# 1, 5]);
timer1 = timer1 - 1;

//Timed Attack Sound
//if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
//if (atk_snd_delay <= 0)
//{
//	audio_sound_gain(snd_ceriver_boomerang,global.volumeEffects,1);
//	audio_play_sound(snd_ceriver_boomerang,0,0,global.volumeEffects);
//	atk_snd_delay = 20;
//}


//Attack Start
if (sprite_index != spr_player_ceriver_boomerangThrow)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_ceriver_boomerangThrow;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Animate
PlayerAnimation();

//Create Boomerange Projectile
if (timer1 <= 0)
{
	audio_sound_gain(snd_ceriver_boomerang,global.volumeEffects,1);
	audio_play_sound(snd_ceriver_boomerang,0,0,global.volumeEffects);
	timer1 = 15;
	weapon_count = weapon_count - 1;
	with (instance_create_layer(x,y-8,"Instances",obj_projectile))
	{
		return_timer = 35;
		sd_timer = 120;
		break_object = obj_player.break_object;
		magic = false;
		damage = obj_player.might + ((obj_inventory.form_grid[# 1, 6])*2);//
		projectile_sprite = spr_ceriver_boomerang;
		projectile_script = CeriverBoomerangFree;
		idle_sprite = spr_ceriver_boomerang;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 2.5;
		returning = false;
	}
}

//Return to Free State or Continue Throwing Boomerangs (if possible)
if (animation_end)
{
	if (mouse_check_button(mb_right)) and (weapon_count >= 1)
	{
		if (thundux = false) and (stamina >= 15)
		{
			stamina = stamina - 15;
			timer1 = 15;
			attack_script = CeriverBoomerang;
			state_script = PlayerStateAttack;
		}
	}
	else
	{
		attacking = false;
		state_script = free_state;
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
//Boomerange Free Script
function CeriverBoomerangFree(){
//Step
if (sd_timer > 0) sd_timer = sd_timer - 1; 
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

if (returning = false)
{
	return_timer = return_timer - 1;
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
	if (place_meeting(x,y,break_object)) or (return_timer <= 0)
	{
		returning = true;
	}
	if (place_meeting(x,y,obj_resource)) or (return_timer <= 0)
	{
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
}
if (returning = true)
{
	direction = point_direction(x,y,obj_player.x,obj_player.y-6);
	if (place_meeting(x,y,obj_player))
	{
		obj_player.weapon_count = obj_player.weapon_count + 1;
		instance_destroy();
	}
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,1.5,-1,-1,-1,-1,-1);
		returning = true;
	}
}
if (sd_timer <= 0)
{
	obj_player.weapon_count = obj_player.weapon_count + 1;
	instance_destroy();
}

}
//
//
//
//
//
//Ceriver Dynorb Magic State
function CeriverDynorbCast(){
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
if (timer2 < 120) timer2 = timer2 + 1;
//if (special_timer < max_special_timer) and (watervice = false)
//{
//	special_timer = special_timer + 1;
//}


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
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Create Bullet at end timer - timer is length of weapon sprite animation


//Animate
PlayerAnimation();

if (mouse_check_button(mb_left) = false) 
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
//Ceriver Dynorb Projectile Script
function CeriverDynorbFree(){
//Step
depth = obj_player.depth - 1;
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

if (cast = false)
{
	var _dirPos = round(obj_player.direction/90);
	
	switch(_dirPos)
	{
		case 0:
			x = obj_player.x+3;
			y = obj_player.y-14;
			dir_offX = 3;
			dir_offY = -14;
		break;
		
		case 4:
			x = obj_player.x+3;
			y = obj_player.y-14;
			dir_offX = 3;
			dir_offY = -14;
		break;
		
		case 1:
			x = obj_player.x+4;
			y = obj_player.y-14;
			dir_offX = 4;
			dir_offY = -14;
		break;
		
		case 2:
			x = obj_player.x-3;
			y = obj_player.y-14;
			dir_offX = -3;
			dir_offY = -14;
		break;
		
		case 3:
			x = obj_player.x-5;
			y = obj_player.y-14;
			dir_offX = -5;
			dir_offY = -14;
		break;
		
	}
	speed = 0;
	timer2 = timer2 + 1;
	var _stage = min(4,round(timer2/30));
	image_index = max(0,_stage-1)
	if (mouse_check_button_released(mb_left)) or (_stage * 5 >= obj_player.charge)
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		obj_player.charge = obj_player.charge - _stage * 5;
		cast = true;
		damage = (round(obj_player.grace/2)*_stage)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(_stage));
		direction = (point_direction(x,y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 4.0;
		with (obj_player)
		{
			attacking = false;
			state_script = free_state;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
		}
		
	}
	if (timer2 >= 119)
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		obj_player.charge = obj_player.charge - _stage * 5;
		cast = true;
		damage = (round(obj_player.grace/2)*_stage)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(_stage));
		direction = irandom_range(-1,1) + (point_direction(x,y,mouse_x,mouse_y));
		image_angle = direction;
		projectile_speed = 4.0;
		with (obj_player)
		{
			attacking = false;
			state_script = free_state;
			damage = 0;
			animation_end = false;
			atk_snd_delay = 0;
		}
		
	}
}

if (cast = true)
{
	speed = projectile_speed;
	if (place_meeting(x,y,obj_enemy)) 
	{
	
		AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
		instance_destroy();
	}
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
}

}
//
//
//
//
//
//Ceriver Polyorb Magic State
function CeriverPolyorbCast(){
walk_spd = 1.2;
attacking = true;



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
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
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
		dir_offX = 4;
		dir_offY = -14;
	break;
		
	case 2:
		dir_offX = -3;
		dir_offY = -14;
	break;
		
	case 3:
		dir_offX = -5;
		dir_offY = -14;
	break;	
}

//Create Bullet at end timer - timer is length of weapon sprite animation
if (timer2 <= 0)
{	
	charge = charge - 8;
	with (instance_create_layer(obj_player.x + dir_offX,obj_player.y + dir_offY,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		follow_timer = 0;
		sd_timer = 30;
		damage = round(obj_player.grace/4) + ((obj_inventory.form_grid[# 1, 7]-1)*(1));//
		projectile_sprite = spr_ceriver_polyorb;
		projectile_script = CeriverPolyorbFree;
		idle_sprite = spr_ceriver_polyorb;
		image_index = irandom_range(0,3);
		projectile_speed = 3.0 + (.5 * image_index);
		image_speed = 0;
		damage = damage + ((obj_inventory.form_grid[# 1, 7]) * image_index);
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y) + irandom_range(-12,12);
		image_angle = direction;
	}
	timer2 = 5;
	magic_timer = 5;
}

//Animate
PlayerAnimation();

//End State, Return to Free State
if (mouse_check_button(mb_left) = false) or (charge < 8)
{
	attacking = false;
	state_script = free_state;
	damage = 0;
	animation_end = false;
	atk_snd_delay = 0;
	magic_timer = 5;
}
}//
//
//
//
//
//
//Ceriver Polyorb Projectile Script
function CeriverPolyorbFree(){

//Step
image_speed = 0;
if (follow_timer > 0) follow_timer = follow_timer - 1;
if (sd_timer > 0) sd_timer = sd_timer - 1;
speed = projectile_speed;
if (place_meeting(x,y,obj_player)) depth = obj_player.depth - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,-1);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	instance_destroy();
}
if (sd_timer <= 0) instance_destroy();

}//
//
//
//
//Ceriver Drain Dart Cast 
function CeriverDrainDartCast(){
walk_spd = 1.2;
attacking = true;



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
	sprite_index = spr_player_ceriver_runCast;
}
else sprite_index = spr_player_ceriver_cast;
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

//Animate
PlayerAnimation();

if (magic_timer <= 0) and (special_count >= 1)
{
	audio_sound_gain(snd_ceriver_drainDart,global.volumeEffects,1);
	audio_play_sound(snd_ceriver_drainDart,0,0);
	magic_timer = 30;
	special_count = special_count - 1;
	with (instance_create_layer(x + dir_offX,y + dir_offY,"Instances",obj_projectile))
	{
		timer1 = 120;
		timer1 = 30;
		target = -1;
		break_object = obj_player.break_object;
		damage = obj_player.grace + (12 * obj_inventory.form_grid[# 1, 8]);
		idle_sprite = spr_flameSeed;
		projectile_sprite = spr_drainDart;
		projectile_script = CeriverDrainDart;
		hit_by_attack = -1;
		enemy_in_range = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(obj_player.x,obj_player.y-14,mouse_x,mouse_y);
		image_angle = direction;
		projectile_speed = 2.5;
	}
	if (special_count <= 0) or (keyboard_check(vk_shift) = false)
	{
		attacking = false;
		state_script = free_state;
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
//Ceriver Special Projectile Script
function CeriverDrainDart(){
//Step

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
	
	AttackCalculateStatus(projectile_sprite,self,-1,-1,-1,-1,-1,.25);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	instance_destroy();
}
}
//
//
//
//
//
//Draw Cerivers's Boomerang Upgrade at Smith NPC's
function DrawCeriverBoomerangUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Boomerangs",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 1, 5])
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
					if (ItemCheckQuantity(obj_inventory,4,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 4, 1);
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
		draw_sprite_stretched(spr_item_all,4,94,107,16,16);
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
					if (ItemCheckQuantity(obj_inventory,11,5))
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
var _damage = obj_player.might + (11 * obj_inventory.form_grid[# 1, 5]);
var _damage1 = obj_player.might + (11 * (obj_inventory.form_grid[# 1, 5]+1));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 1, 5]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 5] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])

}
//
//
//
//
//
//Draw Ceriver's Armor Upgrade at Smith NPC's
function DrawCeriverArmorUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Armor",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 1, 6])
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
					if (ItemCheckQuantity(obj_inventory,4,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 5);
						ItemRemove(obj_inventory, 4, 1);
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
		draw_sprite_stretched(spr_item_all,4,94,107,16,16);
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
					if (ItemCheckQuantity(obj_inventory,11,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 0, 6] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 11, 5);
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
		draw_sprite_stretched(spr_item_all,11,111,107,16,16);
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
var _armor = 9 + (5 * (obj_inventory.form_grid[# 1, 6] -1))
var _armor1 = 9 + (5 * (obj_inventory.form_grid[# 1, 6]))
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 1, 6]) + ": " + string(_armor) + " > Level " + string(obj_inventory.form_grid[# 1, 6] + 1) + ": " + string(_armor1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//obj_player.armor = 6 + (12 * (obj_inventory.form_grid[# 0, 6] -1))
}
//
//
//
//
//
//Draw Ceriver's Magic Upgrade at Browi NPC
function DrawCeriverDynorbUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Dynorb",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 1, 7])
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
					if (ItemCheckQuantity(obj_inventory,4,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 5);
						ItemRemove(obj_inventory, 4, 1);
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
		draw_sprite_stretched(spr_item_all,4,94,107,16,16);
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
var _damage = string((round(obj_player.grace/2))  + ((obj_inventory.form_grid[# 1, 7])*(4))) + "-" + string((round(obj_player.grace/2)*4)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(4)));
var _damage1 = string((round(obj_player.grace/2))  + ((obj_inventory.form_grid[# 1, 7] + 1)*(4))) + "-" + string((round(obj_player.grace/2)*4)  + ((obj_inventory.form_grid[# 1, 7]+1)*(4)*(4)));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 0, 7]) + ": " + _damage + " > Level " + string(obj_inventory.form_grid[# 0, 7] + 1) + ": " + _damage1;
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Draw Ceriver Special Upgrade at Browi NPC
function DrawCeriverSpecialUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,112,13);
draw_text_transformed(74,48,"Drain Dart",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 1, 8])
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
					if (ItemCheckQuantity(obj_inventory,4,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 8] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 15, 1);
						ItemRemove(obj_inventory, 4, 1);
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
		draw_sprite_stretched(spr_item_all,4,94,107,16,16);
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
					if (ItemCheckQuantity(obj_inventory,11,5))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 1, 8] = 3;
						ItemRemove(obj_inventory, 4, 5);
						ItemRemove(obj_inventory, 4, 1);
						ItemRemove(obj_inventory, 11, 5);
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
		draw_sprite_stretched(spr_item_all,11,111,107,16,16);
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
var _damage =  obj_player.grace + (12 * obj_inventory.form_grid[# 1, 8]);
var _damage1 =  obj_player.grace + (12 * (obj_inventory.form_grid[# 1, 8]+1));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 1, 8]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 0, 8] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Ceriver Selected
function CeriverSelected(){
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
draw_sprite(spr_weapons_allGame,1,70,42);
draw_sprite(spr_armor_allGame,1,70,76);
draw_sprite(spr_magic_allGame,1,162,42);
draw_sprite(spr_special_allGame,1,162,76);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 1, 5]-1,70,63);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 1, 6]-1,70,97);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 1, 7]-1,162,63);
draw_sprite(spr_menu_inventoryForm_level,obj_inventory.form_grid[# 1, 8]-1,162,97);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(115,118,"CERIVER",.35,.35,0);
draw_text_transformed(178,118,"EQUIP",.35,.35,0);
draw_text_transformed(212,118,"BACK",.35,.35,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _weaponText = "WEAPON: L-CLICK\nThrow a boomerang for\n" + string(obj_player.might + (11 * obj_inventory.form_grid[# 1, 5])) + " damage per hit.\nHas two boomerangs."
draw_text_transformed(104,42,_weaponText,.35,.35,0);
var _armorText = "ARMOR: PASSIVE\nBlock " + string(9 + (5 * (obj_inventory.form_grid[# 1, 6] -1))) + " incoming\ndamage."
draw_text_transformed(104,76,_armorText,.35,.35,0);
var _magicText = "MAGIC: R-CLICK\nFire a projectile that\ngrows if held.\nRelease to fire for\n" + string((round(obj_player.grace/2))  + ((obj_inventory.form_grid[# 1, 7])*(4))) + "-" + string((round(obj_player.grace/2)*4)  + ((obj_inventory.form_grid[# 1, 7])*(4)*(4))) + "damage."
draw_text_transformed(196,42,_magicText,.35,.35,0);
var _specialText = "SPECIAL: SHIFT\nShoot 3 projectiles\nthat heal a 1/4\nof the" + string(obj_player.grace + (12 * obj_inventory.form_grid[# 1, 8])) + " damage\ndealt."
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
			form = 1;
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
//Ceriver Cursor
function CeriverCursor(){
//cursPlay_sprite = spr_cursor_play;
//sprite_index = cursPlay_sprite;
image_speed = 0;
follow_x = mouse_x;
follow_y = mouse_y;
curs_form = 1;

//Move toward variables set to player XY
x = x + (follow_x - x) / 15;
y = y + (follow_y - y) / 15;
if (obj_player.magic_primary = true) spread = 24;
if (obj_player.magic_primary = false) spread = 2.5;
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
//Ceriver Cursor Draw
function CeriverCursorDraw(){
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