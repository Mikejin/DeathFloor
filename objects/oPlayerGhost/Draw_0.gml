/// @description Insert description here
var i;
for (i = 0; i < ds_list_size(master.findMe); i++)
{
	if view_current = ds_list_find_value(master.findMe,i).playerNumber
	{
	draw_sprite_ext(master.sprite_index,master.image_index,master.x,master.y,master.image_xscale*1.01 *master.facing,master.image_yscale*1.01,0,c_gray,0.4);
	}
}

if view_current = master.playerNumber
	{
	draw_sprite_ext(master.sprite_index,master.image_index,master.x,master.y,master.image_xscale*1.01 *master.facing,master.image_yscale*1.01,0,c_gray,0.4);
	}
