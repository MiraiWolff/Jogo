baixo = keyboard_check_pressed(ord("S"));
cima = keyboard_check_pressed(ord("W"));
escolher = keyboard_check_pressed(vk_enter);

//SELECIONA OPÇÃO DO MENU
if(baixo){
	
	index ++;
	if(index > array_length(opcoes) - 1){
		index = 0;
	}
	
}

if(cima){
	
	index --;
	if(index < 0){
		index = array_length(opcoes) - 1;
	}
	
}

//FAZ COM SE DER ENTER NO SAIR O JOGO FECHA
if(escolher && index = array_length(opcoes) - 1){
	game_end();
}else if(escolher && index = 0){
	room_goto(Room1);
}







