////////////////
// this can be attached to an object with camera to limit in and out mouse scroll
////////////////
#pragma strict

var scrollCount = 0;
var lastAxis = 0;
var scrollWheelDir = 0;
var moveCamFlag : boolean = false;
function Update () 
{
	// check for mouse wheel scroll
	if(Input.GetAxis("Mouse ScrollWheel") < 0) //back scroll
	{
		lastAxis = scrollCount;
		scrollCount++;
		moveCamFlag = true;
	}
	if(Input.GetAxis("Mouse ScrollWheel") > 0) //forward scroll
	{
		lastAxis = scrollCount;
		scrollCount--;
		moveCamFlag = true;
	}
	
	// keep camera where player is in full view or not too far away
	if(scrollCount <= -2)
	{
		moveCamFlag = false;
		scrollCount++;
	}
	else if(scrollCount >= 6)
	{
		moveCamFlag = false;
		scrollCount--;
	}
	
	// handle moving forward or backward on cam if moveCamFlag is enabled
	if((scrollCount < lastAxis) && moveCamFlag)
	{
		//move along vector axis Z
		transform.position -= transform.TransformDirection(Vector3.forward * (-1));
		moveCamFlag = false;
	}
	else if((scrollCount > lastAxis) && moveCamFlag)
	{
		//move along vector axis Z
		transform.position += transform.TransformDirection(Vector3.back * 1);
		moveCamFlag = false;
	}
}