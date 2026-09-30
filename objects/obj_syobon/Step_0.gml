// ==========================
// MOVIMENTO HORIZONTAL
// ==========================

var dir = keyboard_check(ord("D")) - keyboard_check(ord("A"));

hspd = dir * velocidade;


// ==========================
// COLISÃO HORIZONTAL
// ==========================

if (hspd != 0)
{
    var sinal_x = sign(hspd);

    if (tilemap_get_at_pixel(tilemap, x + hspd, y))
    {
        while (!tilemap_get_at_pixel(tilemap, x + sinal_x, y))
        {
            x += sinal_x;
        }

        hspd = 0;
    }

    x += hspd;
}


// ==========================
// GRAVIDADE
// ==========================

vel_y += gravidade;

if (vel_y > 12)
{
    vel_y = 12;
}


// ==========================
// VERIFICAR CHÃO
// ==========================

no_chao = tilemap_get_at_pixel(tilemap, x, y + 1);


// ==========================
// PULO
// ==========================

if (keyboard_check_pressed(vk_space) && no_chao)
{
    vel_y = -forca_pulo;
}


// ==========================
// COLISÃO VERTICAL
// ==========================

if (vel_y != 0)
{
    var sinal_y = sign(vel_y);

    if (tilemap_get_at_pixel(tilemap, x, y + vel_y))
    {
        while (!tilemap_get_at_pixel(tilemap, x, y + sinal_y))
        {
            y += sinal_y;
        }

        vel_y = 0;
    }
}

y += vel_y;


// ==========================
// ATUALIZAR CHÃO
// ==========================

no_chao = tilemap_get_at_pixel(tilemap, x, y + 1);


// ==========================
// ANIMAÇÕES
// ==========================

if (!no_chao)
{
    sprite_index = spr_syobon_jump;
    image_speed = 0;
}
else if (hspd != 0)
{
    sprite_index = spr_syobon_walk;
    image_speed = 0.2;
}
else
{
    sprite_index = spr_syobon_idle;
    image_speed = 0;
    image_index = 0;
}


// ==========================
// VIRAR PERSONAGEM
// ==========================

if (hspd > 0)
{
    image_xscale = 1;
}
else if (hspd < 0)
{
    image_xscale = -1;
}