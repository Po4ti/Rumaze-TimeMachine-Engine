/// @description become killer if triggered

if(global.trigger[trg]) {
	instance_destroy();	
	instance_create_layer(x,y,layer,obj);
}
