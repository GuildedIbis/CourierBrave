//Farway Road Effects
//
//
//
//
//
//Effect Lekno Lake Path Rat Tent Create
function EffectRatCampfireCreate(){
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
//Effect Statue Moth
function EffectRatCampfireStep(){
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
//Effect Lekno AbandonedHouse Rear Create
function EffectLenkoAbandonedHouseRearCreate(){
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
function EffectLenkoAbandonedHouseFrontCreate(){
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
//Effect Statue Moth Create [Farway Road 7]
function EffectStatueMothCreate(){
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
function EffectStatueMoth(){
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

}

//
//
//
//
//
//Effect Ceriver Quest Door
function EffectCeriverQuestDoor(){
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
function EffectWellCreate(){
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
function EffectWell(){
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

