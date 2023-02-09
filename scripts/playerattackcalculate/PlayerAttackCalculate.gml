//Attack Calculations
//
//
//
//
//
//Attack Calculate Basic
function AttackCalculate(_hitbox){
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
					script_execute(hit_script); //if (invincible = false)?
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}
//
//
//
//
//
//Attack Calculate Status
function AttackCalculateStatus(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc){
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
					script_execute(hit_script); 
					if (invincible = false) and (npc = false)
					{
						if (_azDur != -1) ablaze_dur_timer = _azDur;
						if (_txDur != -1) thundux_dur_timer = _txDur;
						if (_vsDur != -1) voidsick_dur_timer = _vsDur;
						if (_wvDur != -1) watervice_dur_timer = _wvDur;
						if (_drainPerc != -1) obj_player.hp = min(obj_player.max_hp,obj_player.hp + round(other.damage * _drainPerc));
						if (boss = false) and (_kbDur != -1) 
						{
							knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
							knockback_dur = _kbDur
						}
					}
				}
			}
		}
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}
//
//
//
//
//
//Attack Calculate
function AttackCalculateDrain(_hitbox,_perc){
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
					if (invincible = false)
					{
						script_execute(hit_script);
						obj_player.hp = obj_player.hp + round(other.damage * _perc);
					}
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}
//
//
//
//
//
//Attack Calculate Knockback
function AttackCalculateKnockback(_hitbox,_hitBy,duration){
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
		if (ds_list_find_index(hit_by_attack, _hitID) == -1) //If not already on the list, prevents multihitting
		{
			ds_list_add(hit_by_attack,_hitID); //Add it to list
			with (_hitID)
			{
				//image_blend = c_red;
				if (hit_script != -1) and (npc = false)
				{
					if (invincible = false) 
					{
						script_execute(hit_script); 
					}
					if (boss = false)
					{
						knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
						knockback_dur = duration
					}
				}
				
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}
//
//
//
//
//
//Attack Calculate and Proc Ablaze Status
function AttackCalculateAblaze(_hitbox,_duration,_hitBy,_kbdur){
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
					if (invincible = false)
					{
						script_execute(hit_script);
						ablaze_dur_timer = (_duration * 60)
					}
					if (boss = false)
					{
						knockback_dir = point_direction(x,y,_hitBy.x,_hitBy.y) + 180;
						knockback_dur = _kbdur
					}
				}
				
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = idle_sprite;
}
