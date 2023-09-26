var ataque = keyboard_check_pressed(ord("L"));
var chao = place_meeting(x, y + 1, obj_chao);
var hitado = place_meeting(x, y,obj_player_ataque);
var parede = place_meeting(x + avanco_h, y, obj_chao);
show_debug_message(estado);
show_debug_message(timer_estado);
show_debug_message(vida);

if(ataque){

	estado = 4;
}

//TODA VEZ QUE FOR HITADO PERDE VIDA E VAI PARA ESTADO HIT
if(hitado){
	vida -= dano_recebido;
	estado = 1;
}

//SE VIDA FOR 0 VAI PARA O ESTADO MORTE
if(vida = 0){
	dano_recebido = 0;
	estado = 2;
}

//SPRITE SEGUIR LADO
if(avanco_h != 0){ 
	
	xscale = sign(avanco_h);
	image_xscale = xscale;
	estado = 3;
	
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

if (parede){
	
	avanco_h = 0;
}

x += avanco_h;



//ESTADOS
switch(estado){
	
	case 0:{
		
		avanco_h = 0;
		
		timer_estado ++;
		
		image_index = 0;
		sprite_index = spr_inimigo_lixo;
		
		if(hitado){
			
			estado = 1;
			
		}else if(vida == 0){
			
			estado = 2;
			
		}
		
		if(irandom(timer_estado) > 100){
			
			estado = choose(3, 0, 3);
			timer_estado = 0;
			
		}
		scr_ataque_inimigo_melee(obj_player, dist, xscale);
		
		
		break;
	}
	case 1:{
	
		avanco_h = 0;
		sprite_index = spr_inimigo_lixo_hitado;
		
		if(image_index > image_number - 1){
			
			image_index = 0
			estado = 0;
		
		}else if(vida == 0){
			
			estado = 2;
			
		}
		
		
		break;
	
	}
	case 2:{
		
		
		sprite_index = spr_inimigo_morte;
		
		if(image_index > image_number -1){
		
			instance_destroy();
			instance_create_layer(x, y - 30,"instances",obj_lixo_latinha);
			
		}
		
		break;
		
	}
	case 3:{
		
		timer_estado ++;
		
		if(sprite_index != spr_inimigo_lixo_andando){
			
			image_index = 0;
			avanco_h = choose(2, -2);
		
		}
		
		sprite_index = spr_inimigo_lixo_andando;
		
		if(irandom(timer_estado > 100)){
		
			estado = choose(0, 3, 0);
			timer_estado = 0;
		
		}
		
		if(hitado){
			
			avanco_h = 0;
			estado = 1;
		
		}
		scr_ataque_inimigo_melee(obj_player, dist, xscale);
		
		
		break;
		
	}
	case 4:{
		
		avanco_h = 0;
		if(sprite_index != spr_inimigo_lixo_ataque){
			
			image_index = 0;
		
		}
		
		sprite_index = spr_inimigo_lixo_ataque;
		
		if(image_index > image_number -1){
			estado = 0;
		}
		
		if(image_index == image_number -2 ){
			
			var projetil = instance_create_layer(x, y - 30,"Instances", obj_inimigo_lixo_tiro);
			
			projetil.direction = xscale;
			projetil.speed = xscale * 5;
		}
	
	}
	
	
}








