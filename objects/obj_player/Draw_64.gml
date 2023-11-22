 sprl = sprite_get_width(spr_player_vida) * 2;
 buffer = 20;

for(i = 0; i < vida; i++){
	draw_sprite_ext(spr_player_vida, 0, 20 + (sprl * i) + (buffer * i), 20, 2, 2, 0, c_white, 1);
}

draw_text(600, 20, lixos_coletados);

draw_text(700, 20, dinheiro);

//GAME OVER

if (global.game_over) {
    if (global.fade_intensity < 1) {
        global.fade_intensity += 0.01; 
    }

    draw_set_color(c_black);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);

    draw_set_color(c_white);
    draw_text(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, "Game Over");
}



