//USAGE: jfx_spring(duration, wobble speed (aggressiveness), wobble elongation);
var time = argument0; //How long the animation should play - we set this to our variable "time" in the object
var factor = argument1; //This is the agressiveness of the wobble effect - the lower the number the more it wobbles
var wobble = argument2; //The wobble elongation, the lower the number the more elongated the wobble gets

//Now the maths for the actual effect
var value = power(2, -wobble * time) * sin((time - factor / 4) * (2 * pi) / factor) + 1;

return value; //Returns our calculated number
