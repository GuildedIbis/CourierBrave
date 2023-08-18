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
//Attack Calculate Status
function AttackCalculateMagic(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc,_charge){
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
				if (passable = false)
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
							with (obj_player)
							{
								yellow_special = yellow_special + _charge;
								if (yellow_special > max_charge) yellow_special = max_charge;
								blue_special = blue_special + _charge;
								if (blue_special > max_charge) blue_special = max_charge;
								purple_special = purple_special + _charge;
								if (purple_special > max_charge) purple_special = max_charge;
								red_special = red_special + _charge;
								if (red_special > max_charge) red_special = max_charge;
								green_special = green_special + _charge;
								if (green_special > max_charge) green_special = max_charge;
								orange_special = orange_special + _charge;
								if (orange_special > max_charge) orange_special = max_charge;
							}
						
							with (other) 
							{
								if (destructable = true) instance_destroy();
							}
						
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
//Attack Calculate Status
function AttackCalculateWeapon(_hitbox,_hitBy,_kbDur,_azDur,_txDur,_vsDur,_wvDur,_drainPerc,_charge){
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
						if (form_type != -1)
						{
							with (instance_create_layer(x,y,"Instances",obj_itemCharge))
							{
								drop_amount = 10;
								sprite_index = spr_charge_drop;
								image_index = other.form_type;
								image_speed = 0;
								direction = irandom_range(0,360);
								image_angle = direction;
								spd = .75 + (.3) + random(0.1);
							}
							with (instance_create_layer(x,y,"Instances",obj_itemCharge))
							{
								drop_amount = 10;
								sprite_index = spr_charge_drop;
								image_index = irandom_range(0,5);
								image_speed = 0;
								direction = irandom_range(0,360);
								image_angle = direction;
								spd = .75 + (.3) + random(0.1);
							}
						}
					}
					with (obj_player)
					{
						yellow_special = yellow_special + _charge;
						if (yellow_special > max_charge) yellow_special = max_charge;
						blue_special = blue_special + _charge;
						if (blue_special > max_charge) blue_special = max_charge;
						purple_special = purple_special + _charge;
						if (purple_special > max_charge) purple_special = max_charge;
						red_special = red_special + _charge;
						if (red_special > max_charge) red_special = max_charge;
						green_special = green_special + _charge;
						if (green_special > max_charge) green_special = max_charge;
						orange_special = orange_special + _charge;
						if (orange_special > max_charge) orange_special = max_charge;
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
//Attack Calculate Basic
function AttackCalculateProjectile(_hitbox){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_enemy_projectile,_hitByAttack,false);
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
				instance_destroy();
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
