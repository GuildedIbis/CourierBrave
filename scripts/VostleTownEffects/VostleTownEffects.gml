//Vostle Town Effects
//
//
//
//
//
//Effect Vostle Town Lake Path Well Create
function scr_effect_vostleTown_well_create(){
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
function scr_effect_vostleTown_well(){
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