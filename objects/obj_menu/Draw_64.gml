//DESENHA AS OPÇÕES DO MENU DA COR BRANCA
draw_set_font(ft_menu);
draw_set_color(c_white);

for(i = 0; i < array_length(opcoes); i++){
	
	//CENTRALIZA O MENU
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	//MOSTRA COR DIFERENTE PARA ITEM DO MENU SELECIONADO
	if(index == i){
		draw_set_color(c_yellow);
	}else{
		draw_set_color(c_white);
	}
	
	//DESENHA O MENU CENTRALIZADO
	draw_text(x1, y1 + (dist * i), opcoes[i]);
	
}

draw_set_font(-1);









