//Misc Effects
//
//
//
//
//
//Standard Effect Step Event
function scr_effect_standard_step(){
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
//Effect Regaliare Quest Door Create
function scr_effect_door_create(){
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
//Effect Lekno Lake Path Rat Tent Create
function scr_effect_light_window_blank_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_blank;
}
//
//
//
//
//
//Effect Statue Moth
function scr_effect_light_window_blank(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_blank;

}
//
///
//
//
//
//Effect Curse Create
function scr_effect_curse_create(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_curse;

}
//
//
//
//
//
//Curse Stone Step
function scr_effect_curse(){
if (object_exists(obj_player))
{
	obj_player.cursed = true;
	obj_player.cursed_dur_timer = 30;
}
}
	//
//
//
//
//
//Effect Lekno Lake Path Rat Tent Create
function scr_effect_house_chimneySmoke_create(){
depth = -4700;
image_speed = 1;
image_xscale = 1;
image_yscale = 1;
image_index = irandom_range(0,image_number-1);
sprite_index = spr_house_chimneySmoke;
}
	//
//
//
//
//
//Effect Statue Moth
function scr_effect_house_chimneySmoke(){
if (obj_game.gamePaused = false)
{
depth = -4700;
image_speed = 1;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_house_chimneySmoke;
}
}