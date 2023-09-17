//Player Projectiles
//
//
//
//
//
//Standard Projectile
function scr_projectile_standard(){
//Step
if (follow_timer > 0) follow_timer = follow_timer - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	scr_player_attack_calculate_projectile(projectile_sprite);
	instance_destroy();
}
if (place_meeting(x,y,break_object)) 
{
	instance_destroy();
}

if (magic = true)
{
	if (place_meeting(x,y,obj_cursor))
	{
		follow_timer = 0;
	}
	if (follow_timer > 0)
	{
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
	}
}
}
//
//
//
//
//
//Projectile Collision Normal
function scr_projectile_collision_normal(x, y, obj, radius, spacing){
var nx = 0;
var ny = 0;
if (collision_circle(x, y, radius, obj, true, true) != noone) 
{
    for (var j=spacing; j<=radius; j+=spacing) 
	{
        for (var i=0; i<radius; i+=spacing) 
		{
            if (point_distance(0, 0, i, j) <= radius) 
			{
                if (collision_point(x+i, y+j, obj, true, true) == noone) { nx += i; ny += j; }
                if (collision_point(x+j, y-i, obj, true, true) == noone) { nx += j; ny -= i; }
                if (collision_point(x-i, y-j, obj, true, true) == noone) { nx -= i; ny -= j; }
                if (collision_point(x-j, y+i, obj, true, true) == noone) { nx -= j; ny += i; }
            }
        }
    }
    if (nx == 0 && ny == 0) return (-1);
    return point_direction(0, 0, nx, ny);
}
return (-1);
}//
//
//
//
//
//Gold Arc Projectile
function xPlayerProjectileGoldArc(){
//Step
if (timer1 > 0) timer1 = timer1 - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{
	
	AttackCalculate(projectile_sprite);
	//instance_destroy();
}
if (place_meeting(x,y,break_object))
{
	instance_destroy();
}
if (timer1 <= 0)
{
	if (place_meeting(x,y,obj_player)) 
	{
		instance_destroy();
	}
	if (mouse_check_button_pressed(mb_left))
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		image_angle = direction;
	}
}
if (magic = true)
{
	if (place_meeting(x,y,obj_cursor))
	{
		follow_timer = 0;
	}
	if (follow_timer > 0)
	{
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y+6);
		image_angle = direction;
	}
}
}
//
//
//
//
//Spin Flame
function xscr_projectile_player_spinflame(){
//Step
if (timer1  > 0) timer1 = timer1  - 1;
if (timer2  > 0) timer2 = timer2  - 1;
if (sprite_index != projectile_sprite)
{
	//Start Animation From Beginning
	timer1 = 96
	timer2 = 6
	sprite_index = projectile_sprite;
	local_frame = 0;
	image_index = 0;
	//Clear Hit List
	if (!ds_exists(hit_by_attack,ds_type_list)) hit_by_attack = ds_list_create();
	ds_list_clear(hit_by_attack);
}
if (place_meeting(x,y,obj_enemy)) 
{	
	AttackCalculate(projectile_sprite);
}
if (place_meeting(x,y,break_object)) 
{
	speed = 0;
}
if (timer2 <= 0)
{
	with (instance_create_layer(x,y-6,"Instances",obj_projectile))
	{
		break_object = obj_player.break_object;
		damage = round(obj_player.magic * 1.5);
		projectile_sprite = spr_fireSpark;
		hit_by_attack = -1;
		direction = irandom_range(0,359);
		image_angle = direction;
		speed = 3;
	}
	timer2 = 6;
}
if (timer1 <= 0)
{
	instance_destroy();
}
}
	