//SE PLAYER SALVAS AS TARTARUGAS PORTA DESCE E SOME
if(obj_player.tartarugas_salvas = 1 and sobe == 0){
	sprite_index = spr_porta_boss1_queda;
	if(image_index >= image_number - 1){
		image_alpha = 0;
		sobe = 1;
	}
	
}
if(sobe == 1){
show_debug_message("assadasdassaddasda");
}

//SE PLAYER ENTRA NA ARENA PORTA SOBE
if (collision_line(x + 80, y + 128, x + 80, y - 50,obj_player, 0, 1 ) and sobe == 1) { 
	sobe = 2;
	image_alpha = 1;
	sprite_index = spr_porta_boss1_sobe;
}

if(sobe == 2){
show_debug_message("312312312312");
}

if (sobe == 2 and image_index >= image_number - 1){ 
	sobe = 3;
	sprite_index = spr_porta_boss1;
	instance_create_layer(x + 550, y + 128, "Instances", obj_boss1);
}




