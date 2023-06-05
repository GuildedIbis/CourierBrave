//Create


//Initialize Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_activate = keyboard_check_pressed(ord("E"));
key_ability = keyboard_check_pressed(vk_space);
key_attackM = mouse_check_button_pressed(mb_left);
key_attackW = mouse_check_button_pressed(mb_right);
key_attackS = keyboard_check_pressed(vk_shift);
weapon_aim = false;

//Animation
iAlpha = 1.0;
image_speed = 0;
local_frame = 0;
dir_offX = 0;
dir_offY = 0;
ldX = 0;
ldY = 0;
flash = 0;
uni_flash = shader_get_uniform(sh_flash_white,"flash")
z = 0;

//Sound
walk_snd = snd_walk_regular;
walk_snd_delay = 0;
atk_snd_delay = 0;
dmg_snd = snd_player_hit;
dmg_snd_delay = 0;


//Scripts
state_script = Idle;
free_script = Idle;
attack_script = Idle;
tracking_quest = Idle;
attacking = false;
hit_by_attack = -1;
hor_spd = 0;
ver_spd = 0;
damage = 0;

//Standard Timers
stamina_timer = 0;
charge_timer = 0;
magic_timer = 0;
melee_timer = 0;
weapon_timer = 0;
special_timer = 0;

//Enhancable Stats
vitality = 20; //added to health
//energy = 20; //max_roll_timer = 180 - stamina
might = 20; //added to weapon damage
grace = 20; //the base to weapon damage
max_crull_stone = 1;
crull_level = 1;
armor = 0; //negates damage in enemy damage calc

//Other Stats 
beans = 0;
max_hp = 150;
walk_spd = 1.75;
roll_spd = 3;
roll_dist = 64;
charge = 50 + (3* (grace + round(grace/15)));
max_charge = 50 + (3* (grace + round(grace/15)));
stamina = 50 + (3* (might + round(might/15)));
max_stamina = 50 + (3* (might + round(might/15)));
special = 1000;
max_special = 1000;
max_hp = 150 + (3* (vitality + round(vitality/15)));
hp = max_hp;
crull_stone = max_crull_stone;

//Color Specific Charge
max_yellow_charge = 50 + (3* (grace + round(grace/15)));
max_blue_charge = 50 + (3* (grace + round(grace/15)));
max_purple_charge = 50 + (3* (grace + round(grace/15)));
max_red_charge = 50 + (3* (grace + round(grace/15)));
max_green_charge = 50 + (3* (grace + round(grace/15)));
max_orange_charge = 50 + (3* (grace + round(grace/15)));
yellow_charge = 50 + (3* (grace + round(grace/15)));
blue_charge = 50 + (3* (grace + round(grace/15)));
purple_charge = 50 + (3* (grace + round(grace/15)));
red_charge = 50 + (3* (grace + round(grace/15)));
green_charge = 50 + (3* (grace + round(grace/15)));
orange_charge = 50 + (3* (grace + round(grace/15)));


//Status
status_animate_timer = 0;
status_animate_index = 0;
scene = false;
dead = false;
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
invincible = false;
inv_dur_timer = 0;
cursed = false
cursed_dur_timer = 0;
level = 1;
break_object = obj_break;
//
//
//
//Form Script (Default Regaliare)
script_execute(RegaliareSet);
