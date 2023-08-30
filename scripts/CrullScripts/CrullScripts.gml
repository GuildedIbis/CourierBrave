//Crull Scripts
//
//
//
//
//
//Crull Lists
function scr_crull_list_create(){
crull_script = array_create(18);
crull_recipe = array_create(18,false);

crull_script[0] = scr_player_crull_natural;
crull_script[1] = scr_player_crull_spectral;
crull_script[2] = scr_player_crull_natural;
crull_script[3] = scr_player_crull_natural;
crull_script[4] = scr_player_crull_natural;
crull_script[5] = scr_player_crull_natural;
crull_script[6] = scr_player_crull_natural;
crull_script[7] = scr_player_crull_natural;
crull_script[8] = scr_player_crull_natural;
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
	if (crull_selected < iteration)
	{
		crull_selected = crull_selected + 1;
	}
	else
	{
		crull_selected = 0;
	}
}
if (mouse_wheel_down())
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
PlayerAnimation();

if (animation_end)
{
	crull_stone = crull_stone - 1;
	hp = hp + (100 + (25 * receptivity));
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
PlayerAnimation();

if (animation_end)
{
	crull_stone = crull_stone - 1;
	hp = hp + (150 + (35 * receptivity));
	if (hp > max_hp) hp = max_hp;
	state_script = free_state;
	crull_ary[crull_selected] = -1;
	animation_end = false;
}
}