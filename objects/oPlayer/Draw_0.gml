/// @description Draw Player
draw_set_font(font0)
draw_sprite_ext(sprite_index, image_index, round(x), round(y), facing, image_yscale, image_angle, c_white, image_alpha);

//DEBUG专用
draw_set_color(c_white)
draw_text(x,y-80,"PN= "+string(playerNumber));
draw_text(x,y-50,"y= "+string(y));

