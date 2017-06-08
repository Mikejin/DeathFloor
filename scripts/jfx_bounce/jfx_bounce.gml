//USAGE: jfx_bounce(time);
var time = argument0; //How long the animation should play - we set this to our variable "time" in the object

//This is the effect
if (time < 0.3535) {
    value = jfx_bounce_calc(time);
} else if (time < 0.7408) {
    value = jfx_bounce_calc(time - 0.54719) + 0.7;
} else if (time < 0.9644) {
    value = jfx_bounce_calc(time - 0.8526) + 0.9;
} else {
    value = jfx_bounce_calc(time - 1.0435) + 0.95;
}

return value; //Returns our calculated value
