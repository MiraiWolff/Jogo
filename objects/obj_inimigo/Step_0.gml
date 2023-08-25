var chao = place_meeting(x, y + 1, obj_chao);
var hitado =place_meeting(x, y,obj_player_ataque);

//TODA VEZ QUE FOR HITADO PERDE VIDA E VAI PARA ESTADO HIT
if(hitado){
	vida --;
	estado = 1;
}

//SE VIDA FOR 0 VAI PARA O ESTADO MORTE
if(vida = 0){
	
	estado = 2;
}

//GRAVIDADE
if (!chao)
{
  velocidade = velocidade_voar;
  velocidade_vertical += gravidade;
  
}

//COLISAO
if (place_meeting(x, y + velocidade_vertical, obj_chao))
{while(!place_meeting(x, y + sign(velocidade_vertical), obj_chao)){
y += sign(velocidade_vertical);
}
velocidade_vertical = 0;
}

y += velocidade_vertical; 

//ESTADOS
switch(estado){
	
	case 0:{
		
		image_index = 0
		sprite_index = spr_inimigo;
		
		if(hitado){
			estado = 1;
		}
		
		break;
	}
	case 1:{
	
		sprite_index = spr_inimigo_hit;
		
		if(image_index > image_number - 1){
			
			image_index = 0
			estado = 0;
		
		}else if(vida == 0){
			
			image_index = 0
			estado = 2;
			
		}
		
		break;
	
	}
	case 2:{
		
		
		sprite_index = spr_inimigo_morte;
		
		if(image_index > image_number -1){
		
			instance_destroy();
			instance_create_layer(x, y - 30,"instances",obj_lixo_coletavel);
		
		}
		
		break;
		
	}
	

}