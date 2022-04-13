/// @description Animation

if(image_yscale < 1)
{
    if (!disappear)
    {
        image_yscale += 0.1;
    }
} else
{
    if (!disappear)
    {
        disappear = true;
    }
}

if(speed == 0 && disappear)
{
    if(image_yscale > 0)
    {
        image_yscale -= 0.1;
    }
    else
    {
        instance_destroy();
    }
}
