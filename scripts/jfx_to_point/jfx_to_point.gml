//USAGE: jfx_to_point(object, x, y, speed);
var object = argument0; //The instance we want to move
var xx = argument1; //To what x position
var yy = argument2; //To what y position
var spd = argument3; //The speed it should move

//The following eventually moves the assigned object
object.x += (xx - object.x) * spd; 
object.y += (yy - object.y) * spd;
