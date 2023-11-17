
if(estado == 1){
	sprite_index = spr_tartaruga_presa_liberacao;
	if(image_index == image_number - 1){
		instance_destroy();
		instance_create_layer(x, y, "instances", obj_tartaruga);
	}
}



