//
//
//
//
//
//Chest 000 Text: 100B, 1 Inventory Pouch
function Chest000Text(){
//Lenko, Lake Path 8, North of Bridge
activate_args = 0;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n200 Beans\n1x Yellow Rog Stone"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{
	obj_inventory.beans = obj_inventory.beans + 200;
	obj_inventory.rog_array[0] = obj_inventory.rog_array[0] + 1;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}//
//
//
//
//
//Chest 001 Text: 100B, Farway Road Map
function Chest001Text(){
//Lenko: Farway Road 4, Northeast Corner
activate_args = 1;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nFarway Road Map"
	obj_inventory.map_grid[# 0, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,10,1) = true)
	{
		obj_player.beans = obj_player.beans + 100;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}

//
//
//
//
//
//Chest 002 Text: 300B, 1 Inventory Pouch
function Chest002Text(){
//Lenko, Lake Path 3, northwest corner
activate_args = 2;
draw_set_font(xfnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n300 Beans\n1x Inventory Pouch"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{
	obj_player.beans = obj_player.beans + 300;
	obj_inventory.item_grid[# obj_inventory.item_slots, 3] = true;
	obj_inventory.item_slots = obj_inventory.item_slots + 1;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 003 Text: 200B, 1x Amber Rog Stone
function Chest003Text(){
//Lenko, Farway Road 6, northeast corner
activate_args = 3;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	if (InventorySpace(obj_inventory,17) = true) text_string = "CHEST OPENED:\n200 Beans\n1x Amber Rog Stone"
	else text_string = "INVENTORY FULL"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,17,1) = true)
	{
		obj_player.beans = obj_player.beans + 200;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 004 Text: 200B, 1x Royal Rog Stone
function Chest004Text(){
//Lenko, Lake Path 2, northeast corner
activate_args = 4;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	if (InventorySpace(obj_inventory,16) = true) text_string = "CHEST OPENED:\n200 Beans\n1x Royal Rog Stone"
	else text_string = "INVENTORY FULL"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,16,1) = true)
	{
		obj_player.beans = obj_player.beans + 200;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 005 Text: 300B, 1x Raw Silver
function Chest005Text(){
//Lenko, Farway Road 7, northeast corner
activate_args = 5;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	if (InventorySpace(obj_inventory,6) = true) text_string = "CHEST OPENED:\n300 Beans\n1x Raw Silver"
	else text_string = "INVENTORY FULL"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,6,1) = true)
	{
		obj_player.beans = obj_player.beans + 300;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 006 Text: 500B, 1x Tarby Pearl
function Chest006Text(){
//Lenko Greyrock 2, Southeast Corner
activate_args = 6;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	if (InventorySpace(obj_inventory,9) = true) text_string = "CHEST OPENED:\n500 Beans\n1x Tarby Pearl"
	else text_string = "INVENTORY FULL"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,9,1) = true)
	{
		obj_player.beans = obj_player.beans + 500;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 007 Text: 500B, 1x Inventory Pouch
function Chest007Text(){
//Lenko, Greyrock 1
activate_args = 7;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\n1x Inventory Pouch"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.item_grid[# obj_inventory.item_slots, 3] = true;
	obj_inventory.item_slots = obj_inventory.item_slots + 1;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 008 Text: 500B, 1x Inventory Pouch
function Chest008Text(){
//Lenko Greyrock 4, Northeast Corner
activate_args = 8;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\n1x Inventory Pouch"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.item_grid[# obj_inventory.item_slots, 3] = true;
	obj_inventory.item_slots = obj_inventory.item_slots + 1;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 009 Text: 500B, 1x Gold Bits
function Chest009Text(){
//Lenko: Lake Path 5, Central next to tree
activate_args = 9;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	if (InventorySpace(obj_inventory,3) = true) text_string = "CHEST OPENED:\n500 Beans\n1x Golt Bits"
	else text_string = "INVENTORY FULL"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	if (ItemsAdd(obj_inventory,3,1) = true)
	{
		obj_player.beans = obj_player.beans + 500;
		obj_inventory.chest_list[activate_args] = true;
	}
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 010 Text: 500B, 1x Inventory Pouch
function Chest010Text(){
//Lenko, Lake Path Cemetery, Moon Chest in Cemetery
activate_args = 10;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\n1x Inventory Pouch"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.item_grid[# obj_inventory.item_slots, 3] = true;
	obj_inventory.item_slots = obj_inventory.item_slots + 1;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//with (instance_create_layer(319,73,"Instances",obj_enemy))
	//{
	//	script_execute(RemphoGhostCreate);
	//	timer1 = 300;
	//}
	//with (instance_create_layer(319,112,"Instances",obj_enemy))
	//{
	//	script_execute(RemphoGhost2Create);
	//}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 011 Text: 500B, Undecided
function Chest011Text(){
//Lenko: Lake Path 7, after Endire Knight Tnaks
activate_args = 11;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nUndecided Second Reward\nPotentially Increase Crull Healing"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 012 Text: 500B, Lake Path Map
function Chest012Text(){
//Lenko: Lake Path 7
activate_args = 12;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nLake Path Map"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.map_grid[# 1, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 013 Text: 500B, Greyrock Map
function Chest013Text(){
//Lenko: Greyrock 9
activate_args = 13;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nGreyrock Map"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.map_grid[# 2, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 014 Text: 500B, Habraf Lake Map
function Chest014Text(){
//Lenko: Habraf Lake 5 (Unplaced)
activate_args = 14;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nHabraf Lake Map"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.map_grid[# 3, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 015 Text: 500B, Yakflower Path Map
function Chest015Text(){
//Lenko: Yakflower Path 4
activate_args = 15;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nYakflower Path Map"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.map_grid[# 4, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 016 Text: 500B, Beaowire Fortress Map
function Chest016Text(){
//Lenko: Beaowire 12
activate_args = 16;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n500 Beans\nBeaowire Fortress Map"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 500;
	obj_inventory.map_grid[# 5, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 017 Text: 600B, Beaowire Fortress Other
function Chest017Text(){
//Lenko: Yakflower Path 4
activate_args = 17;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n2000 Beans"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 2000;
	//obj_inventory.map_grid[# 4, 1] = true;
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}
//
//
//
//
//
//Chest 017 Text: 600B, Beaowire Fortress Boss Chest
function Chest018Text(){
//Lenko: Yakflower Path 4
activate_args = 18;
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite_stretched(menu_sprite,3,64,136,192,48);
draw_set_color(c_white);
//draw_sprite(spr_dialoguePort_all,speaker,447,391);
if (obj_game.gamePaused)
{
	with (all)
	{
		game_paused_image_speed = image_speed;
		image_speed = 0;
	}
}
//Draw Based on String Counter
var _SubString

if (string_counter = 0)
{
	speaker = 1;
	text_string = "CHEST OPENED:\n1000 Beans\nForm Special Attacks Unlocked"
	_SubString = string_copy(text_string,1,letter_counter);
	draw_text_transformed(68,28,"Press E to Continue",.5,.5,0);
}
if (string_counter >= 1)
{

	obj_player.beans = obj_player.beans + 1000;
	with (obj_inventory)
	{
		for (var i = 0; i < 16; i = i + 1)
		{
			form_grid[# i, 8] = 1;
		}
	}
	obj_inventory.chest_list[activate_args] = true;
	text_string = ""
	string_counter = 0;
	_SubString = string_copy(text_string,1,letter_counter);
	obj_game.gamePaused = false;
	obj_game.textPaused = false;
	with (all)
	{
		image_speed = game_paused_image_speed;
	}
	//Reset Buy/Sell Menu
	page = 0;
	slot = -1;
	item_id = -1;
	item_name = -1;
	sell_price = 0;
	buy_price = 0;
}
draw_set_font(xfnt_text);
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black);
draw_text_transformed(69,140,_SubString,.5,.5,0);
draw_set_color(c_white);
draw_text_transformed(68,140,_SubString,.5,.5,0);
}