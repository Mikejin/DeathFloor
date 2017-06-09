draw_set_color(c_white);
for (i =0; i< ds_list_size(canSeeMe); i ++)
{
	draw_text(200+playerNumber*800,200+20*i,string(ds_list_find_value(canSeeMe,i)));
}

