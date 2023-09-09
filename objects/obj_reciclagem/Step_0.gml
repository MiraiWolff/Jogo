//SÓ CRIA LIXO SE O ALARM FOI MAIR QUE UM E CRIAR FOR 1 DEFINIDO NO
//LIXO COLETAVEL
if(alarm[0] > 0 && criar == 1){
	
	tipo_lixo = choose(0, 1);
	
	switch(tipo_lixo){
	
		case 0:{
			instance_create_layer(92, 29, "instances", obj_lixo_latinha);
			break;
		}
		
		case 1:{
			instance_create_layer(92, 29, "instances", obj_lixo_saco_plastico);
			break;
		}
	
	}
	//ZERA O ALARME PARA ASSIM CRIAR SÓ UM
	alarm[0] = 0;
}
show_debug_message(criar);




