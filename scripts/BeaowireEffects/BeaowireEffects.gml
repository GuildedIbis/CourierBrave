//Beaowire Effects
//
//
//
//
//
//Effect Beaowire Escort Create
function EffectBeaowireEscortCreate(){
_destX = 0;
_destY = 0;
dir_switch = 1;
escort_sprite = spr_escort_beaowire;
sprite_index = escort_sprite;
escort_spd = .5;
escort_rad = 32;
path = -1;
shadow_sprite = -1;
shadow = false;
}
//
//
//
//
//
//Effect Regaliare Quest Door Create
function EffectBeaowireDoorCreate(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
if (obj_inventory.beaowire_dungeon[13] < 2) image_index = 0;
else iamge_index = 1;

}
//
//
//
//
//
//Effect Regaliare Quest Door Create
function EffectBeaowireDoorSpikeCreate(){
frag = false
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
if (obj_inventory.beaowire_dungeon[13] < 2)
{
	image_index = 0;
	with (instance_create_layer(x-16,y-16,"Wall",obj_wall))
	{
		image_xscale = 4;
		image_yscale = 2;
		game_paused_image_speed = image_speed;
	}
	with (instance_create_layer(x-16,y-16,"Wall",obj_break))
	{
		image_xscale = 4;
		image_yscale = 1;
		game_paused_image_speed = image_speed;
	}
}
else image_index = 1;

}
//
//
//
//
//
//Effect Fortress Mausoleum
function EffectFortressMausoleumCreate(){
image_speed = 0;
sprite_index = spr_fortress_mausoleum;
//Create Collision
with (instance_create_layer(x-24,y-56,"Wall",obj_wall))
{
	image_xscale = 6;
	image_yscale = 8;
	game_paused_image_speed = image_speed;
}
if (break_object != -1)
{
	with (instance_create_layer(x-24,y-56,"Break",break_object))
	{
		image_xscale = 6;
		image_yscale = 7;
		game_paused_image_speed = image_speed;
	}
}

//Set Shadow
shadow = true;
sx1 = x - 20;
sy1 = y - 56;
sx2 = x + 28;
sy2 = y - 56;
sx3 = x + 24;
sy3 = y + 8;
sx4 = x - 24;
sy4 = y + 8;


//event_inherited();
}
//
//
//
//
//
//Effect Fortress Mausoleum
function EffectFortressMausoleum(){
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_fortress_mausoleum;
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
function EffectTorchBeaowireCreate(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;
}
	//
//
//
//
//
//Effect Statue Moth
function EffectTorchBeaowire(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;

}