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
scale_x = 1;
scale_y = 1;
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
hit_target = -1;
hit = false;
distX = -1;
distY = -1;
enemy_in_range = -1;
target = -1;
hor_spd = 0;
ver_spd = 0;
damage = 0;
projectile_spread = 0;
projectile_spread_timer = 0;
walk_spd = 1.5;
roll_spd = 3;
roll_dist = 64;

//Standard Timers
stamina_timer = 0;
charge_timer = 0;
magic_timer = 0;
melee_timer = 0;
weapon_timer = 0;
special_timer = 0;
damaged_timer = 0;
overshield_timer = 0;
max_magic_timer = 0;


//Enhancable Stats
vitality = 0; //HTH 
conviction = 0; //CRG
energy = 0; //RLL
max_hp = 200 + (25 * vitality);
max_stamina = 200 + (25 * energy);
max_charge = 200 + (25 * conviction);

//Set Player Current Stats
hp = max_hp
stamina = max_stamina;
armor = 0;
overshield = 0;

//Color Specific Crystal
selected_primary = -1;
yellow_primary = max_charge;
orange_primary  = max_charge;
purple_primary  = max_charge;
blue_primary  = max_charge;
green_primary = max_charge;
red_primary  = max_charge;
yellow_special = max_charge;
orange_special = max_charge;
purple_special = max_charge;
blue_special = max_charge;
green_special = max_charge;
red_special = max_charge;



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
slow = false;
slow_dur_timer = 0;
heal = false;
heal_dur_timer = 0;
invincible = false;
inv_dur_timer = 0;
shielded = false;
cursed = false
cursed_dur_timer = 0;
//level = 1;
break_object = obj_break;
//
//
//
//Form Script (Default Regaliare)
scr_player_regaliare_set();
