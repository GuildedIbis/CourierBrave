//Crull Scripts
//
//
//
//
//
//Crull Lists
function scr_inventory_crull_create(){
crull_script = array_create(25);
crull_recipe = array_create(25,false);
crull_recipe[0] = true;


crull_script[0] = scr_player_crull_natural;
crull_script[1] = scr_player_crull_spectral;
crull_script[2] = scr_player_crull_yelline;
crull_script[3] = scr_player_crull_orine;
crull_script[4] = scr_player_crull_violine;
crull_script[5] = scr_player_crull_bluine;
crull_script[6] = scr_player_crull_grenine;
crull_script[7] = scr_player_crull_redine;
crull_script[8] = scr_player_crull_cure;
crull_script[9] = scr_player_crull_natural;
crull_script[10] = scr_player_crull_natural;
crull_script[11] = scr_player_crull_natural;
crull_script[12] = scr_player_crull_natural;
crull_script[13] = scr_player_crull_natural;
crull_script[14] = scr_player_crull_natural;
crull_script[15] = scr_player_crull_natural;
crull_script[16] = scr_player_crull_natural;
crull_script[17] = scr_player_crull_natural;
crull_script[18] = scr_player_crull_natural;

}
//
//
//
//
//
//Crull Select
function scr_player_crull_select(){
	
if (mouse_wheel_up())
{
	if (crull_selected > 0)
	{
		crull_selected = crull_selected - 1;
	}
	else
	{
		crull_selected = iteration;
	}
}
if (mouse_wheel_down())
{
	if (crull_selected < iteration)
	{
		crull_selected = crull_selected + 1;
	}
	else
	{
		crull_selected = 0;
	}
}
}
//
//
//
//
//
//Crull Natural
function scr_player_crull_natural(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Spectral
function scr_player_crull_spectral(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
}

//Animate
scr_player_animation();

if (animation_end)
{
	//crull_stone = crull_stone - 1;
	hp = hp + (150 + (35 * receptivity));
	if (hp > max_hp) hp = max_hp;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Yelline
function scr_player_crull_yelline(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	yellow_primary = yellow_primary + (60 + (15 * receptivity));
	if (yellow_primary > max_charge) yellow_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Orine
function scr_player_crull_orine(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	orange_primary = orange_primary + (60 + (15 * receptivity));
	if (orange_primary > max_charge) orange_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Purple
function scr_player_crull_violine(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	purple_primary = purple_primary + (60 + (15 * receptivity));
	if (purple_primary > max_charge) purple_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Blue
function scr_player_crull_bluine(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	blue_primary = blue_primary + (60 + (15 * receptivity));
	if (blue_primary > max_charge) blue_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Green
function scr_player_crull_grenine(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	green_primary = green_primary + (60 + (15 * receptivity));
	if (green_primary > max_charge) green_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Red
function scr_player_crull_redine(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	red_primary = red_primary + (60 + (15 * receptivity));
	if (red_primary > max_charge) red_primary = max_charge;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}
//
//
//
//
//
//Crull Cure
function scr_player_crull_cure(){
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
if (sprite_index != crull_sprite)
{
	//Start Animation From Beginning
	sprite_index = crull_sprite;
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
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}