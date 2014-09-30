#pragma strict

var target 			: Transform; 
var targetPostition	: Vector3;

//function Start()
//{
//
//}

function Update()
{
	targetPostition = new Vector3(target.position.x, this.transform.position.y, target.position.z);
	this.transform.LookAt(targetPostition);
}

