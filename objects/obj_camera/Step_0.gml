var cam_x = obj_syobon.x - camera_width / 2;
var cam_y = obj_syobon.y - camera_height / 2;

// Impede a câmera de sair da Room
cam_x = clamp(cam_x, 0, room_width - camera_width);
cam_y = clamp(cam_y, 0, room_height - camera_height);

// Move a câmera
camera_set_view_pos(camera, cam_x, cam_y);