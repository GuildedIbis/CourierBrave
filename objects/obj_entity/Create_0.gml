//Create Entity Parent	
//
//
//
//
//
//Animation and Movement
z = 0;
flash = 0;
uni_flash = shader_get_uniform(sh_flash_white,"flash");
special_draw = -1;
shadow_sprite = -1;
lit = false;
light_size = (sprite_width + 4);
shadow = false;
shadow_size = 0;
drop_amount = -1;
form_type = -1;
hor_spd = 0;
ver_spd = 0;
home_x = x;
home_y = y;
//
//
//
//
//
//Basic Timers
timer1 = 0;
timer2 = 0;
timer3 = 0;
timer4 = 0;
timer5 = 0;
timer6 = 0;
timer7 = 0;
timer8 = 0;
timer9 = 0;
timerC = 0;
timerS = 0;
timerW = 0;
//
//
//
//
//
//Status
status_animate_timer = 0;
status_animate_index = 0;
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
home_state = -1;
invincible = false;
inv_dur_timer = 0;
cursed = false;
cursed_dur_timer = 0;
passable = false;
interact = -1;
interact_timer = 0;
interact_index = 0;
