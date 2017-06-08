/// @description Draw Player
draw_set_font(font0)
//DEBUG专用
draw_set_color(c_white)
draw_text(x,y-80,"PN= "+string(playerNumber));
draw_text(x,y-50,"y= "+string(y));

if (hit) 
{ 
shader_set(shader_0);    // Sets the shader to our shader file we created earlier
draw_sprite_ext(sprite_index,image_index,round(x),round(y),facing,image_yscale,image_angle,c_red,image_alpha)  // Draws the sprite, but now we have a shader set so it draws it as white
shader_reset(); // Resets the shader to the default one (does nothing)
} 
else 
{
draw_sprite_ext(sprite_index,image_index,round(x),round(y),facing,image_yscale,image_angle,c_white,image_alpha) // If hit is false, no shader is applied.
}
