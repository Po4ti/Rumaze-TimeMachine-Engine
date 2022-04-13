///@description Rotating and disappearing

image_alpha -= 0.06;
image_angle += 4;

if (image_alpha < 0)
{
    instance_destroy();
}