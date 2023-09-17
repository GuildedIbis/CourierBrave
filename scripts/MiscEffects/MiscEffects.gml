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
//Effect Lekno Lake Path Rat Tent Create
function scr_effect_light_window_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_empty;
}
//
//
//
//
//
//Effect Statue Moth
function scr_effect_light_window(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_empty;

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
//if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-8,y-11,x+8,y))
//{
//	with (instance_create_layer(x-8,y-12,"Wall",obj_wall))
//	{
//		image_xscale = 2;
//		image_yscale = 1.5;
//		game_paused_image_speed = image_speed;
//	}
//	with (instance_create_layer(x-8,y-12,"Wall",break_object))
//	{
//		image_xscale = 2;
//		image_yscale = .5;
//		game_paused_image_speed = image_speed;
//	}
//}

//Shadow
//shadow = true;
//sx1 = x - 5;
//sy1 = y - 14;
//sx2 = x + 11;
//sy2 = y - 14;
//sx3 = x + 7;
//sy3 = y;
//sx4 = x - 7;
//sy4 = y;
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