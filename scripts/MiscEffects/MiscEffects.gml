//Misc Effects
//
///
//
//
//
//Effect Curse Create
function EffectCurseCreate(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_curse;
if (!point_in_rectangle(obj_wall.x,obj_wall.y,x-8,y-11,x+8,y))
{
	with (instance_create_layer(x-8,y-12,"Wall",obj_wall))
	{
		image_xscale = 2;
		image_yscale = 1.5;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-8,y-12,"Wall",break_object))
	{
		image_xscale = 2;
		image_yscale = .5;
		game_paused_image_speed = image_speed;
	}
}

//Shadow
shadow = true;
sx1 = x - 5;
sy1 = y - 14;
sx2 = x + 11;
sy2 = y - 14;
sx3 = x + 7;
sy3 = y;
sx4 = x - 7;
sy4 = y;
}
//
//
//
//
//
//Effect Curse Step
function EffectCurseStep(){
if (object_exists(obj_player))
{
	obj_player.cursed = true;
	obj_player.cursed_dur_timer = 30;
}
}