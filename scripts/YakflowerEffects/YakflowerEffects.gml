//Effect: Yakflower Path Lair
//
//
//
//
//
//Effect Yakflower Path Totem Create
function EffectYakflowerTotemCreate(){
image_speed = 0;
sprite_index = spr_effect_yakflower_totem;
timer1 = 0;
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
function EffectYakflowerTotem1(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflower_lair[2] < 1)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) obj_inventory.yakflower_lair[2] = 1;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;
	}
	else sprite_index = spr_effect_yakflower_totem;
}
else
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
//Effect Yakflower Totem 2
function EffectYakflowerTotem2(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflower_lair[2] = 1)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) obj_inventory.yakflower_lair[2] = 2;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;

	}
	else sprite_index = spr_effect_yakflower_totem;

}
if (obj_inventory.yakflower_lair[2] >= 2)
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
//Effect Yakflower Totem 3
function EffectYakflowerTotem3(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;

if (obj_inventory.yakflower_lair[2] = 2)
{
	image_index = floor((timer1/900) * 5)
	if (timer1 >= 900) obj_inventory.yakflower_lair[2] = 3;
	if (point_in_circle(obj_player.x,obj_player.y,x,y,48))
	{
		timer1 = timer1 + 1;
		sprite_index = spr_effect_yakflower_totemActive;

	}
	else sprite_index = spr_effect_yakflower_totem;

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

