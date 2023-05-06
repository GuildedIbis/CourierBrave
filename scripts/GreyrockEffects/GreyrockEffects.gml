//Greyrock Effects
//
//
//
//
//
//Effect Lekno Lake Path Rat Tent Create
function EffectRatTentCreate(){
image_speed = 0;
with (instance_create_layer(x-20,y-16,"Wall",obj_wall))
{
	image_xscale = 5;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-20,y-16,"Break",break_object))
	{
		image_xscale = 5;
		image_yscale = 1.25;
		game_paused_image_speed = image_speed;
	}
}
//Set Shadow
shadow = true;
sx1 = x - 6;
sy1 = y - 30;
sx2 = x + 32;
sy2 = y - 30;
sx3 = x + 16;
sy3 = y + 8;
sx4 = x - 16;
sy4 = y + 8;
}
//
//
//
//
//
//Effect Rat Tent L Step
function EffectRatTentL(){

image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_rat_tentL;
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
//Effect Rat Tent R Step
function EffectRatTentR(){

image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_rat_tentR;
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
function EffectRegaliareQuestDoor(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_player.form != 0)
{
	sprite_index = spr_door_questRegaliare;

}
if (obj_player.form = 0)
{
	sprite_index = spr_door_questRegaliare_open;
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



