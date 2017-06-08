/*
Thank you for purchasing Epic Lighting!

READ ME:

EPIC LIGHTING
made by: wupto

If you have any questions or if something isn't working please contact me!
Skype: wuptodev
Twitter: @wupto
E-Mail: service@wupto.net

Note:
You are only allowed to use any of this if you purchased it via the Game Maker Marketplace
*/

//Randomize everything
randomize(); //This deletes all the numbers out of your RAM, just to ensure every restart is different

surface = surface_create(room_width,room_height); //Fist we create a surface with the size of what we see (the whole view) 

//VARIABLES

//Those are variables for the darkness of the room
surface_control = 0; //With that we will decide if the room should get darker or brighter
surface_alpha = 0.05; //This is the overlays alpha, as you will see in the step event, the higher this gets the brighter the room is

/* */
/*  */
