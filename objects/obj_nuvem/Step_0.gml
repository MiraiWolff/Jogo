// No evento Step do objeto que deseja mover
if (x > room_width) {
    x = 0 - sprite_width; // Reposicione o objeto no lado oposto e ajuste a posição com base na largura do sprite
} else if (x < 0 - sprite_width) {
    x = room_width; // Reposicione o objeto no lado oposto
}



