//USAGE: jfx_linear(speed, start, final);
var spd = argument0; //The speed of the effect
var start = argument1; //Where it should start
var final = argument2; //and where it should end

//This will decrease/increase the value to "final" linearly
if (start < final) {
    var value =  min(start + spd, final); 
} else {
    var value = max(start - spd, final);
}

return value; //Returns our calculated value
