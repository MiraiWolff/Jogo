 sprl = sprite_get_width(spr_player_vida) * 2;
 buffer = 20;

for(i = 0; i < vida; i++){
	draw_sprite_ext(spr_player_vida, 0, 20 + (sprl * i) + (buffer * i), 20, 2, 2, 0, c_white, 1);
}

draw_text(200, 20, lixos_coletados);

draw_text(300, 20, dinheiro);




