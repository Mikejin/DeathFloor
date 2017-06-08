
if (surface_exists(surface)) { //If our surface exists - to make sure the game doesn't crash if it doesn't exist
    draw_set_blend_mode_ext(bm_zero, bm_src_colour); //bm_zero sets the blend factor to black with 0 alpha which then gets factored together by the source colour (Note: There is a really good explanation of blend modes in the game maker help <Press F1>)
    draw_surface(surface, room_width,room_height); //Draw the surface!
    draw_set_blend_mode(bm_normal); //Reset the blend mode
}

