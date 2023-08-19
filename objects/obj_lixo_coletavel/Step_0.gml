coletando = place_meeting(x, y, obj_hitbox_coleta);
coletado = place_meeting(x, y, obj_player);

//QUANDO ENTRAR EM CONTATO COM A HITBOX COLETA VAI ATÉ O JOGADOR
if(coletando){
	
	target_x = obj_player.x;
	target_y = obj_player.y;
	speed = 1; 
	direction = point_direction(x, y, target_x, target_y);
	
//SE ESTIVER SENDO SUGADO E CHEGAR NO PLAYER SE DESTROY	
	if(coletado){
		instance_destroy();
	}
}else{
	
//SE NÃO ESTIVER SENDO SUGADO NÃO SE MOVE
	speed = 0;
	
}







