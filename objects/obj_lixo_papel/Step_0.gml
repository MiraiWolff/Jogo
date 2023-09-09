coleta = place_meeting(x, y, obj_lixo_azul);
coletando = place_meeting(x, y, obj_hitbox_coleta);
coletado = place_meeting(x, y, obj_player);
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));

//QUANDO ENTRAR EM CONTATO COM A HITBOX COLETA VAI ATÉ O JOGADOR
if(coletando){
	
	target_x = obj_player.x;
	target_y = obj_player.y;
	speed = 1; 
	direction = point_direction(x, y + 20, target_x, target_y);
	
	
//SE ESTIVER SENDO SUGADO E CHEGAR NO PLAYER SE DESTROY	
if(coletado){
		
		obj_player.lixos_coletados ++;
		instance_destroy();
		
	}
}else{
	
//SE NÃO ESTIVER SENDO SUGADO NÃO SE MOVE
	speed = 0;
	
}


//FAZENDO RECICLAGEM NA ROOM RECICLAGEM
if(room == rm_reciclagem){
	
	
	var avanco_h = (direita - esquerda) * velocidade_h_max;
	x += avanco_h;
	y += gravidade
		
if(coleta){
		
		instance_destroy();
		obj_player.lixos_coletados --
		obj_player.dinheiro ++;
		
		if(obj_player.lixos_coletados >= 0){
		
			obj_reciclagem.criar = 1;
			obj_reciclagem.alarm[0] = 1000;
		
		}else if(obj_player.lixos_coletados < 0){
		
			obj_reciclagem.criar = 0;
		
		}		
		
	}
	


}








