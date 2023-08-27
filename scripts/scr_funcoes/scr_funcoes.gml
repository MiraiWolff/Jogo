
//Sreenshake
///@function screenshake(valor_tremida)
///@arg forca_tremida
function screenshake(treme){
	
	var shake = instance_create_layer(0, 0, "instances", obj_screenshake);
	shake.shake = treme;
}