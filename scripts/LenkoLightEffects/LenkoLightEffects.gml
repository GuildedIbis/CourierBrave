//Lenko Light Effects
//
//
//
//
//
//Effect Vostle Town Lantern Create
function scr_effect_vostleTown_lantern_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_lantern;
}
//
//
//
//
//
//Effect Vostle Town Lantern Step
function scr_effect_vostleTown_lantern(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_lantern;
}
}
//
//
//
//
//
//Effect Beaowire Fortress Torch Create
function scr_effect_beaowire_light_torch_create(){
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
//Effect Beaowire Fortress Torch
function scr_effect_beaowire_light_torch(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_torchWall_beaowire;
}
}
//
//
//
//
//
//Effect Fireplace Create
function scr_effect_fireplace_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_fireplace;

}
//
//
//
//
//
//Effect Fireplace
function scr_effect_fireplace(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_fireplace;

}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_campfire_farwayRoad_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_campFire_rat;

}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_campfire_farwayRoad(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_campFire_rat;

}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_vostleTown_bonfire_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_bonfire;
with (instance_create_layer(x-16,y-8,"Wall",obj_wall))
{
	image_xscale = 4;
	image_yscale = 2;
	game_paused_image_speed = image_speed;
}
}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_vostleTown_bonfire(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_bonfire;
}
}
//
//
//
//
//
//Effect Rat Campfire Create
function scr_effect_vostleTown_floorTorch_create(){
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_floorTorch;
with (instance_create_layer(x-2,y-1,"Wall",obj_wall))
{
	image_xscale = .5;
	image_yscale = 1;
	game_paused_image_speed = image_speed;
}
}
//
//
//
//
//
//Effect Rat Campfire
function scr_effect_vostleTown_floorTorch(){
if (obj_game.gamePaused = false)
{
image_speed = 1;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_light_town_floorTorch;
}
}
//
//
//
//
//
//Effect Farway Road House Window Create
function scr_effect_vostleTown_window_house_create(){ 
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_farwayRoad_house;
}
//
//
//
//
//
//Effect Farway Road House Window
function scr_effect_vostleTown_window_house(){
if (obj_game.gamePaused = false)
{
image_speed = 0;
depth = -y;
image_xscale = 1;
image_yscale = 1;
sprite_index = spr_effect_window_farwayRoad_house;
if (global.dayPhase = 2) image_index = 0;
else image_index = 1;
}
}