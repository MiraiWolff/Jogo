var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;
randomize();
velocidade = 2
gravidade = 0.3;
velocidade_terreno = velocidade;
velocidade_voar = 0.4;
velocidade_horizontal = 0;
velocidade_vertical = 0;
velocidade_h_max = 4;
pulo = 7;
pulo_espinho = 3;
lado = 0;
estado = 0;
xscale = 1;
dano = 1;
vida = 5;
alfa_hit = 0;
alarm[0] = 0;
dinheiro = 10;
lixos_coletados = 20;
tartarugas_salvas = 0; 