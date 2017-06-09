draw_set_color(c_white);
//显示发现我的玩家列表
for (i =0; i< ds_list_size(findMe); i ++)
{
	draw_text(200,200+playerNumber*500+30*i,string(ds_list_find_value(findMe,i)));

}

draw_text(200,270+playerNumber*500,focus);
draw_text(200,300+playerNumber*500,temp);
draw_text(200,320+playerNumber*500,instance_number(oPlayerFlashLight));


draw_text(1000,500,mouse_x);
draw_text(1000,540,mouse_y);
