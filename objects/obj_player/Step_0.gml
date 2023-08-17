var chao = place_meeting(x, y + 1, obj_chao);
var esquerda = keyboard_check(ord("A"));
var direita = keyboard_check(ord("D"));
var pulando = keyboard_check_pressed(ord("W"));

//MOVIMENTO HORIZONTAL
var avanco_h = (direita - esquerda) * velocidade_h_max; 


 // GRAVIDADE
if (!chao)
{
  velocidade = velocidade_voar;
  velocidade_vertical += gravidade;
}
else
{
   velocidade = velocidade_terreno
}

//COLISÃO
if (place_meeting(x + avanco_h, y, obj_chao))
{while(!place_meeting(x + sign(avanco_h), y, obj_chao)){
x += sign(avanco_h);
}
avanco_h = 0;
}

x += avanco_h;


if (place_meeting(x, y + velocidade_vertical, obj_chao))
{while(!place_meeting(x, y + sign(velocidade_vertical), obj_chao)){
y += sign(velocidade_vertical);
}
velocidade_vertical = 0;
}

y += velocidade_vertical; 

//PULO
if (chao && pulando) 
{
    velocidade_vertical += -pulo;
}

if(sign(avanco_h) == 1){
	sprite_index = spr_player_parado_direita;
}if(sign(avanco_h) == -1){
	sprite_index = spr_player_parado_esquerda;
}

