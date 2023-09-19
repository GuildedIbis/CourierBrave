//Lenko Solid Effects
//
//
//
//
//
//Effect Lenko Trees Create
function scr_effect_lenko_trees_create(){
image_index = irandom_range(0,6);
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

//Shadow
shadow = true;
//sx1 = x - 6;
//sy1 = y - 30;
//sx2 = x + 32;
//sy2 = y - 30;
//sx3 = x + 16;
//sy3 = y + 8;
//sx4 = x - 16;
//sy4 = y + 8;
sx1 = x - (sprite_width/2) + 12;
sy1 = y - 24;
sx2 = x + (sprite_width/2) + 12;
sy2 = y - 24
sx3 = x + (sprite_width/2);
sy3 = y + 3;
sx4 = x - (sprite_width/2);
sy4 = y + 3;
}
//
//
//
//
//
//Effect Lenko Trees
function scr_effect_lenko_trees(){
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
function scr_effect_furnace(){
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
//Effect Molen Trees Create
function scr_effect_molen_tree_create(){
image_index = variant;
image_speed = 0;
with (instance_create_layer(x-8,y-15,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-8,y-15,"Break",break_object))
	{
		image_xscale = 2;
		image_yscale = 1.5;
		game_paused_image_speed = image_speed;
	}
}

//Shadow
shadow = true;
shadow_size = 3;
//sx1 = x - 6;
//sy1 = y - 30;
//sx2 = x + 32;
//sy2 = y - 30;
//sx3 = x + 16;
//sy3 = y + 8;
//sx4 = x - 16;
//sy4 = y + 8;
sx1 = x - (sprite_width/2) + 12;
sy1 = y - 24;
sx2 = x + (sprite_width/2) + 12;
sy2 = y - 24
sx3 = x + (sprite_width/2);
sy3 = y + 3;
sx4 = x - (sprite_width/2);
sy4 = y + 3;
}
//
//
//
//
//
//Effect Molen Trees Step
function scr_effect_molen_tree(){
frag = false
image_speed = 0;
image_index = variant;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_tree_molen;
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
//Effect Lakebirch Trees Create
function scr_effect_lakebirch_tree_create(){
image_index = variant;
image_speed = 0;
with (instance_create_layer(x-8,y-15,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-8,y-15,"Break",break_object))
	{
		image_xscale = 2;
		image_yscale = 1.5;
		game_paused_image_speed = image_speed;
	}
}

//Shadow
shadow = true;
shadow_size = 2;
//sx1 = x - 6;
//sy1 = y - 30;
//sx2 = x + 32;
//sy2 = y - 30;
//sx3 = x + 16;
//sy3 = y + 8;
//sx4 = x - 16;
//sy4 = y + 8;
sx1 = x - 6;
sy1 = y - 24;
sx2 = x + 24;
sy2 = y - 24
sx3 = x + 12;
sy3 = y + 3;
sx4 = x - 10;
sy4 = y + 3;
}
//
//
//
//
//
//Effect Lakebirch Trees
function scr_effect_lakebirch_tree(){
frag = false
image_speed = 0;
image_index = variant;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_tree_lakebirch;
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
//Effect Jelx Trees Create
function scr_effect_jelx_tree_create(){
image_index = variant;
image_speed = 0;
with (instance_create_layer(x-8,y-15,"Wall",obj_wall))
{
	image_xscale = 2;
	image_yscale = 2.5;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-8,y-15,"Break",break_object))
	{
		image_xscale = 2;
		image_yscale = 1.5;
		game_paused_image_speed = image_speed;
	}
}

//Shadow
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
sx1 = x - (sprite_width/2) + 12;
sy1 = y - 24;
sx2 = x + (sprite_width/2) + 12;
sy2 = y - 24
sx3 = x + (sprite_width/2);
sy3 = y + 3;
sx4 = x - (sprite_width/2);
sy4 = y + 3;
}
//
//
//
//
//
//Effect Jelx Trees Step
function scr_effect_jelx_tree(){
frag = false
image_speed = 0;
image_index = variant;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_tree_jelx;
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