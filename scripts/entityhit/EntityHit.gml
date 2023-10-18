//Entity Hit Scripts
//
//
//
//
//
//Enemy Hit
//Set on the Enemy Object in the hit_script variable definition
function scr_entity_hit_damage(){
var _sndChance = irandom_range(0,1)

if (invincible = false)
{
	aggro_drop = 300;
	if (targeted = false) 
	{
		targeted = true;
		global.aggroCounter = global.aggroCounter + 1;
		if (boss = true) global.bossCounter = global.bossCounter + 1;
	}
	flash = .35;
	hp = hp - other.damage;
	audio_sound_gain(snd_enemy_hit_all,global.volumeEffects,1);
	audio_play_sound(snd_enemy_hit_all,10,false)
	if (_sndChance = 1) and (dmg_snd_delay <= 0)
	{
		audio_sound_gain(damaged_snd,global.volumeEffects,1);
		audio_play_sound(damaged_snd,10,false)
		dmg_snd_delay = 15;
	}
}
if (invincible = true)
{
	audio_sound_gain(snd_hit_invincible,global.volumeEffects,1);
	audio_play_sound(snd_hit_invincible,10,false)
}
}
//
//
//
//
//
//Entity Hit NPC
function scr_entity_hit(){
flash = .35;
}
//
//
//
//
//
//Entity Hit Resource
function scr_entity_hit_resource(){
audio_sound_gain(snd_resourcePlant,global.volumeEffects,1);
audio_play_sound(snd_resourcePlant,0,false);
with (instance_create_layer(x,y,"Instances",obj_item))
{
	item_id = other.resource_id;
	amount = 1;
	sprite_index = spr_resource_dropped_all;
	image_index = item_id;
	direction = irandom_range(0,360);
	image_angle = irandom_range(0,360);
	spd = .75 + (.3) + random(0.1);
}
instance_destroy();
}
//
//
//
//
//
//Entity Hit Destroy
function scr_entity_hit_destroy(){
instance_destroy();
}
//
//
//
//
//
//Entity Hit Quest
function scr_entity_hit_quest(){
var _questNum = activate_args;
flash = .35;
obj_inventory.quest_grid[# _questNum, 0] = true;
obj_inventory.quest_grid[# _questNum, 1] = obj_inventory.quest_grid[# _questNum, 1] + 1;
if (obj_inventory.quest_grid[# _questNum, 1] >= obj_inventory.quest_grid[# _questNum, 2])
{
	obj_inventory.quest_grid[# _questNum, 3] = true;
}
if (destructible = true)
{
	instance_destroy();
}
}
//
//
//
//
//
//Entity Depth Calculate
function scr_entity_depth_calculate(_hitbox){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_entity,_hitByAttack,false);
if (_hits > 0)
{
	for (var i = 0; i < _hits; i = i + 1)
	{
		//If not yet hit, hit it
		var _hitID = _hitByAttack[| i];
		if (ds_list_find_index(hit_by_attack, _hitID) == -1)
		{
			ds_list_add(hit_by_attack,_hitID);
			with (_hitID)
			{
				//image_blend = c_red;
				if (hit_script != -1) and (bullet = false)
				{
					if (invincible = false) script_execute(hit_script);
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}