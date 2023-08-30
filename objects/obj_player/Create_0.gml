//Create
gameplay_timer = 60;
time_played = 0;

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


//Scripts and Movement
state_script = Idle;
free_script = Idle;
attack_script = Idle;
scene_script = -1;
tracking_quest = Idle;
attacking = false;
hit_by_attack = -1;
hor_spd = 0;
ver_spd = 0;
damage = 0;
walk_spd = 1.75;
roll_spd = 3;
roll_dist = 64;

//Standard Timers
stamina_timer = 0;
charge_timer = 0;
magic_timer = 0;
melee_timer = 0;
weapon_timer = 0;
special_timer = 0;

//Enhancable Stats
vitality = 0; //HTH 
iteration = 0; //CRL
conviction = 0; //CRG
might = 0; //WPN
grace = 0; //CST
divinity = 0; //SPC
energy = 0; //RLL
receptivity = 0; //AMT

//Effected Max Stats
max_crull_stone = 1 + (iteration);
crull_ary = array_create(11,-1);
crull_ary[0] = 0;
crull_selected = 0;
max_hp = 200 + (20 * vitality);
max_charge = 100 + (10 * conviction); //50 + (3* (grace + round(grace/15)));
max_stamina = 100 + (50 * energy);

//Set Player Current Stats
hp = max_hp
crull_stone = max_crull_stone;
stamina = max_stamina;
armor = 0; //negates damage in enemy damage calc
//Color Specific Crystal
selected_crystal = -1;
yellow_crystal = max_charge;
blue_crystal = max_charge;
purple_crystal = max_charge;
red_crystal = max_charge;
green_crystal = max_charge;
orange_crystal = max_charge;
//Color Specific Special
selected_special = -1;
yellow_special = max_charge;
blue_special = max_charge;
purple_special = max_charge;
red_special = max_charge;
green_special = max_charge;
orange_special = max_charge;



//Status
status_animate_timer = 0;
status_animate_index = 0;
shadow = true;
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
