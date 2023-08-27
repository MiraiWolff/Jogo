var chao = place_meeting(x, y + 1, obj_chao);
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));
var pulando = keyboard_check_pressed(ord("W"));
var coleta = keyboard_check(vk_space);
var ataque = keyboard_check_pressed(ord("K"));

var restart = keyboard_check_pressed(ord("R"));

if(restart){
	game_restart();
}

//MOVIMENTO HORIZONTAL
var avanco_h = (direita - esquerda) * velocidade_h_max; 


 // GRAVIDADE
if (!chao)
{
  velocidade = velocidade_voar;
  velocidade_vertical += gravidade;
  
}
else
{
   velocidade = velocidade_terreno
}

//COLISÃO
if (place_meeting(x + avanco_h, y, obj_chao))
{while(!place_meeting(x + sign(avanco_h), y, obj_chao)){
x += sign(avanco_h);
}
	avanco_h = 0;
}

x += avanco_h;


if (place_meeting(x, y + velocidade_vertical, obj_chao))
{while(!place_meeting(x, y + sign(velocidade_vertical), obj_chao)){
y += sign(velocidade_vertical);
}
velocidade_vertical = 0;
}

y += velocidade_vertical; 

//PULO
if (chao && pulando) 
{
	estado = 2;
    velocidade_vertical += -pulo;
}

//LADO PARADO
if(avanco_h != 0){ 
	
	xscale = sign(avanco_h);
	image_xscale = xscale;
	
}
//SE SEGURAR ESPAÇO INICIA A HITBOX DE COLETA
if(coleta){
	
	if(image_xscale > 0){
		instance_create_layer(x + 10, y - 20, "instances", obj_hitbox_coleta);
	}else if(image_xscale < 0){
		instance_create_layer(x - 10, y - 20, "instances", obj_hitbox_coleta);
	}
	
}

//ATAQUE
if(ataque){
	
	instance_create_layer(x, y,"instances",obj_player_ataque);
	estado = 3;
	
}

//TROCA DE ESTADOS
switch(estado){
	//ESTADO PARADO
	case 0:{
			sprite_index = spr_player_parado_direita;
			
			if(avanco_h != 0){
				
				estado = 1;
				
				}else if(!chao){
					
					estado = 2;
					
				}
		
		break;
	}
	//ESTADO CORRENDO
	case 1:{
		
			sprite_index = spr_player_correndo;
			
		if(avanco_h == 0){
			
			estado = 0;
			
		}else if(!chao){
			
			estado = 2;
			image_index = 0;
					
		}else if(ataque){
				
			estado = 3;
			velocidade_h_max = 0;
			image_index = 0;
				
			}
		
		break;
		
	}
	//ESTADO PULANDO
	case 2:{
		if(velocidade_vertical > 0){
			
			sprite_index = spr_player_caindo;
			
			
		}else if(velocidade_vertical < 0){
			
			sprite_index = spr_player_pulando;
			
			//GARANTINDO QUE ANIMAÇÃO NÃO SE REPITA
			if(image_index >= image_number - 1){
				image_index = image_number - 1;
			}
			
		}else if(chao && avanco_h == 0){
			
			estado = 0;
		}else if(chao && avanco_h != 0){
			
			estado = 1;
		}
		break;
	}
	//ESTADO ATACANDO
	case 3:{
		 
		 sprite_index = spr_player_ataque;
		 
		 velocidade_h_max = 0;
	
		if(image_index > image_number - 1){
			
			estado = 0;
			velocidade_h_max = 4;
			
		}
	
	}
}






