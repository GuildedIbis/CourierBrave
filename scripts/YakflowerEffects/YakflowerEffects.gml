//Effect: Yakflower Path Lair
//
//
//
//
//
//Effect Statue Moth Create
function scr_effect_yakflowerPath_statueMoth_create(){
image_speed = 0;
sprite_index = spr_statue_moth;
//Create Collision
with (instance_create_layer(x-16,y-8,"Wall",obj_wall))
{
	image_xscale = 4;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-16,y-8,"Break",break_object))
	{
		image_xscale = 4;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = true;
shadow_size = 4;
//sx1 = x - 6;
//sy1 = y - 30;
//sx2 = x + 32;
//sy2 = y - 30;
//sx3 = x + 16;
//sy3 = y + 8;
//sx4 = x - 16;
//sy4 = y + 8;


//event_inherited();
}

//
//
//
//
//
//Effect Statue Moth
function scr_effect_yakflowerPath_statueMoth(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
image_index = obj_inventory.yakflowerPath_map_ary[5][3];
sprite_index = spr_statue_moth;
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

}//
//
//
//
//
//Effect Yakflower Path Totem Create
function scr_effect_yakflowerPath_totem_create(){
image_speed = 0;
sprite_index = spr_effect_yakflower_totem;
timer1 = 0;
active = false;
if (obj_inventory.yakflowerPath_map_ary[14][3] < 2)
{
	obj_inventory.yakflowerPath_map_ary[14][3] = 0;
}
with (instance_create_layer(x-4,y-14,"Wall",obj_wall))
{
	image_xscale = 1;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-4,y-14,"Break",break_object))
	{
		image_xscale = 1;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
}
}
//
//
//
//
//
//Effect Yakflower Totem 1
function scr_effect_yakflowerPath_totem1(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflowerPath_map_ary[14][3] < 1)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) 
	{
		obj_inventory.yakflowerPath_map_ary[14][3] = 1;
	}
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		active = true;
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;
	}
	else
	{
		active = false;
		sprite_index = spr_effect_yakflower_totem;
	}
}
else
{
	active = false;
	image_index = 5;
	sprite_index = spr_effect_yakflower_totemActive;
}
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
//
//
//
//
//
//Effect Yakflower Totem 2
function scr_effect_yakflowerPath_totem2(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflowerPath_map_ary[14][3] = 1)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) 
	{
		obj_inventory.yakflowerPath_map_ary[14][3] = 2;
	}
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		active = true;
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;
	}
	else
	{
		active = false;
		sprite_index = spr_effect_yakflower_totem;
	}
}
else
{
	if (obj_inventory.yakflowerPath_map_ary[14][3] = 2)
	{
		active = false;
		image_index = 5;
		sprite_index = spr_effect_yakflower_totemActive;
	}
	else
	{
		active = false;
		image_index = 0;
		sprite_index = spr_effect_yakflower_totem
	}
}
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
//
//
//
//
//
//Effect Yakflower Totem 3
function scr_effect_yakflowerPath_totem3(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflower_lair[2] = 2)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) 
	{
		obj_inventory.yakflowerPath_map_ary[19][3] = 1;
		obj_inventory.yakflowerPath_map_ary[5][3] = obj_inventory.yakflowerPath_map_ary[5][3] + 1;
	}
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		active = true;
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;

	}
	else 
	{
		active = false;
		sprite_index = spr_effect_yakflower_totem;
	}

}
if (obj_inventory.yakflower_lair[2] >= 3)
{
	image_index = 5;
	sprite_index = spr_effect_yakflower_totemActive;
}
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
//
//
//
//
//
//Effect Farway Road Stone Door Create
function scr_effect_door_yakflowerPath_stone_create(){
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
function scr_effect_door_yakflowerPath_stone(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflowerPath_map_ary[10][3] < 1)
{
	sprite_index = spr_door_yakflowerPath_stone;
}
if (obj_inventory.yakflowerPath_map_ary[10][3] >= 1)
{
	sprite_index = spr_door_yakflowerPath_stone_open;
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
//
//Effect Farway Road Stone Door 
function scr_effect_door_yakflowerPath_stone2(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflowerPath_map_ary[14][3] < 2)
{
	sprite_index = spr_door_yakflowerPath_stone2;
}
if (obj_inventory.yakflowerPath_map_ary[14][3] >= 2)
{
	sprite_index = spr_door_yakflowerPath_stone2_open;
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
//Effect Zerwerk's Tent (Create)
function scr_effect_yakflowerPath_tentZerwerk_create(){
image_speed = 0;
sprite_index = spr_effect_tent_zerwerk;
//Create Collision
with (instance_create_layer(x-24,y-24,"Wall",obj_wall))
{
	image_xscale = 6;
	image_yscale = 4;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-24,y-24,"Break",break_object))
	{
		image_xscale = 6;
		image_yscale = 3;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = false;
shadow_size = 4;
//sx1 = x - 6;
//sy1 = y - 30;
//sx2 = x + 32;
//sy2 = y - 30;
//sx3 = x + 16;
//sy3 = y + 8;
//sx4 = x - 16;
//sy4 = y + 8;


//event_inherited();
}
//
//
//
//
//
//Effect Zerwerk's Tent (Step)
function scr_effect_yakflowerPath_tentZerwerk(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_tent_zerwerk;
}