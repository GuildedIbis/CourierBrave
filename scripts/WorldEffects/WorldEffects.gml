//World Effects
//
//
//
//
//
//Effect Lenko Trees Create
function EffectLenkoTreeCreate(){
image_index = irandom_range(0,1);
image_speed = 0;
with (instance_create_layer(x-8,y-19,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 3;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-8,y-19,"Break",break_object))
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
//Effect Lenko Trees
function EffectLenkoTree(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_tree_lenko;
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
//Effect Nisma Smithy Furnace
function EffectSmithyFurnace(){
frag = false;
sprite_index = spr_furnaceFire;
image_speed = 1;
image_xscale = 1;
image_yscale = 1;
}
//
//
//
//
//
//Effect Habraf Lake Door - Escort 1
function EffectHabrafLakeDoorA(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habraf_lair[1] < 2)
{
	sprite_index = spr_door_habrafEscort;
	if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
	{
		with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
		{
			image_xscale = 6;
			image_yscale = 2;
			game_paused_image_speed = image_speed;
		}
	}
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,512,136,4))
		{
			sprite_index = spr_door_habrafEscort_open;
			image_speed = 1;
			obj_inventory.habraf_lair[1] = 2;
		}
		else 
		{
			sprite_index = spr_door_habrafEscort;
			image_speed = 0;
			obj_inventory.habraf_lair[1] = 1;
		}
	}
}
else 
{
	sprite_index = spr_door_habrafEscort_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 512;
			y = 136;
		}
	}
}

}
//
//
//
//
//
//Effect Habraf Lake Door - Escort 2
function EffectHabrafLakeDoorB(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habraf_lair[2] < 2)
{
	sprite_index = spr_door_habrafEscort;
	if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
	{
		with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
		{
			image_xscale = 6;
			image_yscale = 2;
			game_paused_image_speed = image_speed;
		}
	}
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,224,208,4))
		{
			sprite_index = spr_door_habrafEscort_open;
			image_speed = 1;
			obj_inventory.habraf_lair[2] = 2;
		}
		else 
		{
			sprite_index = spr_door_habrafEscort;
			image_speed = 0;
			obj_inventory.habraf_lair[2] = 1;
		}
	}
}
else 
{
	sprite_index = spr_door_habrafEscort_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 224;
			y = 208;
		}
	}
}

}
//
//
//
//
//
//Effect Habraf Lake Door - Escort 3
function EffectHabrafLakeDoorC(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habraf_lair[3] < 2)
{
	sprite_index = spr_door_habrafEscort;
	if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
	{
		with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
		{
			image_xscale = 6;
			image_yscale = 2;
			game_paused_image_speed = image_speed;
		}
	}
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,160,72,4))
		{
			sprite_index = spr_door_habrafEscort_open;
			image_speed = 1;
			obj_inventory.habraf_lair[3] = 2;
		}
		else 
		{
			sprite_index = spr_door_habrafEscort;
			image_speed = 0;
			obj_inventory.habraf_lair[3] = 1;
		}
	}
}
else 
{
	sprite_index = spr_door_habrafEscort_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 160;
			y = 72;
		}
	}
}
}
//
//
//
//
//
//Effect Habraf Lake Door - Escort 3
function EffectHabrafLakeDoorD(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habraf_lair[4] < 1)
{
	sprite_index = spr_door_habrafEscort;
	if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-16,y-18,x+16,y))
	{
		with (instance_create_layer(x-24,y-16,"Wall",obj_wall))
		{
			image_xscale = 6;
			image_yscale = 2;
			game_paused_image_speed = image_speed;
		}
	}

}
else 
{
	sprite_index = spr_door_habrafEscort_open;
	with (obj_wall)
	{
		if (place_meeting(x,y,other))
		{
			instance_destroy(self);
		}
	}
	if (instance_exists(obj_escort))
	{
		with (obj_escort)
		{
			x = 160;
			y = 72;
		}
	}
}
}

