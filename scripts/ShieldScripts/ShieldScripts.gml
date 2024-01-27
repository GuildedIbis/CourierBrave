//Shields
//
//
//
//
//
//Shield Collision
function scr_shield_enemy_calculate(_hitbox,_hitBy){
//Collision with Entities
mask_index = _hitbox;

var _hitByAttack = ds_list_create();
var _hits = instance_place_list(x,y,obj_projectile,_hitByAttack,false);
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
				if (destructable = true)
				{
					instance_destroy();
				}
			}
		}
		
	}
}
	
ds_list_destroy(_hitByAttack);
mask_index = enemy_idle;
}