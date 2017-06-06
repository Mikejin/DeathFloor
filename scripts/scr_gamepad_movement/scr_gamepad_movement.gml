/// scr_move(device)
var device = argument0;

// get_gamepad_input
xaxis = gamepad_axis_value(device, gp_axislh);
yaxis = gamepad_axis_value(device, gp_axislv);

//magnitude = point_distance(0, 0, xaxis, yaxis);
//if (magnitude > 1) magnitude = 1;

//Get User Input
//水平方向
if xaxis > 0.2
{
input_right = true
}
else if xaxis < -0.2
{
input_left = true
}
else
{
input_left = false;
input_right = false;
}
//垂直方向
if yaxis > 0.2
{
input_down = true
}
else if yaxis < -0.2
{
input_up = true
}
else
{
input_up = false;
input_down = false;
}
