tipo_lixo = 0;

tipo_lixo = choose(0, 1, 2, 3, 4);

if(tipo_lixo == 0){
	
	instance_create_layer(92, 29, "instances", obj_lixo_latinha);
	
}else if(tipo_lixo == 1){
	
	instance_create_layer(92, 29, "instances", obj_lixo_saco_plastico);
	
}else if(tipo_lixo == 2){
	
	instance_create_layer(92, 29, "instances", obj_lixo_papel);
	
}else if(tipo_lixo == 3){

	instance_create_layer(92, 29, "instances", obj_lixo_vidro);

}else if(tipo_lixo == 4){

	instance_create_layer(92, 29, "instances", obj_lixo_organico);

}

criar = 0;

alarm[0] = 0;






