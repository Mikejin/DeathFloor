/*
-------- Light Draw Script
---- Draw the resulting light on the lightmap
-- Do not touch!
*/
if(surface_exists(lightsurface)) {
    if(_ls_use_views) {
        draw_surface(lightsurface, x - radius - __view_get( e__VW.XView, 0 ), y - radius - __view_get( e__VW.YView, 0 ));
    }
    else {
        draw_surface(lightsurface, x - radius, y - radius);
    }
}
