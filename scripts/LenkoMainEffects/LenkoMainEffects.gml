//World Effects
//
//
//
//
//
//Effect Lekno Lake Path Well Create
function EffectLenkoAbandonedHouseCreate(){
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
with (instance_create_layer(x-39,y,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 8;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x+23,y,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 8;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x-33,y+54,"Wall",obj_wall))
{
	image_xscale = 3.5;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
with (instance_create_layer(x+7,y+54,"Wall",obj_wall))
{
	image_xscale = 3.5;
	image_yscale = 2.5;
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
	with (instance_create_layer(x-39,y,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 6;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+23,y,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = 6;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-33,y+54,"Wall",break_object))
	{
		image_xscale = 3.5;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x+7,y+54,"Wall",break_object))
	{
		image_xscale = 3.5;
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
//Effect Well Step
function EffectLenkoAbandonedHouse(){
frag = false
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
}
//
//
//
//
//
//Effect Well Step
function EffectWell(){
frag = false
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
		image_yscale = 2;
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
sx1 = x - 6;
sy1 = y - 30;
sx2 = x + 32;
sy2 = y - 30;
sx3 = x + 16;
sy3 = y + 8;
sx4 = x - 16;
sy4 = y + 8;


event_inherited();
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