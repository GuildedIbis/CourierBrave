//Step

//Update Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_activate = keyboard_check_pressed(ord("E"));
key_ability = keyboard_check_pressed(vk_space);
key_attackM = mouse_check_button_pressed(mb_left);
key_attackW = mouse_check_button_pressed(mb_right);
key_attackS = keyboard_check(vk_shift);


//Movement Setup
input_dir = point_direction(0,0,key_right - key_left, key_down - key_up);
input_mag = (key_right - key_left != 0) or (key_down - key_up != 0);
flash = max(flash-0.05,0);

//State
if (obj_game.gamePaused = false)
{
	script_execute(state_script);
	depth = -y;
}

//Death
if (hp <= 0)
{
	state_script = PlayerDeath;
}

//Status Effects
StatusEffects();
