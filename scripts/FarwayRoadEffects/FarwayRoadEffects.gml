//Farway Road Effects
//
//
//
//
//
//Effect Farway Road Stone Door Create
function scr_effect_door_farwayRoad_stone_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
{
	with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
	{
		image_xscale = 6;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",break_object))
	{
		image_xscale = 6;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-16,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-16,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-16,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}
	
}
//
//
//
//
//
//
//Effect Farway Road Stone Door 
function scr_effect_door_farwayRoad_stone(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.farwayRoad_map_ary[15][3] < 1)
{
	sprite_index = spr_door_farwayRoad_stone;
}
if (obj_inventory.farwayRoad_map_ary[15][3] >= 1)
{
	sprite_index = spr_door_farwayRoad_stone_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
}
}
//
//
//
//
//
//Effect Farway Road Cemetery Door Create
function scr_effect_door_farwayRoad_cemetery_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
{
	with (instance_create_layer(x-24,y-24,"Wall",obj_wall))
	{
		image_xscale = 6;
		image_yscale = 4;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-24,"Wall",break_object))
	{
		image_xscale = 6;
		image_yscale = 3;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-24,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 4;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-24,y-24,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 3;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-24,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 4;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+8,y-24,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 3;
		game_paused_image_speed = image_speed;
	}
}
	
}
//
//
//
//
//
//
//Effect Farway Road Cemetery Door Create
function scr_effect_door_farwayRoad_cemetery(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.farwayRoad_map_ary[10][3] < 1)
{
	sprite_index = spr_door_farwayRoad_cemetery;
}
if (obj_inventory.farwayRoad_map_ary[10][3] >= 1)
{
	sprite_index = spr_door_farwayRoad_cemetery_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
}
}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_campfire_farwayRoad_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_campFire_rat;

}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_campfire_farwayRoad(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_campFire_rat;

}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_farwayRoad_bonfire_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_bonfire;
with (instance_create_layer(x-16,y-8,"Wall",obj_wall))
{
	image_xscale = 4;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_farwayRoad_bonfire(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_bonfire;
}
}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_farwayRoad_floorTorch_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_floorTorch;
with (instance_create_layer(x-2,y-1,"Wall",obj_wall))
{
	image_xscale = .5;
	image_yscale = 1;
	game_paused_image_speed = image_speed;
}
}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_farwayRoad_floorTorch(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_floorTorch;
}
}
//
//
//
//
//
//Effect Farway Road House Window Create
function scr_effect_farwayRoad_window_house_create(){ 
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_farwayRoad_house;
}
//
//
//
//
//
//Effect Farway Road House Window
function scr_effect_farwayRoad_window_house(){
if (obj_game.gamePaused = false)
{
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_farwayRoad_house;
if (global.dayPhase = 2) image_index = 0;
else image_index = 1;
}
}
//
//
//
//
//
//Effect Lekno AbandonedHouse Rear Create
function scr_effect_farwayRoad_abandonedHouse_rear_create(){
sprite_index = spr_house_abandonedBack;
image_speed = 0;
with (instance_create_layer(x-33,y-16,"Wall",obj_wall))
{
	image_xscale = 5;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x+21,y-16,"Wall",obj_wall))
{
	image_xscale = 1.5;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-33,y-16,"Wall",break_object))
	{
		image_xscale = 5;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+21,y-16,"Wall",break_object))
	{
		image_xscale = 1.5;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = true;
shadow_sprite = spr_house_abandoned;
sx1 = x - 36;
sy1 = y - 34;
sx2 = x + 46;
sy2 = y - 34;
sx3 = x + 46;
sy3 = y + 71;
sx4 = x - 36;
sy4 = y + 71;
}
//
//
//
//
//
//Effect Lekno AbandonedHouse Front Create
function scr_effect_farwayRoad_abandonedHouse_front_create(){
sprite_index = spr_house_abandonedFront;
image_speed = 0;
with (instance_create_layer(x-31,y-16,"Wall",obj_wall))
{
	image_xscale = 3.5;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x+9,y-16,"Wall",obj_wall))
{
	image_xscale = 3.5;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x-39,y-90,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 10;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x+25,y-90,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 10;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	
	with (instance_create_layer(x - 31,y - 16,"Wall",break_object))
	{
		image_xscale = 3.5;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x + 9,y - 16,"Wall",break_object))
	{
		image_xscale = 3.5;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x - 39,y - 90,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 8;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x + 25,y - 90,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 8;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = false;
//shadow_sprite = spr_house_abandoned;
//sx1 = x - 29;
//sy1 = y - 90;
//sx2 = x + 49;
//sy2 = y - 90;
//sx3 = x + 39;
//sy3 = y + 5;
//sx4 = x - 39;
//sy4 = y + 5;
}
//
//
//
//
//
//Effect Ceriver Quest Door
function scr_effect_door_farway(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_player.form != 1)
{
	sprite_index = spr_door_questCeriver;

}
if (obj_player.form = 1)
{
	sprite_index = spr_door_questCeriver_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	with (break_object)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	
}

}
//
//
//
//
//
//Effect Lekno Lake Path Well Create
function scr_effect_farwayRoad_well_create(){
image_speed = 0;
sprite_index = spr_well;
with (instance_create_layer(x-8,y-12,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-8,y-12,"Break",break_object))
	{
		image_xscale = 2;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
}

//Shadow
shadow = true;
shadow_size = 2;
//sx1 = x + 2;
//sy1 = y - 24;
//sx2 = x + 18;
//sy2 = y - 24;
//sx3 = x + 8;
//sy3 = y + 3;
//sx4 = x - 8;
//sy4 = y + 3;
}
//
//
//
//
//
//Effect Well Step
function scr_effect_farwayRoad_well(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (place_meeting(x,y,obj_player))
{
	if (depth < obj_player.depth)
	{
		if (image_alpha > .5) image_alpha = image_alpha - .05
	}
	else
	{
		if (image_alpha < 1) image_alpha = image_alpha + .05;
	}
}
else 
{
	if (image_alpha < 1) image_alpha = image_alpha + .05;
}
depth = -y;
}

