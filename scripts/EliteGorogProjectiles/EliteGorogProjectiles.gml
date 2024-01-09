//Elite Gorog Projectiles
//
//
//
//
//
//Elite Gorog Knife Create
function scr_projectile_gorogElite_knife_create(){
//Scripts
home_state = scr_projectile_gorogElite_knife_free;
entity_step = home_state;
entity_drop = Idle;

//Assets
enemy_move = spr_enemy_gorogKnife;
enemy_idle = spr_enemy_gorogKnife;

//Stats
enemy_spd = 3.5;
damage = 35;//+ (10 * enemy_lvl);

//Animation and Status
invincible = false;
inv_dur_timer = 0;
aggro_drop = 300;
healthbar = false;
bullet = true;
local_frame = 0;
hit_by_attack = -1;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Elite Gorog Knife Free
function scr_projectile_gorogElite_knife_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Collision
	scr_enemy_attack_calculate_projectile(sprite_index,self,-1,-1,-1,-1,-1,-1);
	if (place_meeting(x,y,break_object)) 
	{
		instance_destroy();
	}
}
else
{
	speed = 0;
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Create
function scr_projectile_gorogElite_chainHook_create(){
//Scripts
home_state = scr_projectile_gorogElite_chainHook_free;
entity_step = home_state;
entity_drop = Idle;
special_draw = scr_projectile_gorogElite_chainHook_chain;
hit_script = scr_entity_hit_destroy;

//Assets
enemy_move = spr_enemy_gorogE_chainHook;
enemy_idle = spr_enemy_gorogE_chainHook;

//Stats
damage = 50;
enemy_spd = 2.5;

//Animation and Status
invincible = true;
contacted = false;
inv_dur_timer = 0;
aggro_drop = 300;
healthbar = false;
bullet = true;
timer1 = 30;
local_frame = 0;
hit_by_attack = -1;
returning = false;
enemy_spd = 4.5;
fragment_count = 3;
fragment = obj_fragMetal;
bullet = true;

if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
ds_list_clear(hit_by_attack);
}
//
//
//
//
//
//Elite Gorog Chain Hook Free
function scr_projectile_gorogElite_chainHook_free(){
if (obj_game.gamePaused = false)
{
	//Resume
	sprite_index = enemy_move;
	speed = enemy_spd;
	
	//Timer
	timer1 = timer1 - 1;
	
	//Doesn't break on player
	invincible = true;
	inv_dur_timer = 60;
	
	//Collision
	if (contacted = true)
	{
		with (parent)
		{
			var _chaseDir = point_direction(x,y,other.x,other.y);
			var xx = lengthdir_x(3,_chaseDir);
			var yy = lengthdir_y(3,_chaseDir);
			x = x + xx;
			y = y + yy;
		}
		with (obj_player)
		{
			knockback_dur = 1;
			knockback_dir = -1;
		}
	}
	if (place_meeting(x,y,obj_player))
	{
		audio_sound_gain(snd_enemy_gorogKnife_hit,global.volumeEffects,1);
		audio_play_sound(snd_enemy_gorogKnife_hit,0,false);
		if (contacted = false)
		{
			with (obj_player)
			{
				if (invincible = false)
				{
					if (dmg_snd_delay <= 0)
					{
						dmg_snd_delay = 15;
						audio_sound_gain(dmg_snd,global.volumeEffects,1);
						audio_play_sound(dmg_snd,0,false);
					}
					flash = .35;
					hp = hp - (other.damage - armor);
			
				}
			}
		}
		contacted = true;
		speed = 0;
	}
	if (place_meeting(x,y,break_object)) 
	{

		direction = point_direction(x,y,parent.x,parent.y);
		returning = true;
	}
	if (timer1 <= 0)
	{
		direction = point_direction(x,y,parent.x,parent.y);
		returning = true;
	}
	if (point_in_circle(parent.x,parent.y,x,y,16))  //(point_in_circle(parent.x,parent.y,x,y,16))
	{
		if (contacted = true)
		{
			with (parent) 
			{
				if (point_in_circle(obj_player.x,obj_player.y,x,y,16))
				{
					entity_step = scr_enemy_gorogElite_heavySlashA;
				}
				else
				{
					timer2 = 360;
					entity_step = scr_enemy_gorogElite_free;
				}
			}
			instance_destroy();
		}
		if (returning = true)
		{
			with (parent) 
			{
				timer2 = 360;
				entity_step = scr_enemy_gorogElite_free;
			}
			instance_destroy();
		}
	}

}
else
{
	speed = 0;
}
}
//
//
//
//
//
//Elite Gorog Chain Hook Chain
function scr_projectile_gorogElite_chainHook_chain(){
	draw_sprite_ext(spr_enemy_gorogE_chainHook_chain,0,x,y,round(point_distance(x,y,parent.x,parent.y)/7),1,image_angle,c_white,1.0);

}



