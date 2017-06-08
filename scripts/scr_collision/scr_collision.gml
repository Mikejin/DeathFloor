//Horizontal Collision and Movement
if(place_meeting(x + xspeed, y, object_solid))                  
{                                                               
    while(!place_meeting(x + sign(xspeed), y, object_solid))    
    {                                                           
        x += sign(xspeed);                                      
    }
    xspeed = 0;
}
x += xspeed;

//Vertical Collision and Movement
if(place_meeting(x, y + yspeed, object_solid))
{
    while(!place_meeting(x, y + sign(yspeed), object_solid))
    {
        y += sign(yspeed);
    }
    yspeed = 0;
}
y += yspeed;

//是否下落
if(place_meeting(x, y + 1, object_solid))
{
    grounded = true;
}
else
{
    grounded = false;
}