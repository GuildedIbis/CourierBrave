//Halofire
//
//
//
//
//
//Halofire Set (create)
function HalofireSet(){
form = 0;
free_state = HalofireFree;
state_script = HalofireFree;
idle_sprite = spr_player_halofire_idle;
roll_sprite = spr_player_halofire_roll;
crull_sprite = spr_player_halofire_crull;
recharge_sprite = spr_player_halofire_recharge;

melee_draw = DrawHalofireSlashUpgrade;
magic_draw = DrawHalofireMagicUpgrade;
armor_draw = DrawHalofireArmorUpgrade;
special_draw = DrawHalofireSpecialUpgrade;



//Dynamic Variables
armor = 6 + (12 * (obj_inventory.form_grid[# 3, 6] -1));
max_magic_count = 20 + (obj_inventory.form_grid[# 3, 7] * 2);
if (magic_count > max_magic_count) magic_count = max_magic_count;
max_special_timer = 600 - round(42 * obj_inventory.form_grid[# 3, 8]);
}
//
//
//
//
//
//Halofire Free (home) state
function HalofireFree(){

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
if (roll_energy < max_roll_energy) //Roll Recharge
{
	if (energy_timer > 0) energy_timer = energy_timer - 1;
	if (energy_timer <= 0) 
	{
		energy_timer = 3;
		roll_energy = roll_energy + 1;
	}
}
if (special_timer < max_special_timer) special_timer = special_timer + 1;



//Movement 2: Collision
PlayerCollision();

//Movement 3: Environtment
PlayerEnvironment();

//Animation: Update Sprite
var _oldSprite = sprite_index;
if (input_mag != 0)
{
	direction = input_dir;
	sprite_index = spr_player_halofire_run;
}
else sprite_index = spr_player_halofire_idle;
if (_oldSprite != sprite_index) local_frame = 0;


//Update Index
PlayerAnimation();


//Melee Attack
if (key_attack1) 
{
	attack_script = HalofireSlash;
	state_script = PlayerStateAttack;
}

//Magic Attack
if (key_attack2) and (magic_count >= 1)
{
	timer2 = 0;
	max_magic_count = 20 + (obj_inventory.form_grid[# 0, 7] * 2);
	attack_script = RegaliareMagic;
	state_script = PlayerStateAttack;
}

//Special Attack
if (key_attackS) and (special_timer >= max_special_timer)
{
	special_timer = 0;
	attack_script = RegaliareSpecial;
	state_script = PlayerStateAttack;
}

//Roll State
if (key_ability) and (roll_energy >= 50)
{
	audio_sound_gain(snd_player_roll,global.volumeEffects,1);
	audio_play_sound(snd_player_roll,0,false);
	roll_energy = roll_energy - 50;
	state_script = PlayerStateRoll;
	remain_dist = roll_dist;
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

}
//
//
//
//
//
//Halofire Slash State
function HalofireSlash(){

attacking = true;
damage = might + (11 * obj_inventory.form_grid[# 0, 5]);
//weapon_sprite = spr_weapon_fayaniBlade;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 28;
}


//Attack Start
if (sprite_index != spr_player_halofire_slash)
{
	//Start Animation From Beginning
	//var _atkSpeed = round(15 * (1 + (obj_inventory.form_grid[# 0, 5]/10)));
	sprite_index = spr_player_halofire_slash;
	sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}


//Calcuate Hit Entitites
AttackCalculate(spr_halofireSlash_hitbox);

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
//Halofire Magic State
function HalofireMagic(){

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
	sprite_index = spr_player_halofire_runCast;
}
else sprite_index = spr_player_halofire_cast;
if (_oldSprite != sprite_index) local_frame = 0;

//Create Bullet at end timer - timer is length of weapon sprite animation
if (timer2 <= 0)
{	
	magic_count = magic_count - 1;
	with (instance_create_layer(obj_player.x,obj_player.y-10,"Instances",obj_projectile))
	{
		audio_sound_gain(snd_slash01,global.volumeEffects,1);
		audio_play_sound(snd_slash01,0,0);
		break_object = obj_player.break_object;
		magic = true;
		follow_timer = 28;
		damage = round(obj_player.magic/4) + (5 + (obj_inventory.form_grid[# 0, 7]-1)*(5));//
		projectile_sprite = spr_meteor;
		projectile_script = BlackfireMeteor;
		idle_sprite = spr_meteor;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
		speed = 4.0;
	}
	timer2 = 10;
}

//Animate
PlayerAnimation();

if (animation_end)
{
	if (mouse_check_button(mb_right) = false) or (magic_count < 1)
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
//Halofire Meteor Projectile Script
function HalofireMeteor(){
//Step
if (follow_timer > 0) follow_timer = follow_timer - 1;
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
if (place_meeting(x,y,break_object)) 
{
	instance_destroy();
}

if (magic = true)
{
	if (place_meeting(x,y,obj_cursor))
	{
		follow_timer = 0;
	}
	if (follow_timer > 0)
	{
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
	}
}
}
//
//
//
//
//
//Halofire Special State
function HalofireSpecial(){
attacking = true;
//weapon_sprite = spr_weapon_fayaniBlade_goldArc;
if (timer2 > 0) timer2 = timer2 - 1;
if (atk_snd_delay > 0) atk_snd_delay = atk_snd_delay -1;
if (atk_snd_delay <= 0)
{
	audio_sound_gain(snd_slash01,global.volumeEffects,1);
	audio_play_sound(snd_slash01,0,0)
	atk_snd_delay = 20;
}


//Attack Start
if (sprite_index != spr_player_halofire_cast)
{
	//Start Animation From Beginning
	sprite_index = spr_player_halofire_cast;
	//sprite_set_speed(sprite_index,15,spritespeed_framespersecond);
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}

//if (timer2 <= 0)
//{	
	
//}

//Calcuate Hit Entitites
//AttackCalculate(spr_fayaniBlade_goldArc_hitbox);

//Animate
PlayerAnimation();

if (animation_end)
{
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		timer1 = 120;
		timer1 = 30;
		break_object = obj_player.break_object;
		damage = obj_player.magic + (6 * (obj_inventory.form_grid[# 0, 8] - 1));
		idle_sprite = spr_goldArc;
		projectile_script = BlackfireGoldArcs;
		hit_by_attack = -1;
		//script_execute(LeafArcCreate);
		direction = (floor(other.direction/90))*90;
		image_angle = direction;
		//speed = 2.5;
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
//Halofire Gold Arcs Projectile Script
function HalofireGoldArcs(){
//Step
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
x = obj_player.x;
y = obj_player.y - 6;
if (sprite_index != spr_goldArc)
{
	//Start Animation From Beginning
	timer1 = 120;
	//timer2 = 6
	sprite_index = spr_goldArc;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{	
	AttackCalculateKnockback(spr_goldArc,obj_player,12);
}
//if (place_meeting(x,y,break_object)) 
//{
//	speed = 0;
//}
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
//Draw Halofire's Sword Upgrade at Smith NPC's
function DrawHalofireSlashUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Halofire's Blade",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 5])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,5,10))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 5] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 5, 10);
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
		draw_text_transformed(112,99,"10",.35,.35,0);
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
						obj_inventory.form_grid[# 3, 5] = 3;
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
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 5]) + ": " + string(obj_player.might + (11 * obj_inventory.form_grid[# 3, 5])) + " > Level " + string(obj_inventory.form_grid[# 3, 5] + 1) + ": " + string(obj_player.might + (11 * (obj_inventory.form_grid[# 3, 5] + 1)));
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//damage = obj_player.might + (11 * obj_inventory.form_grid[# 0, 5])

}
//
//
//
//
//
//Draw Halofire's Armor Upgrade at Smith NPC's
function DrawHalofireArmorUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Halofire's Armor",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 6])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,7,10)) and (ItemCheckQuantity(obj_inventory,5,10))
				{
					if (ItemCheckQuantity(obj_inventory,6,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 6] = 2;
						ItemRemove(obj_inventory, 7, 10);
						ItemRemove(obj_inventory, 5, 10);
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
		draw_text_transformed(112,99,"10",.35,.35,0);
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
						obj_inventory.form_grid[# 3, 6] = 3;
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
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 6]) + ": " + string(6 + (12 * (obj_inventory.form_grid[# 3, 6] -1))) + " > Level " + string(obj_inventory.form_grid[# 3, 6] + 1) + ": " + string(6 + (12 * (obj_inventory.form_grid[# 3, 6])));
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);
//obj_player.armor = 6 + (12 * (obj_inventory.form_grid[# 0, 6] -1))
}
//
//
//
//
//
//Draw Halofire's Magic Upgrade at Browi NPC
function DrawHalofireMagicUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Halofire's Magic",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 7])
{
	case 1:
		//draw large weapon sprite
		draw_sprite_stretched(spr_menu,1,95,61,14,54);
		if point_in_rectangle(_mouseX,_mouseY,94,61,110,115)
		{
			draw_sprite_stretched(spr_highlight_nineslice,1,96,61,12,54)
			if (mouse_check_button_pressed(mb_left))
			{
				if (ItemCheckQuantity(obj_inventory,1,10)) and (ItemCheckQuantity(obj_inventory,2,10))
				{
					if (ItemCheckQuantity(obj_inventory,9,1))
					{
						audio_sound_gain(snd_text02,global.volumeMenu,1);
						audio_play_sound(snd_text02,0,false);
						obj_inventory.form_grid[# 3, 7] = 2;
						ItemRemove(obj_inventory, 1, 10);
						ItemRemove(obj_inventory, 2, 10);
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
		draw_text_transformed(112,99,"10",.35,.35,0);
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
						obj_inventory.form_grid[# 3, 7] = 3;
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
var _damage = round(obj_player.magic/4) + (5 + (obj_inventory.form_grid[# 3, 7]-1)*(5));
var _damage1 = round(obj_player.magic/4) + (5 + (obj_inventory.form_grid[# 3, 7])*(5));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 7]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 3, 7] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}
//
//
//
//
//
//Draw Halofire Special Upgrade at Browi NPC
function DrawHalofireSpecialUpgrade(){
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);	
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_sprite_stretched(spr_menu,3,71,41,64,13);
draw_sprite_stretched(spr_menu,3,137,41,96,13);
draw_text_transformed(74,48,"Halofire's Special",.5,.5,0);
draw_set_halign(fa_center);


switch (obj_inventory.form_grid[# 3, 8])
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
						obj_inventory.form_grid[# 3, 8] = 2;
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
						obj_inventory.form_grid[# 3, 8] = 3;
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
var _damage = obj_player.magic + (6 * (obj_inventory.form_grid[# 3, 8] - 1));
var _damage1 = obj_player.magic + (6 * (obj_inventory.form_grid[# 3, 8]));
var _armorExplain = "Level " + string(obj_inventory.form_grid[# 3, 8]) + ": " + string(_damage) + " > Level " + string(obj_inventory.form_grid[# 3, 8] + 1) + ": " + string(_damage1);
draw_text_transformed(141,44,_armorExplain,.5,.5,0);
draw_set_halign(fa_center);

}

