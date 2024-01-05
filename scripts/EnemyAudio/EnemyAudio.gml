//Enemy Audio
//
//
//
//
//
//Create Enemy Sounds
function scr_audio_enemy_create(){
sound_enemy_array = array_create(62,-1)
sound_enemy_array[0] = snd_enemy_acolyte_antichrome;
sound_enemy_array[1] = snd_enemy_acolyte_ilanilCharge;
sound_enemy_array[2] = snd_enemy_acolyte_ilanilFire;
sound_enemy_array[3] = snd_enemy_acolyte_nilchrome;
sound_enemy_array[4] = snd_enemy_cultist_damaged;
sound_enemy_array[5] = snd_enemy_cultist_leafShoot;
sound_enemy_array[6] = snd_enemy_cultist_lifeLeaf_heal;
sound_enemy_array[7] = snd_enemy_cultist_stab;
sound_enemy_array[8] = snd_enemy_zealot_cultistSpawn;
sound_enemy_array[9] = snd_enemy_zealot_waterEdge;
sound_enemy_array[10] = snd_enemy_zealot_waterEdge_burst;
sound_enemy_array[11] = snd_enemy_zealot_waterSlash;
sound_enemy_array[12] = snd_enemy_endire_flame;
sound_enemy_array[13] = snd_enemy_endire_sparkfire;
sound_enemy_array[14] = snd_enemy_endireKnight_cinderDash;
sound_enemy_array[15] = snd_enemy_endireKnight_damaged;
sound_enemy_array[16] = snd_enemy_endireKnight_fireStrike;
sound_enemy_array[17] = snd_enemy_endireKnight_heatwave;
sound_enemy_array[18] = snd_enemy_endireKnight_heatwave_proj;
sound_enemy_array[19] = snd_enemy_ghost_damaged;
sound_enemy_array[20] = snd_enemy_ghost_phantomBlades;
sound_enemy_array[21] = snd_enemy_ghost_shift_down;
sound_enemy_array[22] = snd_enemy_ghost_shift_up;
sound_enemy_array[23] = snd_enemy_ghost_soulFlare;
sound_enemy_array[24] = snd_enemy_ghost_soulSkull;
sound_enemy_array[25] = snd_enemy_knife_lily_returnLeaf;
sound_enemy_array[26] = snd_enemy_lily_viceBubble;
sound_enemy_array[27] = snd_enemy_lily_viceBubble_hit;
sound_enemy_array[28] = snd_enemy_motherLily_damaged;
sound_enemy_array[29] = snd_enemy_motherLily_leafSlash;
sound_enemy_array[30] = snd_enemy_motherLily_razerSprout;
sound_enemy_array[31] = snd_enemy_motherLily_viceBomb;
sound_enemy_array[32] = snd_enemy_enragedMoth_rageCharge;
sound_enemy_array[33] = snd_enemy_enragedMoth_rageRush;
sound_enemy_array[34] = snd_enemy_enragedWorm_explode;
sound_enemy_array[35] = snd_enemy_ofa_moth_damaged;
sound_enemy_array[36] = snd_enemy_ofa_pupa_cocoonSpike;
sound_enemy_array[37] = snd_enemy_ofa_pupa_cocoonWad;
sound_enemy_array[38] = snd_enemy_ofa_pupa_damaged;
sound_enemy_array[39] = snd_enemy_ofa_worm_damaged;
sound_enemy_array[40] = snd_enemy_ofaMoth_dustStep;
sound_enemy_array[41] = snd_enemy_ofaMoth_orb;
sound_enemy_array[42] = snd_enemy_ofaMoth_shoot;
sound_enemy_array[43] = snd_enemy_ofaWorm_dash;
sound_enemy_array[44] = snd_enemy_gorogKnife_hit;
sound_enemy_array[45] = snd_enemy_gorogKnife_throw;
sound_enemy_array[46] = snd_enemy_rat_arrow;
sound_enemy_array[47] = snd_enemy_rat_arrow_hit;
sound_enemy_array[48] = snd_enemy_rat_damaged;
sound_enemy_array[49] = snd_enemy_tortoiseTroll_blossom;
sound_enemy_array[40] = snd_enemy_tortoiseTroll_blossomShoot;
sound_enemy_array[50] = snd_enemy_tortoiseTroll_damaged;
sound_enemy_array[51] = snd_enemy_tortoiseTroll_damaged02;
sound_enemy_array[52] = snd_enemy_tortoiseTroll_hammer;
sound_enemy_array[53] = snd_enemy_tortoiseTroll_lunge;
sound_enemy_array[54] = snd_enemy_tortoiseTroll_missiles;
sound_enemy_array[55] = snd_enemy_tortoiseTroll_mound_move;
sound_enemy_array[56] = snd_enemy_tortoiseTroll_vineToss;
sound_enemy_array[57] = snd_enemy_trapLily_hit;
sound_enemy_array[58] = snd_enemy_zerwerk_fireball;
sound_enemy_array[59] = snd_enemy_zerwerk_riftSlam;
sound_enemy_array[60] = snd_enemy_zerwerk_slash;
sound_enemy_array[61] = snd_enemy_zerwerk_voidRift;
//sound_enemy_array[62] = snd_enemy_;
//sound_enemy_array[63] = snd_enemy_;
//sound_enemy_array[64] = snd_enemy_;
//sound_enemy_array[65] = snd_enemy_;
//sound_enemy_array[66] = snd_enemy_;
//sound_enemy_array[67] = snd_enemy_;
//sound_enemy_array[68] = snd_enemy_;
//sound_enemy_array[69] = snd_enemy_;
//sound_enemy_array[70] = snd_enemy_;
//sound_enemy_array[71] = snd_enemy_;
//sound_enemy_array[72] = snd_enemy_;
//sound_enemy_array[73] = snd_enemy_;
//sound_enemy_array[74] = snd_enemy_;
//sound_enemy_array[75] = snd_enemy_;
//sound_enemy_array[76] = snd_enemy_;
//sound_enemy_array[77] = snd_enemy_;
//sound_enemy_array[78] = snd_enemy_;
//sound_enemy_array[79] = snd_enemy_;
//sound_enemy_array[0] = snd_enemy_;
//sound_enemy_array[1] = snd_enemy_;
//sound_enemy_array[2] = snd_enemy_;
//sound_enemy_array[3] = snd_enemy_;
//sound_enemy_array[4] = snd_enemy_;
//sound_enemy_array[5] = snd_enemy_;
//sound_enemy_array[6] = snd_enemy_;
//sound_enemy_array[7] = snd_enemy_;
//sound_enemy_array[8] = snd_enemy_;
//sound_enemy_array[9] = snd_enemy_;

}
//
//
//
//
//
//
function scr_audio_stop_enemy(){
with (obj_game)
{
	var _size = array_length(sound_enemy_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_stop_sound(sound_enemy_array[i]);
	}
}
}
//
//
//
//
//
//
function scr_audio_pause_enemy(){
with (obj_game)
{
	var _size = array_length(sound_enemy_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_pause_sound(sound_enemy_array[i]);
	}
}
}
//
//
//
//
//
//
function scr_audio_resume_enemy(){
with (obj_game)
{
	var _size = array_length(sound_enemy_array);
	for (var i = 0; i < _size; i = i + 1)
	{
		audio_resume_sound(sound_enemy_array[i]);
	}
}
}