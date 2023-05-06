//Lake Path Effects
//
//
//
//
//
//Effect Lekno Lake Path Well Create
function EffectWellCreate(){
image_speed = 0;
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
sx1 = x + 2;
sy1 = y - 24;
sx2 = x + 18;
sy2 = y - 24;
sx3 = x + 8;
sy3 = y + 3;
sx4 = x - 8;
sy4 = y + 3;
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
sprite_index = spr_well;
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
//Effect Statue Lily Create [Lake Path 5]
function EffectStatueLiliesCreate(){
image_speed = 0;
sprite_index = spr_statue_lily;

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
sx1 = x - 5;
sy1 = y - 16;
sx2 = x + 32;
sy2 = y - 16;
sx3 = x + 16;
sy3 = y + 7;
sx4 = x - 15;
sy4 = y + 7;


//event_inherited();
}
//
//
//
//
//
//Effect Statue Moth
function EffectStatueLilies(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_statue_lily;
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
//Effect Habraf Lake Door - Escort 1
function EffectAdavioQuestDoor(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_player.form != 2)
{
	sprite_index = spr_door_questAdavio;

}
if (obj_player.form = 2)
{
	sprite_index = spr_door_questAdavio_open;
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


