//Create Entity Parent
//This is a massive parent object that includes
	//enemies, resources, NPCs, and collision
//Collision objects break from all parent events and inherits none of them
	//As there are tons of these in room at once, minimize code
//Enemies break from draw and create, but stil inherit those events
//NPCs break from draw end and create, but still inherit those events
//Resources break from draw and does not inherit that event
//
//
//
//
//
//Animation
z = 0;
flash = 0;
uni_flash = shader_get_uniform(sh_flash_white,"flash");
special_draw = -1;

//Init
//hp = 1;
//max_hp = 1;

//Status
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

