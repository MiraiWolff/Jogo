if (place_meeting(x + speed, y, obj_chao))
{while(!place_meeting(x + sign(speed), y, obj_chao)){
x += sign(speed);
}
	instance_destroy();
}
if (place_meeting(x + speed, y, obj_porta_boss1))
{while(!place_meeting(x + sign(speed), y, obj_porta_boss1)){
x += sign(speed);
}
	instance_destroy();
}






