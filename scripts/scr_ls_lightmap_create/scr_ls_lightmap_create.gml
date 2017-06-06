/*
-------- Lightmap Create Script
---- Here is the script that is used when a lightmap is instantiated.
-- Do not touch!
*/

if(_ls_use_views) {
    lightmap = surface_create(__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));
}
else {
    lightmap = surface_create(room_width, room_height);
}

lightmap_update_count = 0;
