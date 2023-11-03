//crystal Scripts
//
//
//
//
//
//crystal Lists
function scr_inventory_crystal_create(){
crystal_script = array_create(25,0);
crystal_enchant = array_create(25,false);
crystal_enchant[1] = true;


crystal_script[0] = scr_player_crystal_natural_cast;
crystal_script[1] = scr_player_crystal_spectral_cast;
crystal_script[2] = scr_player_crystal_yelline_cast;
crystal_script[3] = scr_player_crystal_orine_cast;
crystal_script[4] = scr_player_crystal_violine_cast;
crystal_script[5] = scr_player_crystal_bluine_cast;
crystal_script[6] = scr_player_crystal_grenine_cast;
crystal_script[7] = scr_player_crystal_redine_cast;
crystal_script[8] = scr_player_crystal_cure_cast;
//crystal_script[9] = scr_player_crystal_yellowUltra_cast;
//crystal_script[10] = scr_player_crystal_orangeUltra_cast;
//crystal_script[11] = scr_player_crystal_purpleUltra_cast;
crystal_script[12] = scr_player_crystal_blueUltra_cast;


}
//
//
//
//
//
//Crystal Select
function scr_player_crystal_select(){
	
if (mouse_wheel_up())
{
	if (crystal_selected > 0)
	{
		crystal_selected = crystal_selected - 1;
	}
	else
	{
		crystal_selected = iteration;
	}
}
if (mouse_wheel_down())
{
	if (crystal_selected < iteration)
	{
		crystal_selected = crystal_selected + 1;
	}
	else
	{
		crystal_selected = 0;
	}
}
}
//
//
//
//
//
//Crystal Natural
function scr_player_crystal_natural_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Spectral
function scr_player_crystal_spectral_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	//crystal_stone = crystal_stone - 1;
	hp = hp + (150 + (35 * receptivity));
	if (hp > max_hp) hp = max_hp;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Yelline
function scr_player_crystal_yelline_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	yellow_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Orine
function scr_player_crystal_orine_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	orange_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Purple
function scr_player_crystal_violine_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	purple_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Blue
function scr_player_crystal_bluine_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	blue_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Green
function scr_player_crystal_grenine_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	green_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Red
function scr_player_crystal_redine_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	red_primary = max_charge;
	state_script = free_state;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Cure
function scr_player_crystal_cure_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Crystal?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	ablaze = false;
	ablaze_dur_timer = 0;
	ablaze_damage_timer = 0;
	thundux = false;
	thundux_dur_timer = 0;
	voidsick = false;
	voidsick_dur_timer = 0;
	watervice = false;
	watervice_dur_timer = 0;
	watervice_flash_timer = 0;
	knockback = false;
	knockback_dur = 0;
	knockback_dir = 0;
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}
//
//
//
//
//
//Crystal Blue Ultra
function scr_player_crystal_blueUltra_cast(){
invincible = false;
if (stamina < max_stamina) and (thundux = false)//Stamina Recharge
{
	if (stamina_timer > 0) stamina_timer = stamina_timer - 1;
	if (stamina_timer <= 0) 
	{
		stamina_timer = 3;
		stamina = stamina + 1;
	}
}
//Charge Primary?
if (magic_timer > 0) //Magic time between shots
{
	magic_timer = magic_timer - 1;
}
if (melee_timer > 0)
{
	melee_timer = melee_timer - 1;
}
//Animation Start
if (sprite_index != crystal_sprite)
{
	//Start Animation From Beginning
	sprite_index = crystal_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	hp = hp + (60 + (15 * receptivity));
	if (hp > max_hp) hp = max_hp;
	with (instance_create_layer(obj_player.x,obj_player.y-8,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_ceriver_dynorb,global.volumeEffects,1);
		audio_play_sound(snd_ceriver_dynorb,0,0);
		break_object = obj_player.break_object;
		fragment_count = 1;
		fragment = obj_fragWater;
		magic = true;
		timer1 = 90;
		damage = 50 + (25 * obj_player.receptivity);//
		projectile_sprite = spr_projectile_ultraBlue;
		projectile_script = scr_projectile_ultraBlue;
		idle_sprite = spr_projectile_ultraBlue;
		projectile_speed = 3.0;
		image_speed = 0;
		hit_by_attack = -1;
		speed = projectile_speed;
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
	}
	crystal_use[crystal_selected] = true;
	animation_end = false;
}
}