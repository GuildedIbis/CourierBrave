//Entity Hit Scripts
//
//
//
//
//
//Enemy Hit
//Set on the Enemy Object in the hit_script variable definition
function EntityHitEnemy(){
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
function EntityHitNPC(){
flash = .35;
}
//
//
//
//
//
//Entity Hit Resource
function EntityHitResource(_beans,_item1ID,_item2ID,_chance){
	
var _objects = 2;
var _dropBean = irandom_range(1,_beans);
var _drop = irandom_range(0,99)		
var _angle = random(360);

//Audio
if (resource_sound != 0) 
{
	audio_sound_gain(resource_sound,global.volumeEffects,1);
	audio_play_sound(resource_sound,0,false);
}

with (instance_create_layer(x,y,"Instances",obj_itemBean))
{
	drop_amount = _dropBean;
	sprite_index = spr_bean;
	direction = _angle/_objects;	
	spd = .75 + (.3) + random(0.1);
}
if (_drop < _chance) //First Item (Common Drop)
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = _item1ID;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
}
if (_drop >= _chance) //Second Item (Rare Drop)
{
	with (instance_create_layer(x,y,"Instances",obj_item))
	{
		item_id = _item2ID;
		amount = 1;
		sprite_index = spr_item_all;
		image_index = item_id;
		direction = _angle/_objects * 1;
		spd = .75 + (.3) + random(0.1);
	}
}

instance_destroy();
}
//
//
//
//
//
//Entity Hit Destroy
function EntityHitDestroy(){
instance_destroy();
}
//
//
//
//
//
//Entity Depth Calculate
function EntityDepthCalculate(_hitbox){
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