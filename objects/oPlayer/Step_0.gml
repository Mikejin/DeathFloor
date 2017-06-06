
//Walkin' around.
if (magnitude >= threshold) 
	{
		moveDirection = point_direction(0,0,xaxis,yaxis);	
		x += hspd;
	}

hspd  =  lengthdir_x(moveSpeed,moveDirection)




//Move also the light to mouse position
light.x = mouse_x;
light.y = mouse_y;

