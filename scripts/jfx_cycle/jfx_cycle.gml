//USAGE: jfx_cycle(duration, amount of cycles)
var time = argument0; //How long the animation should play - we set this to our variable "time" in the object
var cycles = argument1; //The amount of cycles we want

//Now the maths for the actual effect
var value = sin(2 * cycles * pi * time);

return value; //Returns our calculated value
