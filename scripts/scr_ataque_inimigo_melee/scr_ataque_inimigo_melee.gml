///@function scr_ataque_inimigo_melee()
///@arg player
///@arg dist
////@arg xscale

function scr_ataque_inimigo_melee(outro, dist, xscale){
	
	var player = collision_line(x, y - 30, x + (dist * xscale), y - 30, outro, 0, 1);

	if(player){
		
		avanco_h = 0;
		estado = 4;
		
	}
}