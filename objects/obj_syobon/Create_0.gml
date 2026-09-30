// ==========================
// MOVIMENTO
// ==========================

velocidade = 4;
gravidade = 0.5;
forca_pulo = 10;

hspd = 0;
vel_y = 0;
no_chao = false;


// ==========================
// TILEMAP
// ==========================

tilemap = layer_tilemap_get_id("Tiles_3");

if (tilemap == -1)
{
    show_debug_message("ERRO: Tilemap 'Tiles_3' não encontrado!");
}