if (place_meeting(x + speed, y, obj_chao))
{while(!place_meeting(x + sign(speed), y, obj_chao)){
x += sign(speed);
}
	instance_destroy();
}







