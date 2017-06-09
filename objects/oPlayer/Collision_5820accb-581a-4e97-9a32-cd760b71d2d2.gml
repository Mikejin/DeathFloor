if other.image_index = 2 and other.master != id
{
	hit = true;
}

if other.x -x <0 //攻击来自左边
{
	fallDir = 1
}
else
{
	fallDir = -1;
}