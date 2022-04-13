/// @description Increase scale when available
if(available && image_xscale < 1)
{
	image_xscale += 1/20;
	image_yscale = image_xscale;
}
