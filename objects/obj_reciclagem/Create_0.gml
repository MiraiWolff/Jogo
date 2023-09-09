tipo_lixo = 0;

tipo_lixo = choose(0, 1);

if(tipo_lixo == 0){
	instance_create_layer(92, 29, "instances", obj_lixo_latinha);
}else if(tipo_lixo == 1){
	instance_create_layer(92, 29, "instances", obj_lixo_saco_plastico);
}

criar = 0;

alarm[0] = 0;






