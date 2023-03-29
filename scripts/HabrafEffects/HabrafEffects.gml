//Effects for Habraf Lake Lair
//
//
//
//
//
//Effect Yakflower Door Create
function EffectHabrafLakeDoorCreate(){
	frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_door_habraf;
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
//Effect Habraf Lake Door - Escort 1
function EffectHabrafLakeDoorA(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.habraf_lair[1] < 2)
{
	sprite_index = spr_door_habraf;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,512,136,4))
		{
			sprite_index = spr_door_habraf_open;
			image_speed = 0;
			obj_inventory.habraf_lair[1] = 2;
		}
		else 
		{
			sprite_index = spr_door_habraf;
			image_speed = 0;
			obj_inventory.habraf_lair[1] = 1;
		}
	}
}
if (obj_inventory.habraf_lair[1] >= 2)
{
	sprite_index = spr_door_habraf_open;
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
	sprite_index = spr_door_habraf;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,224,208,4))
		{
			sprite_index = spr_door_habraf_open;
			image_speed = 1;
			obj_inventory.habraf_lair[2] = 2;
		}
		else 
		{
			sprite_index = spr_door_habraf;
			image_speed = 0;
			obj_inventory.habraf_lair[2] = 1;
		}
	}
}
else 
{
	sprite_index = spr_door_habraf_open;
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
	sprite_index = spr_door_habraf;
	if (instance_exists(obj_escort))
	{
		if (point_in_circle(obj_escort.x,obj_escort.y,160,72,4))
		{
			sprite_index = spr_door_habraf_open;
			image_speed = 1;
			obj_inventory.habraf_lair[3] = 2;
		}
		else 
		{
			sprite_index = spr_door_habraf;
			image_speed = 0;
			obj_inventory.habraf_lair[3] = 1;
		}
	}
}
else 
{
	sprite_index = spr_door_habraf_open;
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

if (obj_inventory.habraf_lair[4] < 2)
{
	sprite_index = spr_door_habraf;

}
else 
{
	sprite_index = spr_door_habraf_open;
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