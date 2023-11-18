var chao = place_meeting(x, y + 1, obj_chao);
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));
var pulando = keyboard_check_pressed(ord("W"));
var coleta = keyboard_check(vk_space);
var ataque = keyboard_check_pressed(ord("K"));
var restart = keyboard_check_pressed(ord("R"));
var room_reciclagem = keyboard_check_pressed(ord("T"));
var resgate = keyboard_check_pressed(ord("E"));
show_debug_message(tartarugas_salvas);

//VAI PARA RM_RECICLAGEM
if(room_reciclagem) and place_meeting(x,y,obj_ponto_reciclagem){
	
	room_goto(rm_reciclagem);

}

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

if (place_meeting(x + avanco_h, y, obj_porta_boss1) and obj_porta_boss1.image_alpha == 1){
	while(!place_meeting(x + sign(avanco_h), y, obj_porta_boss1)){
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
if(coleta && chao){
	
	estado = 5;
	if(image_xscale > 0){
		instance_create_layer(x + 10, y - 20, "instances", obj_hitbox_coleta);
	}else if(image_xscale < 0){
		instance_create_layer(x - 10, y - 20, "instances", obj_hitbox_coleta);
	}
	
}

show_debug_message(vida);

//RECEBENDO DANO E FICANDO INTANGIVEL
if(place_meeting(x, y, obj_inimigo_lixo_tiro) or place_meeting(x, y, obj_boss1_tiro)){
	
	if alarm[0] <=  0{
		vida -= 1;
		alarm[0] = 180;
		screenshake(3);
	}

}
if(alarm[0] > 0){
		
		if(image_alpha >= 1){
			alfa_hit = -0.05;
		}else if(image_alpha <= 0){
			alfa_hit = 0.05;
		}
		image_alpha += alfa_hit;	
	}else{
	
		image_alpha = 1;
	}

//MORTE
if(vida <= 0){
	
	estado = 4;
	image_alpha = 1;
	alarm[0] = 0;
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
		
			velocidade_h_max = 4;
			pulo = 7;
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
		
			sprite_index = spr_player1_correndo;
			
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
			
			sprite_index = spr_player1_pulando;
			
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
		 
		 sprite_index = spr_player1_ataque;
		 
		 velocidade_h_max = 0;
	
		if(image_index > image_number - 1){
			
			estado = 0;
			velocidade_h_max = 4;
			
		}
		break;
	}
	//ESTADO MORTE
	case 4:{
		
		velocidade_h_max = 0;
		pulo = 0;
		if(sprite_index != spr_player1_morte){
			
			image_index = 0;
			sprite_index = spr_player1_morte;
		}
		
		if(image_index >= image_number - 1){
		
			image_index = image_number - 1;
		}
		break;
	}
	//ESTADO COLETA
	case 5:{
	
		velocidade_h_max = 0;
		pulo = 0;
		if(sprite_index != spr_player_sugando){
			
			image_index = 0;
			sprite_index = spr_player_sugando;
		}
		
		if(!coleta){
			
			estado = 0;
		}
		
		break;
	}
	
}

//DIALOGO
if distance_to_object(obj_par_npcs) <= 10 {
	
	if (keyboard_check_pressed(ord("C")) and global.dialogo == false){
		var _npc = instance_nearest(x, y, obj_par_npcs);
		var _dialogo = instance_create_layer(x, y, "Dialogo", obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
	}
}

//NÃO SE MOVER OU PULAR NO DIALOGO
if(global.dialogo == true){
	velocidade_h_max = 0;
	pulo = 0;
}else{
	velocidade_h_max = 4;
	pulo = 7;
}

//SALVAR TARTARUGA
if (resgate) {
 
    var tartaruga = instance_place(x, y, obj_tartaruga_presa);

    if (tartaruga != noone) {
        tartaruga.estado = 1;
		tartarugas_salvas ++;
    }
}


